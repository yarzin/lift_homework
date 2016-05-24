class Floor
  attr_accessor :pressed
  attr_reader   :number

  def initialize(number)
    @pressed = 'Не нажато'
    @number = number
  end
end
