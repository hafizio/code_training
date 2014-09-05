require "minitest/autorun"

describe 'to_camel_case' do
  it 'convert dash to camel casing' do
    to_camel_case("the-stealth-warrior").must_equal "theStealthWarrior"
  end

  it 'convert underscore to camel casing' do
    to_camel_case("the_stealth_warrior").must_equal "theStealthWarrior"
  end

  it 'preserve the capitalization of the first word' do
    to_camel_case("The_Stealth_warrior").must_equal "TheStealthWarrior"
  end
end

def to_camel_case(str)
  str.include?('-') ? body = str.split('-') : body = str.split('_')
  head = body.shift
  head.capitalize! if str.chr =~ /[A-Z]/
  body.map! { |word| word.capitalize }
  head.to_s + body.join
end

#unfinished
# def to_camel_case(str)
#   str.capitalize! if str.chr =~ /[A-Z]/
#   str.include?('-') ? body = str.split('-') : body = str.split('_')
#   body.map! { |word| word.capitalize }
#   body.join
end

#pragdave
def to_camel_case(str)
  str.gsub(/[-_](\w)/) { $1.upcase }
end
