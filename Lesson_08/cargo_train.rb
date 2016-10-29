require_relative 'train.rb'

class CargoTrain < Train
  def initialize(a, b, c)
    super
    @type = :cargo
  end
end
