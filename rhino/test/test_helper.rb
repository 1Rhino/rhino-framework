require 'rack/test'
require 'test/unit'

## TODO check why these codes not run
# Alway use the local code first
# dir = File.join(File.dirname(__FILE__), '..')
# $:.unshift File.expand_path(dir)
# require 'rhino'

require File.join(File.dirname(__FILE__), '..') + "/lib/rhino"
