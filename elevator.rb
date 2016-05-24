class Elevator
  attr_accessor :commands

  def initialize(commands=nil)
    @commands = commands
  end

  def current_floor
    commands.nil? ? 1 : commands.first.number
  end

  def direction
    current_floor < commands[1].number ? 'Up' : 'Down'
  end

  def start
    puts "Рухається #{direction}!"
    sorted_commands.drop(1).each do |floor|
      floor.pressed = 'Не нажато'
      puts "Ви прибули на поверх #{floor.number}"
    end
    @commands = [sorted_commands.last]
  end

private
  def sorted_commands
    if direction == 'Down'
      @commands.sort! { |floor1, floor2| floor2.number <=> floor1.number }
    else
      @commands
    end
  end
end
