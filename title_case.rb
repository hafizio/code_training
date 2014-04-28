require 'minitest/autorun'
require 'turn'

describe 'Title Case' do
  it 'convert string into title case' do
    title_case('a clash of KINGS', 'a an the of').must_equal 'A Clash of Kings'
  end
end

def title_case(str, exc)
  string = str.downcase.split(' ')
  exception = exc.downcase.split(' ')

  string.map! do |word|
    exception.each { |exc| word.capitalize unless word == exc }
  end
  string
end

#####

a = %w{a clash of kings}
b = %w{a an the of}

a.each do |word|
  b.each do |exc|
    word == exc ? break : word.capitalize
  end
end