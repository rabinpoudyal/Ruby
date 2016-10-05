require 'restaurant'
class Guide

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

  def launch!
  end

  def introduction
    puts "\n\n <<< Welcome to the Rabin's Food Finder >>> \n\n"
    puts "This is an interactive guide to help you find the food you crave. \n\n"
  end

  def conclusion
    puts "\n <<< Goodbye and Bon Appetit! >>>\n\n\n"
  end

end
