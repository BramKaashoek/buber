require_relative 'spacetaxi.rb'
require_relative 'passenger.rb'

class Buber

  def initialize
    @spacetaxis = []
    for i in 1..5
      @spacetaxis << "Spacetaxi " + i.to_s
      @spacetaxis[i-1] = SpaceTaxi.new(@spacetaxis[i-1])
    end
    @passengers = []
    generate_passengers
  end

  def get_first_free_taxi(passenger_age)
    @spacetaxis.each do |taxi|
      if taxi.available?
        taxi.take
        puts "Passenger #{passenger_age} called free taxi #{taxi.name}. It is on its way."
        return taxi
      end
    end
    puts "Uh oh, there are currently no free taxis. Passenger #{passenger_age} will have to use a different company."
  end

  def generate_passengers
    passenger_count = 0
    loop do
      passenger_count +=1
      Thread.new {
        @passengers << Passenger.new(passenger_count, self)
      }
      sleep 3
    end
  end

end
