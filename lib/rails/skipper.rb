require "rails/skipper/version"
require "rails/generators/rails/app/app_generator"

module Rails
  module Skipper
    ADD_ONS = ["action-mailbox", "action-text", "active-storage", "action-cable",
               "sprockets", "spring", "listen", "javascript", "turbolinks",
               "system-tests", "webpack-install", "bootsnap"]
    class Main
      def say_hello(args)
        if args.empty?
          puts "Usage: rails-skipper APP_PATH [options]"
          puts "Available options:"
          ADD_ONS.each do |add_on|
            puts "\t--add-#{add_on} to add #{add_on.gsub("-", " ")} to your new application"
          end
          return
        end
        generator_args = [args.shift]
        ADD_ONS.each do |add_on|
          generator_args << "--skip-#{add_on}" unless args.delete("--add-#{add_on}")
        end

        generator_args.concat(generator_args)
        ::Rails::Generators::AppGenerator.start(generator_args)
      end
    end
    class Error < StandardError; end
    # Your code goes here...
  end
end
