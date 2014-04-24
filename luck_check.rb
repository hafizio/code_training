require 'minitest/autorun'
require 'turn/autorun'

describe 'Luck Check' do
  it 'approved the lucky number' do
    luck_check('1708').must_equal true
  end

  it 'reject the non lucky number' do
    luck_check('11144').must_equal false
  end
  
  it 'raise an error when given an empty string' do
    Proc.new{ luck_check('') }.must_raise(ArgumentError, "String is empty!")
  end    

  it 'raise an error when given a non decimal number' do
    assert_raises(ArgumentError, "Not a decimal number!") { luck_check('fdsfsdfds') }
  end
end

# Original (Passed)
def luck_check(str)
  a = str.chars
  a.delete_at(a.length/2) if a.length.odd?
  z = (a.length/2)
  b = a.slice!(0...z)
  a.delete('0')
  b.delete('0')

  case
  when str.empty?
    raise ArgumentError, "String is empty!"
  when a.any? { |x| x.to_i == 0 } || b.any? { |x| x.to_i == 0 }
    raise ArgumentError, "Not a decimal number!"
  else  
    sum_a = a.inject(0) { |sum, x | sum + x.to_i }
    sum_b = b.inject(0) { |sum, x | sum + x.to_i }
    sum_a == sum_b
  end
end

# Original 2 (Failed)
def luck_check(str)
  index = (str.size/2) - 1
  part_1 = str.slice!(0..index)

  tmp_array = str.split('')
  tmp_array.shift
  part_2 = tmp_array.join

  box_1 = part_1.delete('0').split('')
  box_2 = part_2.delete('0').split('')

  @sum_1 = 0
  @sum_2 = 0

  case
  when str.empty?
    raise ArgumentError, "String is empty!"
  when box_1.any? { |x| x.to_i == 0 } && box_2.any? { |x| x.to_i == 0 }
    raise ArgumentError, "Not a decimal number!"
  else  
    box_1.each { |x| @sum_a += x.to_i }
    box_2.each { |x| @sum_b += x.to_i }
  end
  @sum_a == @sum_b
end

# Sensei hencethus (Passed)
def luck_check (str)
  raise ArgumentError unless str.match(/\A\d+\z/)
  half = str.size / 2
  digits = str.chars.map(&:to_i)
  digits.first(half).reduce(:+) == digits.last(half).reduce(:+)
end