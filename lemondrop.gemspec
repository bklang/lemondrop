# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "lemondrop/version"

Gem::Specification.new do |s|
  s.name        = "lemondrop"
  s.version     = Lemondrop::VERSION
  s.authors     = ["Ben Klang"]
  s.email       = ["bklang@mojolingo.com"]
  s.homepage    = ""
  s.summary     = %q{Redis plugin for Adhearsion}
  s.description = %q{This gem provides a plugin for Adhearsion, allowing you to create and use Redis as a queue or data source in your Adhearsion application.}
  s.license     = 'MIT'

  s.rubyforge_project = "lemondrop"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_runtime_dependency %q<adhearsion>, ["~> 2.1"]
  s.add_runtime_dependency %q<redis>, [">= 3.0.0"]

  s.add_development_dependency %q<bundler>, ["~> 1.0"]
  s.add_development_dependency %q<rspec>, ["~> 2.5"]
  s.add_development_dependency %q<rake>, [">= 0"]
  s.add_development_dependency %q<mocha>, [">= 0"]
  s.add_development_dependency %q<guard-rspec>
 end
