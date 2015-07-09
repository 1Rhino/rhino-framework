require "rhino/version"
require "rhino/routing"
require "rhino/util"
require "rhino/dependencies"
require "rhino/controller"
require "rhino/file_model"
require "pry"

module Rhino

  class Application

    def call(env)
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      rack_app = klass.action(act)
      rack_app.call(env)
    end

    def error_404(error)
      [404, {'Content-Type' => 'text/html'}, ["The page not found ! <br/> <b>#{error.message}</b>"]]
    end

    def action_not_found
      [404, {'Content-Type' => 'text/html'}, ['The action not found !']]
    end

    def error_500(error)
      [500, {'Content-Type' => 'text/html'}, ["Some thing went wrong ! <br/> <b>#{error.message}</b>"]]
    end

    def self.root_path
      "/home/khanhbq/projects/ruby-framework/best_quotes"
    end

  end


end
