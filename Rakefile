require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "cuke_salad"
  gem.homepage = "https://github.com/RiverGlide/CukeSalad"
  gem.license = "MIT"
  gem.summary = %Q{Friction Free BDD/ATDD with cucumber}
  gem.description = %Q{CukeSalad allows you to focus on the tasks at hand - expressing examples, the roles involved in those examples and the tasks that those roles need to perform with the product under development.}
  gem.email = "talktous@riverglide.com"
  gem.authors = ["RiverGlide"]

  # The following two lines need to be commented out in order to gain access to the version rake tasks
  gem_version = File.exist?('VERSION') ? File.read('VERSION') : ""
  gem.version = gem_version

end

Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
  spec.rspec_opts = "-cfd"
end

require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:cucumber)

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "CukeSalad #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
