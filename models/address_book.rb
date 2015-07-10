  require_relative "entry.rb"
  require "csv"
 
 class AddressBook
  attr_accessor :entries

  def initialize
   @entries = []
  end

  def get_entry(index)
    if index >= 1 && index < (entries.size + 1)
      @entries[index - 1]
    else
      system "clear"
      puts "The index you selected is out of range."
    end
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

  def import_from_csv(file_name)
    csv_text = File.read(file_name)
     csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
     csv.each do |row|
       row_hash = row.to_hash
       add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
     end
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