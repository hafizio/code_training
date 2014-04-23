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