require 'csv'

class Attendee
  attr_reader :first_name, :last_Name, :Email_Address, :Zipcode
  def initialize(row)
    nil.to_s
    id = row[0]
    @first_name = row[:first_name]
    @last_name = row[:last_name]
    @email = row[:email_address]
    @zipcode = clean_zipcode(row[:zipcode])
    @phone = row[:homephone]

  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def clean_phone_number

  end

end
