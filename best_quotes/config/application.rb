require 'rhino'
$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'app', 'controllers')
$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'app', 'models')

module BestQuotes
  class Application < Rhino::Application
  end
end
