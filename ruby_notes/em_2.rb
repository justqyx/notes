require 'rubygems'
require 'eventmachine'

EventMachine::Timer.new(1, proc { puts 'Hello World.' })