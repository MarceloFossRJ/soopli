require "rails/generators"
require "rails/generators/active_record"

module Soopli  
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def config_routes
      route "mount Soopli::Engine => '/soopli'"
    end
    def create_rakefile
      copy_file   "soopli.rake", "lib/tasks/soopli.rake"
    end

  end
end

