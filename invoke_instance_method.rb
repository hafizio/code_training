require 'minitest/autorun'
require 'turn/autorun'

describe Array do
  it 'invoke the instance method given' do
    items = ['I', 'am', 'a', 'boy']
    items.invoke(:capitalize!).must_equal ['I', 'Am', 'A', 'Boy']
  end

  it 'invoke the instance method given' do
    items = ['I', 'am', 'a', 'boy']
    items.invoke(:delete, 'a').must_equal ['i', 'm', '', 'boy']
  end
end

#Original 1 (Failed)
class Array
  def invoke(method, *args, &block)
    # arg_arr = *args unless empty?
    # arg_str = arg_arr.join(', ')

    filtered = []
    self.each { |obj| filtered << obj if obj.respond_to?(method) }

    filtered.each do |obj|
      obj.send(method(*args))
      yield if block_given?
    end
  end
end

#Original 2 (Failed)
class Array
  def invoke(method, *args, &block)
    filtered = block.call(self) unless block.nil?
    argument = 
    filtered.each do |obj|

    end
  end
end