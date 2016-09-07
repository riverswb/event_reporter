require './lib/event_reporter2.rb'

puts "Hello, Welcome to Event Reporter."
puts "What can I do for you? Choose an option below:
      load <filename>"


# input_path = set_path(user_file_input)

df = DataFile.new
input = gets.chomp
# binding.pry
# puts df.(input)#{}"#{input}"
while input != nil
eval(input)
end

def test
  puts "It works!"
end
