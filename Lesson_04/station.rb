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

  def initialize (name)
    @name = name
    @trainList = Array.new
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

end
