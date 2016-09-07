def run
  data_file = DataFile.new
  command = ""
  while command != "quit"
    printf "Enter command: "
    input = gets.chomp
    parts = input.split(" ")
    command = parts[0]
    case command
    when "quit" then puts "Bye!"
    when "load"
      begin
        the_file = 
