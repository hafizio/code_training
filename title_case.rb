require 'minitest/autorun'
# require 'turn/autorun'

describe 'title_case' do
  it 'convert string into title case' do
    title_case('a clash of KINGS', 'a an the of').must_equal 'A Clash of Kings'
  end
end

def title_case(str, exc)
  string = str.downcase.split(' ')
  exception = exc.downcase.split(' ')

  product = []
  string.each do |word|
    exception.each do |minor|
      if minor == word
        product << word
      else
        product << word.capitalize
      end
      break
    end
  end
  product[0].capitalize!
  product.join(' ')
end
