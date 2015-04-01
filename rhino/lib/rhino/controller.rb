require 'erubis'

module Rhino

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
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
