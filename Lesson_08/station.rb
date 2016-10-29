
class Station
  attr_reader :name
  attr_reader :train_list

  @@all_station = []

  def self.all
    @@all_station
  end

  def self.show_all
    @@all_station.each { |s| puts s.name }
  end

  def initialize(name)
    @name = name
    @train_list = []
    @@all_station << self.itself
    validate!
  end

  def go_trought(&block)
    self.train_list.each do |t|
      yield(t)
    end
  end

  def take_train(train)
    self.train_list << train
  end

  def depart_train(train)
    self.train_list.delete(train) unless @train_list.empty?
  end

  def train_list
    self.train_list.each { |t| puts "Поезд № #{t.vagen_id}  тип #{t.type}" }
  end

  def train_list_by_type(typ)
    count = 0
    self.train_list.each do |t|
      if t.type == typ
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
