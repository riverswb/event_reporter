require 'csv'
require 'sunlight/congress'
require 'erb'



Sunlight::Congress.api_key = "8ed8af10edf6473583d8878e183284f5"



def legislators_by_zipcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

# def save_thank_you_letters(id,form_letter)
#
#   Dir.mkdir("output") unless Dir.exists? "output"
#
#   filename = "output/thanks_#{id}.html"
#
#   File.open(filename, 'w') do |file|
#     file.puts form_letter
#   end
# end


contents = CSV.open "event_attendees_small.csv", headers: true, header_converters: :symbol
template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents.each do |row|
  id = row[0]
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  @legislators = legislators_by_zipcode(@zipcode)

  #form_letter = erb_template.result(binding)

  # save_thank_you_letters(id,form_letter)

  end
