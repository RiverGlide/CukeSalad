$:.unshift(File.dirname(__FILE__), ".")
require 'spec_helper'
require 'cukesalad/cli'

# don't override aruba path
module CukeSalad
  class CLI
    class Structure
      def initialize
      end
    end
  end
end

def dir_exists? file
  File.exists?("tmp/aruba/"+file)
end

def file_content file
  IO.read("tmp/aruba/"+file)
end

alias :file_exists? :dir_exists?

describe CukeSalad::CLI do

  shared_examples_for "setup cukesalad and cucumber" do
    it 'creates features directory' do
      dir_exists?(features).should be_true
    end

    context 'in features' do
      it 'creates support directory' do
        dir_exists?(features+'/support').should be_true
      end

      context 'in support' do
        let(:file) { features+'/support/env.rb' }

        it 'creates a file env.rb' do
          file_exists?(file).should be_true
        end

        it 'env.rb has the right content' do
          content = "require 'cukesalad'\n begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end"
          file_content(file).should == content
        end
      end

      it 'creates lib directory' do
        dir_exists?(features+'/lib').should be_true
      end

      context 'in lib' do
        it 'creates roles directory' do
          dir_exists?(features+'/lib/roles').should be_true
        end

        it 'creates tasks directory' do
          dir_exists?(features+'/lib/tasks').should be_true
        end
      end
    end
  end

  context 'Create new project foobar' do
    let(:new_project) { 'foobar' }
    let(:features) { new_project + "/features" }

    before(:all) do
      CukeSalad::CLI.create_new_project(new_project)
    end

    it "creates the project directory" do
      dir_exists?(new_project).should be_true
    end

    it_should_behave_like "setup cukesalad and cucumber"
  end

  context 'Setup existing project' do
    let(:features) { 'features' }

    before(:all) do
      CukeSalad::CLI.configure_existing_project
    end
    it_should_behave_like "setup cukesalad and cucumber"
  end

  after(:all) do
    FileUtils.rm_rf 'tmp'
  end
end
