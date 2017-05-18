class SpaceTaxi
  attr_accessor :available
  attr_reader :name

  def initialize(name)
    @name = name
    @available = true
    puts "#{name} created."
  end

  def available?
    available
  end

  def take
    @available = false
  end

  def pick_up(passenger_age, distance)
    drive_to(distance)
    puts "Passenger #{passenger_age} picked up."
  end

  def drop_off(passenger_age, pick_up_distance, drop_off_distance)
    drive_to(drop_off_distance)
    puts "Passenger #{passenger_age} dropped off. They paid #{pick_up_distance + drop_off_distance} euro."
    puts "#{name} is now available again!"
    @available = true
  end


  def drive_to(distance)
    while distance > 0
      distance -=1
      sleep 1
    end
  end


end
