require 'date'

def find_out_christmas_weekday date
  if date.class == String
    x = ' '
    date.scan(/\d{4}/) { |y| x << y }
    @z = x.to_i
    d = Date.new(@z,12,25)
    d.strftime("%A")
  else
    d = Date.new(date)
    d.strftime("%A")
  end
end

