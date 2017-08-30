$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "soopli/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "soopli"
  s.version     = Soopli::VERSION
  s.authors     = ["marcelofossrj"]
  s.email       = ["marcelo.foss.rj@gmail.com"]
  s.homepage    = "http://github/marcelofossrj/soopli"
  s.summary     = "Suppliers and Contracts management app"
  s.description = "cloud-based management platform designed to help businesses handle their suppliers and contracts better. Complex relationships becomes a simple as all intelligence, messages, dates and key documentation are stored in one place, constantly updated across different teams and departments."
  s.license     = "Apache-2.0"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.4"

#  s.add_dependency "pg"
  
  s.add_dependency "rspec-rails", "~> 3.6.0"  
  s.add_dependency "capybara", "~> 2.14.4"  
  s.add_dependency "factory_girl_rails", "~> 4.8.0"  
  s.add_dependency "shoulda", "~> 3.5.0"  
  s.add_dependency "database_cleaner", "~> 1.6.1"  
  s.add_dependency "cucumber-rails", "~> 1.5.0"
  s.add_dependency "paper_trail", "~> 7.0.3"
  s.add_dependency "kaminari", "~>1.0.1"
  s.add_dependency "ransack", "~> 1.8.3"
  s.add_dependency "country_select"
  s.add_dependency 'countries'#, :require => 'countries/global'
  
end
