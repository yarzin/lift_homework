require_relative './floor'
require_relative './elevator'

class Building
  attr_reader   :floors
  attr_accessor :elevator

  def initialize(max_floor)
    @floors   = []
    @elevator = Elevator.new
    count     = 1
    max_floor.times do
     @floors << Floor.new(count)
     count += 1
   end
  end

  def send_elevator
    elevator_commands
    @elevator.commands = elevator_commands
  end

private
  def elevator_commands
    elevator_commands = []
    floors.each { |floor| elevator_commands << floor if @elevator.current_floor == floor.number }
    floors.each { |floor| elevator_commands << floor if floor.pressed == 'Pressed!' }
    elevator_commands
  end
end
