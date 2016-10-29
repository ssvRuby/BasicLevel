#! /usr/bin/ruby
#! -*- coding: utf-8 -*-
require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'cargo_train'
require_relative 'cargo_vagen'
require_relative 'pass_train'
require_relative 'pass_vagen'
require_relative 'manufakturer'
require_relative 'vagen'
#--------------------------------------------------------

class UserTextInterface

  def show_dialog

    loop do

      puts "Введите 1 для создания станции"
      puts "Введите 2 для создания поезда"


      puts "Введите 0 для завершения работы"
      ansver = gets.chomp.to_i

      case ansver
        when 1
          create_station
        when 2
          create_train


        when 0
          break
        else
          puts "Некорректный ввод. Повторите..."
      end
    end
  end

  def create_station
    begin
      puts "Введите название станции:"
      st = Station.new (gets.chomp)
      st.show_station_name
      puts "Созданные станции:"
      Station.all
    rescue RuntimeError => e
      puts "Ошибка! #{e.inspect}"
      retry
    end
  end

  def create_train
    begin
      puts "Введите номер поезда (в формате XXX-XX):"
      train_number = gets.chomp
      puts "Введите тип поезда (pass/cargo):"
      train_type = gets.chomp
      puts "Введите количество вагонов:"
      vagen_qty = gets.chomp.to_i

      validate_train!(train_type, vagen_qty)

      tr = Train.new(train_number, train_type, vagen_qty)

      puts "Создан #{tr.type} поезд #{tr.vagen_id}, кол-во вагонов #{tr.vagen_qty}"

      puts "Созданные поезда:"
      Train.all

    rescue RuntimeError => e
      puts "Ошибка! #{e.inspect}"
      retry
    end
  end

  protected
  
  def validate_train!(train_type, vagen_qty)
    raise "Тип поезда не указан!" if train_type.nil?
    raise "Количество вагонов указано не верно!" if vagen_qty.nil? or vagen_qty < 0
  end

  # def create_station
  #   begin
  #
  #
  #   rescue RuntimeError => e
  #     puts "Ошибка! #{e.inspect}"
  #     retry
  #   end
  # end

end

dialog = UserTextInterface.new.show_dialog
