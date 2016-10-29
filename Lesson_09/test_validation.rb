#! /usr/bin/ruby
# ! -*- coding: utf-8 -*-
require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'cargo_train'
require_relative 'cargo_vagen'
require_relative 'pass_train'
require_relative 'pass_vagen'
require_relative 'manufakturer'
require_relative 'vagen'
require_relative 'validation'
require_relative 'accessor'


begin
  t = Train.new("1275", :pass, 21)
  t.valid?
rescue Exception => e
  puts "======> #{e.inspect}"
end

begin
  st1 = Station.new('')
  st1.valid?
rescue Exception => e
  puts "======> #{e.inspect}"
end

begin
  st2 = Station.new('')
  st2.valid?
rescue Exception => e
  puts "======> #{e.inspect}"
end

