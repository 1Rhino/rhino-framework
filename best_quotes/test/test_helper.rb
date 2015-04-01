require 'rack/test'
require 'test/unit'

# Alway use the local code first
lib_dir =  File.join(File.dirname(__FILE__), "..", "..", 'rhino', 'lib')
$LOAD_PATH.unshift File.expand_path(lib_dir)

require 'rhino'
require '../config/application'
