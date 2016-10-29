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

st1 = Station.new('ST1')
st2 = Station.new('ST2')
st3 = Station.new('ST3')
st4 = Station.new('ST4')
st5 = Station.new('ST5')

route1 = Route.new(st1, st5)
route1.add_station(st2)
route1.add_station(st3)
route1.add_station(st4)
route1.show_route

train1 = Train.new("aaa-aa", 'pass', 16)
#train2 = Train.new('96c-MO', 'cargo', 23)

train1.set_route(route1)
train1.show_vagens_count
train1.show_current_station
train1.go
train1.show_current_station
train1.show_next_station
train1.show_prev_station

puts '-----------------------'
#train2.show_vagens_count

cargo_train = CargoTrain.new('a23aa','aa',20)

 for i in (1..10) do
   cargo_train.add_vagen(CargoVagen.new)
   puts i
 end

puts cargo_train.show_vagens_count
cargo_train.add_vagen(CargoVagen.new)
puts "Количество вагонов: #{cargo_train.show_vagens_count}"

Station.all

cargo_train.del_vagen
puts "Количество вагонов: #{cargo_train.show_vagens_count}"

st1.take_train(cargo_train)
st1.train_list

puts "============================================"
puts Train.find(23)