require "./field.rb"

class Farm

  def initialize(name)
    @name = name
    @fields = []
  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.chomp.to_s.downcase
      call_option(user_selected)
      pause_screen
    end
  end

  def print_main_menu
    puts "\e[H\e[2J"
    puts "--------------------"
    puts "Options:"
    puts "field -> adds a new field"
    puts "harvest -> harvests crops and adds to total harvested"
    puts "status -> displays some information about the farm"
    puts "relax -> provides lovely descriptions of your fields"
    puts "exit -> exits the program"
    puts "--------------------"
    puts " "
    print ">> "
  end

  def call_option(user_selected)
    case user_selected
      when "field" then add_field
      when "harvest" then start_harvest
      when "status" then general_information
      when "relax" then lovely_information
      when "exit" then exit_program
      else invalid_option
    end
  end

  def add_field
    number_of_try = 0
    while true # repeat indefinitely
      number_of_try += 1
      puts "What kind of field is it: corn, rice or wheat?"
      field_type = gets.chomp.to_s.downcase
      if field_type == "corn" ||
        field_type == "rice"  ||
        field_type == "wheat"
        break
      else
        puts "The type is invalid, please enter again!"
      end
      if number_of_try >= 3
        puts "You tried 3 times, please try later!"
        return
      end
    end

    number_of_try = 0
    while true # repeat indefinitely
      number_of_try += 1
      puts "How large is the field in hectares?"
      field_size = gets.chomp.to_i
      if field_size > 0
        break
      else
        puts "The size is invalid, please enter again!"
      end
      if number_of_try >= 3
        puts "You tried 3 times, please try later!"
        return
      end
    end
    new_field = Field.new(field_type, field_size)
    @fields << new_field
    puts "Added a #{field_type} field of #{field_size} hectares!"
  end

  def start_harvest
    total_food = 0
    @fields.each do | a_field |
      a_field.harvest
      puts "Harvesting #{a_field.food} food from #{a_field.size} hectare #{a_field.type} field."
      total_food += a_field.food
    end
    puts "The farm has #{total_food} harvested food so far."
  end

  def general_information
    total_food = 0
    @fields.each do | a_field |
      puts "#{a_field.type.capitalize} field is #{a_field.size} hectares."
      total_food += a_field.food
    end
    puts "The farm has #{total_food} harvested food so far."
  end

  def lovely_information
    corn_size = 0
    rice_size = 0
    wheat_size = 0
    @fields.each do | a_field |
      corn_size += a_field.size if a_field.type == "corn"
      rice_size += a_field.size if a_field.type == "rice"
      wheat_size += a_field.size if a_field.type == "wheat"
    end
    puts "#{corn_size} hectares of tall green stalks rustling in the breeze fill your horizon."
    puts "#{rice_size} hectares of ricefield carpet so greenish refreshing the melancholy eyes."
    puts "The sun hangs low, casting an orange glow on a sea of #{wheat_size} hectares of wheat."
  end

  def exit_program
    puts "Exiting..."
    sleep 3
    exit
  end

  def invalid_option
    puts "Invalid option!"
  end

  def pause_screen
    print "--Press Enter to continue--"
    gets.chomp
  end

end

a_farm_app = Farm.new("My New Farm")
a_farm_app.main_menu
