require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake/dsl_definition'
require 'rake'
Bundler::GemHelper.install_tasks

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
  spec.rspec_opts = "-cfd"
end

require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:cucumber)
Cucumber::Rake::Task.new(:wip) do |wip|
  wip.cucumber_opts = "-p wip"
end

task :default => [:spec, :cucumber]

require 'rdoc/task'
RDoc::Task.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "CukeSalad #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'relish/command'
namespace :relish do
  task :create do
    `relish projects:add RiverGlide/CukeSalad`
  end

  task :push do
    `relish push CukeSalad:#{CukeSalad::VERSION}`
  end

  namespace :version do
    task :add do
      `relish versions:add CukeSalad:#{CukeSalad::VERSION}`
    end
  end
end
