#! /usr/bin/ruby
#! -*- coding: utf-8 -*-

#-------------------------------------------------------------------------------------
# Прямоугольный треугольник. Программа запрашивает у пользователя 3 стороны треугольника
# и определяет, является ли треугольник прямоугольным, используя теорему Пифагора (www-formula.ru)
# и выводит результат на экран. Также, если треугольник является при этом равнобедренным
# (т.е. у него равны любые 2 стороны), то дополнительно выводится информация о том,
# что треугольник еще и равнобедренный.
# Подсказка: чтобы воспользоваться теоремой Пифагора, нужно сначала найти самую длинную
# сторону (гипотенуза) и сравнить ее значение в квадрате с суммой квадратов двух остальных сторон.
# Если все 3 стороны равны, то треугольник равнобедренный и равносторонний, но не прямоугольный.
#-------------------------------------------------------------------------------------

puts "Введите длину первой стороны треугольника:"
a = gets.chomp.to_f
puts "Введите длину второй стороны треугольника:"
b = gets.chomp.to_f
puts "Введите длину третьей стороны треугольника:"
c = gets.chomp.to_f

if a == 0 or b == 0 or c == 0
  puts "Введены неверные параметры!"
  exit
end

if a >= b
  hypotenuse = a
  firstSide = b
else
  hypotenuse = b
  firstSide = a
end

if c > hypotenuse
  secondSide = hypotenuse
  hypotenuse = c
else
  secondSide = c
end

if hypotenuse**2 == firstSide**2  + secondSide**2
  puts "Треугольник является прямоугольным "
  if firstSide == secondSide
    puts "и равнобедренным"
    end
  else
    puts "Треугольник НЕ является прямоугольным"
end