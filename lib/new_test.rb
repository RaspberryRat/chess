require 'pry-byebug'
class Something
  attr_reader :arr
  def initialize(arr = structure(create_arr))

   @arr = arr
  end

  attr_reader :arr
  
  def create_arr
    arr2 = []
    (1..3).to_a.repeated_permutation(2) {|a| arr2 << a}
    arr2
  end
  
  Locations = Struct.new(:x, :y)
  def structure(arrs)
    arrs.map {|cell| Locations.new(cell[0], cell[1])}
  end
  
  def add_to
    arr.map { |pos| Square.for(pos) }
  end
end

class Square
  def self.for(pos)
    same = pos.x.even? == pos.y.even?
    if same
      Square1
    else
      Square2
    end.new(pos)
  end

  attr_reader :x, :y

  def initialize(pos)
    @x = pos.x
    @y = pos.y
  end
end

class Square1 < Square
  attr_reader :x, :y
  def initialize(pos)
    super(pos)
    binding.pry
  end

end

class Square2 < Square
  def initialize(pos)
    super(pos)
    binding.pry
  end
  
end

Something.new.add_to