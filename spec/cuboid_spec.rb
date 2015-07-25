require 'cuboid'

#This test is incomplete and, in fact, won't even run without errors.
#  Do whatever you need to do to make it work and please add your own test cases for as many
#  methods as you feel need coverage
describe Cuboid do
  subject(:subject) { Cuboid }

  context '#initialize' do
    let(:d_cube) {subject.new}
    let(:c_cube) {subject.new({ height: 2, width: 3, length: 4,
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

  context "#move_to" do
    it "changes the origin in the simple happy case" do
      expect(subject.move_to!(1,2,3)).to be true
    end
  end

  context "intersects?" do
  end

end
