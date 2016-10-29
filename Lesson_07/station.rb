#----------------------------------------------------------------------------------
# class Station
# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может показывать список всех поездов на станции, находящиеся в текущий момент
# Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых,
# пассажирских
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка
# поездов, находящихся на станции).
#----------------------------------------------------------------------------------
class Station

  attr_reader :name
  attr_reader :trainList

  @@all_station = Array.new

  def self.all
    @@all_station
  end

  def self.show_all
    @@all_station.each {|s| puts s.name}
  end

  def initialize (name)
    @name = name
    @trainList = Array.new
    @@all_station << self.itself
    validate!
  end

  def go_trought(&block)
    self.trainList.each do |t|
      yield(t)
    end
  end

  def take_train (train)
    self.trainList << train
  end

  def depart_train (train)
    self.trainList.delete(train) unless @trainList.empty?
  end

  def train_list
    self.trainList.each { |t| puts "Поезд № #{t.vagen_id}  тип #{t.type}" }
  end

  def train_list_by_type (typ)
    count = 0
    self.trainList.each do |t|
      if t.carrType == typ
        count += 1
      end
      puts count
    end
  end

  def show_station_name
    puts "Название станции: #{self.name}"
  end

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise "Station name is nil!" if self.name.nil?
  end

end
