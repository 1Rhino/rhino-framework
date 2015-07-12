dir = File.join(File.dirname(__FILE__), "..", 'lib')
$LOAD_PATH.unshift File.expand_path(dir)


require 'rhino/cli'


Rhino::Cli.start