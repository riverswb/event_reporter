require 'csv'

module EventReporterFormatter

  def clean_load(contents)
    # no_nil
    contents.map do |row|
      Attendee.new(row)
      # id = row[0]
      # first_name = row[:first_name]
      # zipcode = clean_zipcode(row[:zipcode])
         if row == nil
           row = ""
         end
      end
  end

  def help_request
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

  def help_user(argument)
    case argument

      when '' then puts help_request
      when 'load' then puts "Erase any loaded data and parse the specified file. If no filename is given, default to event_attendees.csv."
      when 'help' then puts "Output a listing of the available individual commands."
      when 'command' then puts "Output a description of how to use the specific command."
      when 'queue count' then puts "Output how many records are in the current queue."
      when 'queue clear' then puts "Empty the queue."
      when 'queue district' then puts "If there are less than 10 entries in the queue, this command will use the Sunlight API to get Congressional District information for each entry."
      when 'queue print' then puts "Print out a tab-delimited data table with a header row."
      when 'queue print by attribute' then puts "Print the data table sorted by the specified attribute like zipcode."
      when 'queue save to filename.csv' then puts "Export the current queue to the specified filename as a CSV. The file should should include data and headers for last name, first name, email, zipcode, city, state, address, and phone number."
      when 'ques export html filename.csv' then puts "Export the current queue to the specified filename as a valid HTML file. The file should use tables and include the data for all of the expected information."
      when 'find' then puts "Load the queue with all records matching the criteria for the given attribute."
      else puts "Sorry, I don't know how to help with #{argument}!"
    end
  end

  # def queue_user(argument)
  #   case argument
  #
  #   when "count" puts "The queue is #{@queue.length} long."
  #     when "clear"
  #     when "print"
  #   end
  # end

end #module end
