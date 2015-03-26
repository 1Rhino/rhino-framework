require "rhino/array"
require "rhino/version"

module Rhino
  class Application
    def call(env)
      `echo debug > debug.txt`
      [200, {'Content-Type' => 'text/html'}, ["Hello world rack app! Xicalo"]]
    end
  end
end