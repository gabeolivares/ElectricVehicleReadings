#!/usr/bin/ruby
require './ev_methods.rb'
require './custom_validator.rb'

CustomValidator.new.validate_params(ARGV)
EvMethods.new(ARGV).run
