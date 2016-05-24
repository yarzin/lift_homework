require_relative './building'

class Run_elevator
  def initialize(floors)
    @building = Building.new(floors)
    @continue = true
  end

  def start
    until @continue == false 
      menu
      set_button
    end
  end

  def menu
    puts 'На який поверх ви хочете потрапити?'
    puts "Ви зараз на цьому поверсі #{@building.elevator.current_floor}"
    puts '>> go to start elevator'
    @building.floors.each { |floor| puts "Floor #{floor.number} - #{floor.pressed}" }
    puts '>> q to quit'
  end

  def set_button
    case floor = gets.chomp
    when /\d/
      @building.floors[floor.to_i - 1].pressed = 'Pressed!'
    when /go/i
      @building.send_elevator
      @building.elevator.start
    when /q/i
      @continue = false
    else
      puts 'Невірна команда'
    end
  end
end

#runs program
puts 'Вкажіть скільки поверхів в будинку'
floors = gets.chomp.to_i
elevator = Run_elevator.new(floors)
elevator.start
