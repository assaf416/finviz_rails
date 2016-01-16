$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "finviz_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "finviz_rails"
  s.version     = FinvizRails::VERSION
  s.authors     = ["Nemrow"]
  s.email       = ["nemrowj@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of FinvizRails."
  s.description = "TODO: Description of FinvizRails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency "sqlite3"
  s.add_dependency 'httparty'
  s.add_dependency 'mechanize'
end
