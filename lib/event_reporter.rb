require 'csv'
require 'sunlight/congress'
require 'rubygems'
require 'sunlight'
require 'pry'

Sunlight::Congress.api_key = "8ed8af10edf6473583d8878e183284f5"
Sunlight::Base.api_key = "8ed8af10edf6473583d8878e183284f5"
class Sun
attr_reader :help

  contents = CSV.read "event_attendees_small.csv", headers: true, header_converters: :symbol
  # template_letter = File.read "form_letter.erb"

  def legislators_by_state(zip)
    members_of_congress = Sunlight::Legislator.all_in_zipcode(zip)
    binding.pry
    members_of_congress.each do |zip|
      @queue << zip
      binding.pry
    end
  end


  def initialize
    @queue = []
    # binding.pry
  end

  def help
    puts "These are the available commands:
          load <filename>
          help
          help <command>
          queue count
          queue clear
          queue district
          queue print
          queue print by <attribute>
          queue save to <filename.csv>
          queue export html <filename.csv>
          find <attribute> <criteria>
          "

  end


  def find_attribute_by_state(state)
      florida = Sunlight::Congress::Legislator.all_where(:state => state)
      florida.each do |legs|
        binding.pry
        @queue << legs
      end
  end
  # def load(filename = )
  # File.open(a, "r")
  # end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def legislators_by_zipcode(zipcode)
    found = Sunlight::Congress::Legislator.by_zipcode(zipcode)
    @queue << found
    # binding.pry
  end
  def legislators_by_first_name(first_name)
    found = Sunlight::Congress::Legislator.all_where(:firstname => first_name)
    @queue << found
    binding.pry
    p @queue
  end


  puts "Welcome to Event Reporter!"
  puts 'What can I do for you? ("help" for available commands)'

  # legislators = legislators_by_zipcode(zipcode)

  # command = gets.chomp
  # puts "#{eval(command)}"
end
