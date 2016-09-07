class Attendee
  attr_reader :first_name
  def initialize(row)
    if row == nil
      row = "0"
    end
    @first_name = row[:first_Name]
    @last_name = row[:last_Name]
    @email = row[:Email_Address]
    @zip = clean_zipcode(row[:Zipcode])

  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def clean_phone_number

  end

end
