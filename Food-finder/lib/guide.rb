require 'restaurant'

class Guide

  class Options
    @@actions = ['list','find','add','quit']
    def self.action;@@actions;end
  end

  def initialize(path=nil) #initialize guide object
    #Lets locate the resturant text file path
    Restaurant.filepath = path #But the filepath is a class method so make it a setter method in resturant class
    if Restaurant.file_usable?
      puts "Found a Resturant File."
    elsif Restaurant.create_file
      puts "Created the resturant file."
    else
      puts "Exiting \n\n"
      exit!
    end
  end

  def get_action
    choice = nil
    #loop
    until Guide::Options.action.include?(choice)
      puts "You can perform these actions: #{Guide::Options.action.join(',')} " if choice
      print "> "
      query = gets.chomp
      choice = query.downcase.strip #downcase and remove the spaces
    end
    return choice
  end

  def launch!
    introduction #Give the welcome message
    #Now we need a action loop
    result = nil
    until result == :quit do
      user_response = get_action
      result = action(user_response)
    end
    conclusion #Give the goodbye message
  end

  def action(user_response)
    case user_response
    when "list"
      puts "Listing.."
    when "find"
      puts "Finding"
    when "add"
      puts "Adding"
    when "quit"
      return :quit
    else
      puts "\n Sorry I don't understand the command \n"
    end
  end

  def introduction
    puts "\n\n <<< Welcome to the Rabin's Food Finder >>> \n\n"
    puts "This is an interactive guide to help you find the food you crave. \n\n"
  end

  def conclusion
    puts "\n <<< Goodbye and Bon Appetit! >>>\n\n\n"
  end

end
