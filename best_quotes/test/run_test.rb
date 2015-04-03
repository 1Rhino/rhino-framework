# run all tests in directory

 Dir['test_*.rb'].each{|f| require File.expand_path(File.dirname(__FILE__)) + '/' + f }
