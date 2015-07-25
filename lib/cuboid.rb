
class Cuboid

  UNIT_VERTICES =
       [[ 1,  1,  1],
        [-1,  1,  1],
        [-1, -1,  1],
        [-1, -1, -1],
        [ 1, -1,  1],
        [ 1, -1, -1],
        [ 1,  1, -1],
        [-1,  1, -1]]

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

    self
  end

  # assumes origin at centroid
  def vertices
    vertices = UNIT_VERTICES.map do |vertex|
      [
        x + vertex[0] * @width  / 2,
        y + vertex[1] * @height / 2,
        z + vertex[2] * @length / 2
      ]
    end

    vertices
  end

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
    min_x < other.max_x &&
    max_x > other.min_x &&
    min_y < other.max_y &&
    max_y > other.min_y &&
    min_z < other.max_z &&
    max_z > other.min_z
  end


  # public utility methods
  def max_x
    vertices.map { |vertex| vertex[0] }.max
  end

  def min_x
    vertices.map { |vertex| vertex[0] }.min
  end

  def max_y
    vertices.map { |vertex| vertex[1] }.max
  end

  def min_y
    vertices.map { |vertex| vertex[1] }.min
  end

  def max_z
    vertices.map { |vertex| vertex[2] }.max
  end

  def min_z
    vertices.map { |vertex| vertex[2] }.min
  end



end
