require "minitest/autorun"
require "turn/autorun"

describe 'to_underscore' do
  it 'convert CamelCase to snake_case' do
    to_underscore('TestController').must_equal('test_controller')
  end
  it 'convert number to string' do
    to_underscore(1).must_equal('1')
  end
end

def to_underscore(str)
  if str.kind_of?(Fixnum)
    str.to_s
  else
    words = str.scan(/[A-Z][(a-z)|(0-9)]+/)
    words.map!(&:downcase).join('_')
  end
end

def to_underscore(string)
  string.to_s.split(/(?=[A-Z])/).join('_').downcase
end
