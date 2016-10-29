
class Station
#---------------------------------------------------------------------------
  # Имеет название, которое указывается при ее создании
  # Может принимать поезда (по одному за раз)
  # Может показывать список всех поездов на станции, находящиеся в текущий момент
  # Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
  # Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
#---------------------------------------------------------------------------
  attr_reader :name
  attr_accessor :trainList

  def initialize (name)
    @name = name
    @trainList = Array.new
  end

  def takeTrain (train)
    @trainList << train
  end

  def departTrain (train)
    @trainList.delete(train) unless @trainList.empty?
  end

  def showTrainList
    @trainList.each { |t| puts t }
  end

  def showTrainListByType (typ)
    count = 0
    @trainList.each do |t|
      if t.carrType == typ
        count += 1
      end
      puts count
    end
  end

end

class Route
 #---------------------------------------------------------------------------
 #  Может добавлять промежуточную станцию в список
 #  Может удалять промежуточную станцию из списка
 #  Может выводить список всех станций по-порядку от начальной до конечной
 #---------------------------------------------------------------------------

  @firstStation
  @endStation
  attr_accessor :stationList

  def initialize (firstStation, endStation)
    @stationList = Array.new
    @stationList << firstStation
    @stationList << endStation
  end

  def addStation (station)
    @stationList.insert(-2, station)
  end

  def delStation (station)
    @stationList.delete(station) if @stationList.include?(station)
  end

  def showRoute
    @stationList.each { |s| puts s }
  end

end

class Train
  #-------------------------------------------------------------------------------------------
  # Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов,
  # эти данные указываются при создании экземпляра класса
  # Может набирать скорость
  # Может показывать текущую скорость
  # Может тормозить (сбрасывать скорость до нуля)
  # Может показывать количество вагонов
  # Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто
  # увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может
  # осуществляться только если поезд не движется.
  # Может принимать маршрут следования (объект класса Route)
  # Может перемещаться между станциями, указанными в маршруте.
  # Показывать предыдущую станцию, текущую, следующую, на основе маршрута
  #-------------------------------------------------------------------------------------------

  @carrNum
  @carrType
  @carrQty
  @speed

  attr_writer  :currStation
  attr_accessor :route, :carrType

  def initialize (carrNum, carrType, carrQty)

    @carrNum = carrNum
    @carrType = carrType
    @carrQty = carrQty
    @speed = 0
    @currStation = 0

  end

  def increaseSpeed (s)
    @speed += s
  end

  def brake
    @speed = 0
  end

  def showSpeed
    puts @speed
  end

  def showCarrQty
    puts @carrQty
  end

  def changeCarrQty (n)
    @carrQty += n if @speed == 0
  end

  #--------------------- Это работает внизу
  def goToNextStation (train)
      @route.stationList[@currStation].departTrain(train)
      @currStation += 1
      @route.stationList[@currStation].takeTrain(train)
  end

  def showCurrentStation
    puts @route.stationList[@currStation].name
  end

  def showNextStation
    puts @route.stationList[@currStation+1].name if @currStation < @route.stationList.length
  end

  def showPreviousStation
    puts @route.stationList[@currStation-1].name if @currStation > 0
  end

end

station1 = Station.new("Presnya")
puts station1.name
station2 = Station.new("Prosp Mira")
puts station2.name
station3 = Station.new("Kuznec")
puts station3.name

route1 = Route.new(station1, station3)
route1.addStation(station2)
p route1.stationList.length

train1 = Train.new(23, "cargo", 15)
p train1
train1.route = route1
p train1.route

puts '==================='
train1.showCurrentStation
train1.showNextStation
train1.showPreviousStation


train1.goToNextStation(train1)
train1.showCurrentStation
#train1.route_add(route1, train1)

station2.showTrainListByType('cargo')