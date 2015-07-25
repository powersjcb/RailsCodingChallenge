require 'cuboid'

#This test is incomplete and, in fact, won't even run without errors.
#  Do whatever you need to do to make it work and please add your own test cases for as many
#  methods as you feel need coverage
describe Cuboid do
  subject(:subject) { Cuboid }

  context '#initialize' do
    let(:d_cube) { subject.new }
    let(:c_cube) { subject.new({ height: 2, width: 3, length: 4,
                                x: 1.5, y: 2.5, z: 3.5 }) }
    it 'returns self' do
      expect(d_cube.class).to eq(subject)
    end

    it 'creates a cuboid with default centroid at origin' do
      expect([d_cube.x, d_cube.y, d_cube.z]).to eq([0,0,0])
    end

    it 'creates a cuboid with default edge length of 1' do
      expect([d_cube.height, d_cube.width, d_cube.length]).to eq([1,1,1])
    end

    it 'creates a cuboid with custom position' do
      expect([c_cube.x, c_cube.y, c_cube.z]).to eq([1.5, 2.5, 3.5])
    end

    it 'creates a cuboid with custom size' do
      expect([c_cube.height, c_cube.width, c_cube.length]).to eq([2,3,4])
    end
  end

  context '#vertices' do
    let(:cube) { subject.new }

    it 'provides correct number of vertices' do
      expect(cube.vertices.length).to eq(8)
    end

    it 'contains all Numeric position values' do
      expect(
        cube.vertices.all? {|v| v.all? {|val| val.is_a? Numeric } }
      ).to be true
    end
  end

  context "#move_to" do
    let(:cube) { subject.new }
    it "changes the origin in the simple happy case" do
      cube.move_to!(1,2,3)
      expect([cube.x, cube.y, cube.z]).to eq([1,2,3])
    end
  end

  context "#intersects?" do
    let(:cube_base)  { subject.new }
    let(:cube_encap) { subject.new({ height: 0.5, width: 0.5, length: 0.5 }) }
    let(:cube_no_overlap) {subject.new({ x: 10 })}
    let(:cube_overlap) {subject.new({ x: 0.25 })}

    it 'returns true when compared to itself' do
      expect(cube_base.intersects?(cube_base)).to be true
    end

    it 'returns true when compared to an encapsulated cube' do
      expect(cube_base.intersects?(cube_encap)).to be true
    end

    it 'returns true when encapsulated by another cube' do
      expect(cube_encap.intersects?(cube_base)).to be true
    end

    it 'returns true when partially overlapping' do
      expect(cube_encap.intersects?(cube_overlap)).to be true
    end

    it 'returns false when not overlapping' do
      expect(cube_base.intersects?(cube_no_overlap)).to be false
    end
  end

  context '#rotate_x' do
    before(:each) { @cube_x = subject.new({ height: 1.5, length: 2.5})}

    it 'changes the perceived length and height values' do
      @cube_x.rotate_x
      expect([@cube_x.height, @cube_x.length]).to eq([2.5, 1.5])
    end

    it 'returns true if there is a collision' do
      expect(@cube_x.rotate_x).to be true
    end

    it 'moves the origin when there is a collision' do
      @cube_x.rotate_x
      expect(@cube_x.min_y).to eq(0)
    end

  end

end
