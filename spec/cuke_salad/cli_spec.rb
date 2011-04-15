$:.unshift(File.dirname(__FILE__), ".")
require 'spec_helper'
require 'cuke_salad/cli'

describe CukeSalad::CLI do
  let(:project) { 'Foobar' }
  let(:features) { project+'/features'}

  shared_examples_for "setup cuke_salad and cucumber" do
    it 'Can create features directory' do
      dir_exists?(features).should be_true
    end

    it 'can create features/support directory' do
      dir_exists?(features+'/support').should be_true
    end

    context 'in cuke_salad/features/support' do
      let(:file) { features+'/support/env.rb' }

      it 'can create a file env.rb' do
        File.exists?(file).should be_true
      end

      it 'with a given content' do
        content = "require 'cuke_salad'\n begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end"
        IO.read(file).should == content
      end
    end

    it 'can create lib directory' do
      dir_exists?(features+'/lib').should be_true
    end

    it 'can create lib/default directory' do
      dir_exists?(features+'/lib/default').should be_true
    end

    it 'can create features/lib/roles directory' do
      dir_exists?(features+'/lib/default/roles').should be_true
    end

    it 'can create tasks directory' do
      dir_exists?(features+'/lib/default/tasks').should be_true
    end
  end


  context 'Create new project Foobar' do

    before(:all) do
      cli = CukeSalad::CLI.create_new_project(project)
    end

    it "Can create the project directory" do
      dir_exists?(project).should be_true
    end

    it_should_behave_like "setup cuke_salad and cucumber"
  end

  context 'Setup existing project' do
    before(:all) do
      `cd Foobar`
      CukeSalad::CLI.configure_existing_project
    end
    it_should_behave_like "setup cuke_salad and cucumber"
  end


  def dir_exists? file
    File.exists?(file)
  end

  after(:all) do
    FileUtils.rm_rf project
  end
end
