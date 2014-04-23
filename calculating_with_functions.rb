NUMBERS = {
  :one => 1,
  :two => 2,
  :three => 3,
  :four => 4,
  :five => 5,
  :six => 6,
  :seven => 7,
  :eight => 8,
  :nine => 9
  }

def seven(str)
  @strn = str.to_s
  arr = @strn.split(')').first.split('(')
  operator = arr[0].to_sym
  number = NUMBERS.fetch(arr[1].to_sym)
  
  case
  when operator == :times
    7 * number
  when operator == :plus
    7 * number
  when operator == :minus
    7 - number
  else operator == :divided_by
    7 / number
  end
end