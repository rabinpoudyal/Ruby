class Restaurant

  @@filepath = nil #Class Variable

  attr_accessor :name, :cusine, :price #Inst. variable

  def self.filepath=(path=nil)
    @@filepath = File.join(APP_ROOT, path)
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
