require "rhino/version"
require "rhino/routing"
require "rhino/util"
require "rhino/dependencies"
require "rhino/controller"

module Rhino

  class Application

    def call(env)
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act) rescue (return action_not_found)
      [200, {'Content-Type' => 'text/html'}, [text]]
    rescue LoadError
      return error_404
    rescue # StandardError
      return error_500
    end

    def error_404
      [404, {'Content-Type' => 'text/html'}, ['The page not found !']]
    end

    def action_not_found
      [404, {'Content-Type' => 'text/html'}, ['The action not found !']]
    end

    def error_500
      [500, {'Content-Type' => 'text/html'}, ['Some thing went wrong !']]
    end

    def self.root_path
      "/home/khanh/projects/ruby-framework/best_quotes"
    end

  end


end
