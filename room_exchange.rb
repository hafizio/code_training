# Room Exchange

# It's time for some room exchange! The objective is simple: To exchange between two arrays.

#     room_a.exchange_with!(room_b)

# Few rules:

# 1. Total exchange of content between two rooms.
# 2. For room_a: Enter from front door & exit from back door.
# 3. For room_b: Enter from back door & exit from front door.
# 4. nil is not allowed!

require 'minitest/autorun'
require 'turn/autorun'

describe Array do
  before :all do
    @room_a = ["1", "2", "3", "4", "5", "6", "7"]
    @room_b = ["a", "b", "c"]
    
    @room_a.exchange_with!(@room_b)
  end
  
  it 'exchange between two arrays' do
    @room_a.must_equal ["c", "b", "a"]
    @room_b.must_equal ["7", "6", "5", "4", "3", "2", "1"]
  end

  it 'does not contain nil object' do
      assert_equal(@room_a.include?(NilClass), false)
      assert_equal(@room_b.include?(NilClass), false)
  end
end

class Array
  def exchange_with!(other_array)
    room_a = self.size - 1
    rooms_b = other_array.size - 1

    for n in 0..room_a
      other_array.push(self.pop)
    end

    for n in 0..rooms_b
      self.unshift(other_array.shift)
    end
  end
end

