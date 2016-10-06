class Restaurant

  @@filepath = nil #Class Variable

  attr_accessor :name, :cusine, :price #Inst. variable

  def self.filepath=(path=nil)
    @@filepath = File.join(APP_ROOT, path)
  end

  def initialize(args={}) # initailize a empty in case user does not pass anything
    @name   =  args[:name]  || "" #set default to empty string
    @cusine = args[:cusine] || ""
    @price  = args[:price]  || ""
  end

  def self.ask_questions
    args = {}

    print "\n Enter resturant name: "
    args[:name] = gets.chomp.strip
    print "\n Enter cusine: "
    args[:cusine] = gets.chomp.strip
    print "\n Enter price($): "
    args[:price] = gets.chomp.strip

    return self.new(args)
  end


  def self.file_exists?
    if @@filepath && File.exists?(@@filepath)
      return true
    else
      return false
    end
  end

  def self.file_usable?
    return false unless @@filepath
    return false unless File.exists?(@@filepath)
    return false unless File.readable?(@@filepath)
    return false unless File.writable?(@@filepath)
    return true
  end

  def self.create_file
    File.open(@@filepath, 'w') unless file_exists?
    return file_usable?
  end

  def self.saved_resturants

  end

  def save
    return false unless Restaurant.file_usable? # we need to put Resturant for calling the instance method
    File.open('restautant.txt','a') do |file|
      file.puts ([@name,@cusine,@price].join("\t")) + "\n"
    end
    return true #return true if writing was successful
  end

end
