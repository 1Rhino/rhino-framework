require 'erubis'
require 'rhino/file_model'

module Rhino

  class Controller
    include Rhino::Model

    def initialize(env)
      @env = env
      @routing_params = {}
    end

    def dispatch(action, routing_params = {})
      @routing_params = routing_params
      text = self.send(action)
      if get_response
        st, hd, rs =  get_response.to_a
        [st, hd, [rs].flatten]
      else
        [200, {'Context-Type' => 'text/html'}, [text].flatten]
      end
    end

    def self.action(act, rp = {})
      proc {|e| self.new(e).dispatch(act, rp)}
    end

    def env
      @env
    end

    def request
      @request ||= Rack::Request.new(@env)
    end

    def response(text, status=200, headers = {})
      raise "Already responded!" if @response
      a = [text].flatten
      @response = Rack::Response.new(a, status, headers)
    end

    def get_response
      @response
    end

    def params
      request.params.merge(@routing_params)
    end

    def render(view_name, locals={})
      file_name = File.join Rhino::Application.root_path, 'app', 'views', controller_name, "#{view_name}.html.erb"
      template = File.read file_name
      eruby = Erubis::Eruby.new(template)
      eruby.result locals.merge(env: env)
    end

    def controller_name
      klass = self.class
      klass = klass.to_s.gsub(/Controller$/, "")
      Rhino.to_underscore(klass)
    end
  end

end
