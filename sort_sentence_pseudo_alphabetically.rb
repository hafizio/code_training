require 'minitest/autorun'
require 'turn/autorun'

describe 'Sort Sentence' do
  it 'sort the string into pseudoalphabet' do
    sort_sentence('come To, this New, World!').must_equal 'come this World To New'
  end

  it 'sort the string into pseudoalphabet 2' do
    a = 'Land of the Old, Thirteen! Massachusetts, land! land of Vermont, and Connecticut!'
    b = 'and land land of of the Vermont Thirteen Old Massachusetts Land Connecticut'
    sort_sentence(a).must_equal b
  end
end

#Original (Passed)
def sort_sentence(str)
  str.delete!('!')
  str.delete!(',')
  allcase = str.split
  upcase = str.scan(/[A-Z]\w*/)
  downcase = allcase - upcase
  a = downcase.sort.join(' ')
  b = upcase.sort.reverse.join(' ')

  case
  when b.empty? then a
  when a.empty? then b
  else a + ' ' + b
  end
end
