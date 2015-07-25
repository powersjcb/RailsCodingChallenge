
class Cuboid

  attr_reader :x, :y, :z, :height, :width, :length

  #BEGIN public methods that should be your starting point
  def initialize(options = {})
    defaults = { height: 1, width: 1, length: 1, x: 0, y: 0, z: 0 }
    options = defaults.merge(options)

    @x = options[:x]
    @y = options[:y]
    @z = options[:z]

    @width = options[:width]   # x axis
    @height = options[:height] # y axis
    @length = options[:length] # z axis

    self
  end

  def move_to!(x, y, z)
    @x, @y, @z, = x, y, z
  end

  # assumes that origin is at centroid
  def vertices
    unit_corners = []


  end

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
  end

  #END public methods that should be your starting point
end
