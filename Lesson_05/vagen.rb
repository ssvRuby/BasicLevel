require_relative 'manufakturer'
class Vagen
  include Manufakturer
  attr_reader :type
end