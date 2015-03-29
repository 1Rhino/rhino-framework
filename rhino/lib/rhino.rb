require "rhino/version"
require "rhino/routing"

module Rhino

  class Application

    def call(env)
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, {'Content-Type' => 'text/html'}, [text]]
    rescue
      [404, {'Content-Type' => 'text/html'}, ['The page not found!']]
    end

  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end

  end

end
