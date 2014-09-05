class Hash
  def method_missing(arg)
    self.fetch(arg) { |x| raise NoMethodError }
  end
end

require "minitest/autorun"

describe Hash do
  it 'return value when key used as method' do
    hash = { a: 1, b: 2, c: 3}
    hash.a == 1
  end

  it 'return NoMethodError when key unavailable' do
    hash = { a: 1, b: 2, c: 3}
    Proc.new { hash.z }.must_raise NoMethodError
  end
end
