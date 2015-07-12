require 'pry'
module Rhino
  class Cli
    def initialize(args)
      @args = args
    end

    def run
      if @args[0] == 'new' && !@args[1].nil
        new_app(args[1])
      end
    end

    def new_app(name)

    end

  end
end