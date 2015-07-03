  require_relative "entry.rb"
 
 class AddressBook
  attr_accessor :entries

  def initialize
   @entries = []
  end

  def add_entry(name, phone, email)
   index = 0
   @entries.each do |entry|  
     if name < entry.name
       break
     end
     index += 1
   end
   @entries.insert(index, Entry.new(name, phone, email))
  end

  def remove_entry(name, phone, email)
    index = 0
    @entries.each do |entry|
      if name == entry.name && phone == entry.phone_number && email == entry.email
        # To get here, name, phone, and email all have to match
        break
      end
      index += 1
    end

    @entries.delete_at(index)
  end
 end