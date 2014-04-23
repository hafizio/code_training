require 'minitest/autorun'
require 'turn/autorun'

describe 'Luck Check' do
  it 'approved the lucky number' do
    luck_check('1708').must_equal true
  end

  it 'reject the non lucky number' do
    luck_check('11144').must_equal false
  end
  
  it 'reject empty string' do
    luck_check('').must_raise ArgumentError
  end    

  it 'only accepts decimal number' do
    assert_raise ArgumentError, luck_check('fdsfsdfds') 
  end
end

def luck_check(str)
  a = str.chars
  a.delete_at(a.size/2) if a.size.odd?
  z = (a.size/2) - 1
  b = a.slice!(0..z)
  a.delete_if { |x| x == 0 }
  b.delete_if { |x| x == 0 }

  @sum_a = 0
  @sum_b = 0

  case
  when str.empty?
    raise ArgumentError, "String is empty!"
  when a.any? { |x| x.to_i == 0 } && b.any? { |x| x.to_i == 0 }
    raise ArgumentError, "Not a decimal number!"
  else  
    a.each { |x| @sum_a += x.to_i }
    b.each { |x| @sum_b += x.to_i }
  end
  @sum_a == @sum_b
end
