require 'csv'
require 'rubygems'
require 'sunlight/congress'
require './lib/event_reporter_formatter.rb'
require './lib/attendees.rb'

require 'pry'



class DataFile
attr_reader :contents, :current_file_path, :default_file, :attendees_repository

  include EventReporterFormatter

  def initialize
    @default_file = "event_attendees_small.csv"
    @queue = []
    @attendees_repository = []
    #binding.pry
  end

  def set_path(user_file_input = nil)
    if user_file_input == nil
      @current_file_path = @default_file
    #  @current_file_path
    #  binding.pry
    elsif user_file_input[-4..-1] == ".csv" && File.exists?(user_file_input)
      @current_file_path = user_file_input
      puts "File Loaded"
    #  binding.pry
    else
      @current_file_path = @default_file
      puts "Load an existing CSV file or continue with the default file."
    #  binding.pry
    #  @current_file_path
    end
  end

  def load_file
#    binding.pry
    @contents = CSV.read @current_file_path, headers: true, header_converters: :symbol

#    binding.pry
    @attendees_repository = clean_load(@contents)
#    binding.pry
  end


  def run
    data_file = DataFile.new
    command = ""
    while command != "quit"
      print "Enter command: "
      input = gets.chomp
      parts = input.split(" ")
      command = parts[0]
      argument = parts[1..-1].join(" ")
      case command
      when "quit" then puts "Bye!"
      when "load"
        begin
          the_file = data_file.set_path(parts[1])
          if the_file
            data_file.load_file
          end
        end
      when "queue" then queue_user(argument)
      when 'help' then help_user(argument)
      else
        puts "Sorry, I don't know how to #{command}!"
      end
    end
  end

  def find_by(attribute, criteria)
#    binding.pry
    @queue = @attendees_repository.map do |attendee|
#      binding.pry
      attendee.attribute[criteria]
      p @queue
#      binding.pry
    end
  end
end # DataFile class end
DataFile.new
clean_load(CSV.open "event_attendees_small.csv", headers: true, header_converters: :symbol)
p @queue
