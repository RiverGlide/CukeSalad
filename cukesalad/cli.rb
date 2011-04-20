require 'aruba/api'
module CukeSalad
  class CLI

    def self.create_new_project project
      structure = Structure.new
      structure.setup project
    end

    def self.configure_existing_project project=nil
      `cd #{project}` if project
      structure = Structure.new
      structure.setup_cucumber_with_cukesalad
    end

    class Structure
      include Aruba::Api

      def initialize
        set_aruba_path_to_current
      end

      def setup project
        create_and_navigate_to project
        setup_cucumber_with_cukesalad
      end

      def setup_cucumber_with_cukesalad
        create_dir_structure
        configure
      end

      private
      def set_aruba_path_to_current
        @dirs = ["./"]
      end

      def create_dir_structure
        create_cucumber_structure
        create_cukesalad_structure
      end

      def create_cucumber_structure
        create_and_navigate_to "features"
        create_dir "support"
      end

      def create_cukesalad_structure
        create_and_navigate_to "lib"
        create_and_navigate_to "default"
        create_dir "roles"
        create_dir "tasks"
        cd "../../../"
      end

      def configure
        cd "features/support"
        content = "require 'cukesalad'\n begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end"
        append_to_file "env.rb",content
      end

      def create_and_navigate_to directory
        create_dir directory
        cd directory
      end
    end
  end
end
