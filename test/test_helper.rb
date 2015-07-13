require 'rack/test'
require 'test/unit'

# Alway use the local code first
dir = File.join(File.dirname(__FILE__), "..", 'lib')
best_quotes_dir =  File.join(File.dirname(__FILE__), "..", "..", 'best_quotes')
$LOAD_PATH.unshift File.expand_path(dir)
$LOAD_PATH.unshift File.expand_path(best_quotes_dir)

require 'rhino'
require 'config/application.rb'
