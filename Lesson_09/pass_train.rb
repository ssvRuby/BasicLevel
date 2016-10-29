require_relative 'train.rb'

class PassTrain < Train
  def initialize(a, b, c)
    super
    @type = :pass
  end
end
