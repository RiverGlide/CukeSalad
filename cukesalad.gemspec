# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cukesalad/version"

Gem::Specification.new do |s|
  s.name        = "cukesalad"
  s.version     = CukeSalad::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["RiverGlide"]
  s.email       = ["talktous@riverglide.com"]
  s.homepage    = "https://github.com/RiverGlide/CukeSalad"
  s.summary     = %q{Friction Free BDD/ATDD with cucumber}
  s.description = %q{CukeSalad allows you to focus on the tasks at hand - expressing examples, the roles involved in those examples and the tasks that those roles need to perform with the product under development.}

  s.licenses = ["MIT"]

  s.files              = `git ls-files`.split("\n")
  s.test_files         = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables        = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.default_executable = "cukesalad"
  s.require_paths      = ["lib"]

  s.add_runtime_dependency "cucumber", ">=0.10.0"
  s.add_runtime_dependency "rspec",    ">=2.5.0"
  s.add_runtime_dependency "aruba",    ">=0.3.5"

  s.add_development_dependency "bundler", "~> 1.0.0"
  s.add_development_dependency "rake", "~> 0.8.7"
  s.add_development_dependency "relish", "= 0.3.0"
end
