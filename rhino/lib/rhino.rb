require "rhino/version"

module Rhino
  class Application
    def call(env)
      [200, {'Content-Type' => 'text/html'}, ['Hello world from Rhino Framework!']]
    end
  end
end
