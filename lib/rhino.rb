require 'yaml'
require "rhino/version"
require "rhino/routing"
require "rhino/util"
require "rhino/dependencies"
require "rhino/controller"
require "rhino/file_model"
require "rhino/sqlite_model"

module Rhino
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404,
          {'Content-Type' => 'text/html'}, []]
      end
      rack_app = get_rack_app(env)
      rack_app.call(env)
    end
  end
end
