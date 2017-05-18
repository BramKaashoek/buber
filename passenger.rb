class Passenger

  def initialize(age, buber, first_name = "John", last_name = "Mclain" , arrived = false, pick_up_distance = rand(10), drop_off_distance = rand(20))
    @first_name = first_name
    @last_name = last_name
    @age = age
    @arrived = arrived
    @buber = buber
    @pick_up_distance = pick_up_distance
    @drop_off_distance = drop_off_distance
  end

  def go_on_trip
    puts "Passenger #{@age} created."
    taxi = @buber.get_first_free_taxi(@age)
    taxi.pick_up(@age, @pick_up_distance)
    taxi.drop_off(@age, @pick_up_distance, @drop_off_distance)

  end

end
