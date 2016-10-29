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

      puts "-------------------------------"
      puts "-------------------------------"
      puts "Введите 1 для создания станции"
      puts "Введите 2 для создания поезда"
      puts "Введите 3 для создания вагона"
      puts "Введите 4 для отправки поезда на станцию:"
      puts "Введите 5 для занятия места в вагоне:"

      puts "-------------------------------"
      puts "11 - Просмотр станций"
      puts "12 - Просмотр поездов"
      puts "13 - Просмотр вагонов поезда"
      puts "14 - Просмотр поездов на станции"
      puts "-------------------------------"
      puts "Введите 0 для завершения работы"
      puts "-------------------------------"
      puts "-------------------------------"
      ansver = gets.chomp.to_i

      case ansver
        when 1
          create_station
        when 2
          create_train
        when 3
          create_vagen
        when 4
          go_to_station
        when 5
          take_place



        when 11
          show_stations
        when 12
          show_trains
        when 13
          show_trains_vagen
        when 14
          show_station_trains

        when 0
          break
        else
          puts "Некорректный ввод. Повторите..."
      end
    end
  end

  def take_place

    if Train.all.length == 0 then
      puts "Поезда не созданы!!!"
      return
    end

    puts "Введите номер поезда (в формате XXX-XX):"
    train_id = gets.chomp

    train_obj = get_train_obj(train_id)

    if train_obj.nil? then
      puts "=====> Поезд номер #{train_id} не создан!"
      return
    end


    puts "Введите номер вагона (от 1 до #{train_obj.vagens.length}):"
    vagen_number = gets.chomp.to_i

    if vagen_number > 0 && vagen_number < train_obj.vagens.length then

      current_vagen = train_obj.vagens[vagen_number - 1]
      puts "Введите место (1) или объем"
      volume = gets.chomp.to_i

      current_vagen.take_place if current_vagen.type.to_s == 'pass'
      current_vagen.take_volume(volume) if current_vagen.type.to_s == 'cargo'

    end

  end


  def show_station_trains

    if Station.all.length == 0 then
      puts "Станции не созданы!!!"
      return
    end

    puts "Введите название станции:"
    station_name = gets.chomp

    station_obj = nil
    Station.all.each do |s|
      if s.name == station_name then
        station_obj = s
        break
      else
        puts "=====> Станция с именем #{station_name} не создана!"
      end
    end

    puts "На станции #{station_obj.name} находятся поезда:"
    station_obj.train_list

  end


  def show_trains_vagen
    if Train.all.length == 0 then
      puts "Поезда не созданы!!!"
      return
    end

    puts "Введите номер поезда (в формате XXX-XX):"
    train_id = gets.chomp

    train_obj = get_train_obj(train_id)

    if train_obj.nil? then
      puts "=====> Поезд номер #{train_id} не создан!"
      return
    end

    if !train_obj.nil? then
      train_obj.show_vagens
    end
  end

  def get_train_obj(train_id)
    train_obj = nil
    Train.all.each do |t|
      if t.vagen_id == train_id then
        train_obj = t
        break
      end
    end
    train_obj
  end


  def go_to_station
    begin

      if Station.all.length == 0 then
        puts "Станции не созданы!!!"
        return
      end
      if Train.all.length == 0 then
        puts "Поезда не созданы!!!"
        return
      end

      puts "Введите название станции:"
      station_name = gets.chomp

      station_obj = nil
      Station.all.each do |s|
        if s.name == station_name then
          station_obj = s
          break
        else
          puts "=====> Станция с именем #{station_name} не создана!"
        end
      end

      puts "Введите номер поезда (в формате XXX-XX):"
      train_id = gets.chomp

      train_obj = nil
      Train.all.each do |t|
        if t.vagen_id == train_id then
          train_obj = t
          break
        else
          puts "=====> Поезд номер #{train_id} не создан!"
        end
      end


      station_obj.take_train(train_obj) unless station_obj.nil? & train_obj.nil?

      station_obj.train_list

    rescue RuntimeError => e
      puts "Ошибка! #{e.inspect}"
      retry
    end
  end

  def create_vagen
    begin
      puts "Введите тип вагона (pass/cargo):"
      vagen_type = gets.chomp
      puts "Введите количество мест/объем:"
      vagen_volume = gets.chomp.to_i

      if vagen_type == 'pass' then
        PassVagen.new(vagen_volume)
      elsif vagen_type == 'cargo'
        CargoVagen.new(vagen_volume)
      else
        puts "======> Введен неверный тип вагона!!! "
      end

      puts "Созданные вагоны:"
      Vagen.show_all
    rescue RuntimeError => e
      puts "Ошибка! #{e.inspect}"
      retry
    end

  end

  def show_trains
    if Train.all.length == 0 then
      puts "=====> Поезда не созданы!!! "
    else
      Train.show_all
    end
  end


  def show_stations
    if Station.all.length == 0 then
      puts "=====> Станции не созданы!!! "
    else
      Station.show_all
    end
  end

  def create_station
    begin
      puts "Введите название станции:"
      st = Station.new (gets.chomp)

      puts "Станция #{st.name} создана!"

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

      case train_type
        when 'pass'
          for i in 1..vagen_qty do
            tr.add_vagen(PassVagen.new)
          end
        when 'cafgo'
          for i in 1..vagen_qty do
            tr.add_vagen(CargoVagen.new)
          end
      end

      puts "Создан #{tr.type} поезд #{tr.vagen_id}, кол-во вагонов #{tr.vagen_qty}"

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
