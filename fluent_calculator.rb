module Operation
include Number

  def add
    +
  end

  def minus
    -
  end

  def times
    *
  end

module Number
include Operation
  def one
    1
  end
  
  def two
    2
  end
  
  def three
    3
  end
  
  def four
    4
  end
  
  def five
    5
  end
  
  def six
    6
  end
  
  def seven
    7
  end
  
  def eight
    8
  end
  
  def nine
  end
end

class Calc
include Number
end