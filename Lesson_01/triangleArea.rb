#! /usr/bin/ruby
#! -*- coding: utf-8 -*-

#-------------------------------------------------------------------------------------
#Площадь треугольника. Площадь треугольника можно вычилсить, зная его
# основание (a) и высоту (h) по формуле: 1/2*a*h. Программа должна
# запрашивать основание и высоту треугольника и возвращать его площадь.
#-------------------------------------------------------------------------------------

puts "Введите основание треугольника:"
a = gets.chomp

puts "Введите высоту треугольника:"
h = gets.chomp

puts "Площадь треугольника: #{0.5 * a.to_i * h.to_i }"
