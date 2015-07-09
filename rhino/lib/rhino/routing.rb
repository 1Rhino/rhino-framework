class RouteObject
  def initialize
    @ruler = []
  end

  def match(url, *args)
    options = {}
    options =  args.pop if args[-1].is_a?(Hash)
  end

end


module Rhino
  class Application
    def get_controller_and_action(env)
      _, cont, action, after = env['PATH_INFO'].split("/", 4)
      cont = cont.capitalize
      cont += "Controller"

      [Object.const_get(cont), action]
    end
  end
end