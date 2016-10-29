#! /usr/bin/ruby
#! -*- coding: utf-8 -*-

require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'cargo_train'
require_relative 'cargo_vagen'
require_relative 'pass_train'
require_relative 'pass_vagen'
#--------------------------------------------------------

t = Train.new("aaa-aa", "cargo", 22)