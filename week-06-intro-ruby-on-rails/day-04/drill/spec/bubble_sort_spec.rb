# THIS FILE PERFORMS RSPEC TESTS ON `bubble_sort.rb`
# TO RUN YOUR TESTS TYPE: `rspec` (from the main project folder)

# require "./solution.rb"
require "./bubble_sort.rb"

describe "#bubble_sort" do

  it "moves the largest integer to the end of the array" do
    expect( bubble_sort( [6,2,5,3,4]) ).to end_with 6
  end

  it "moves the smallest integer to the front of the array" do
    expect( bubble_sort( [6,2,5,3,4]) ).to start_with 2
  end

  it "handles an empty array" do
    expect( bubble_sort([]) ).to eq []
  end

  it "handles an array of length one" do
    expect( bubble_sort([1]) ).to eq [1]
  end

  # let declares variables that are available in each test block
  #   each variable is reset for each test case
  let (:sorted_array) { [1,2,3,4,5,6] }
  let (:shuffled_array) { sorted_array.shuffle }

  it "sorts the array from least to greatest" do
    expect( bubble_sort( [6,2,5,3,4]) ).to eq [2,3,4,5,6]
    expect( bubble_sort( shuffled_array) ).to eq sorted_array
  end

  it "handles zero appropriately" do
    expect( bubble_sort( [6,2,5,3,4,0]) ).to start_with 0
  end

  it "handles negative numbers appropriately" do
    expect( bubble_sort( [6,2,-11, 5,3,4]) ).to start_with -11
  end

  it "handles positive and negative infinity" do
    expect( bubble_sort( [Float::INFINITY, 10, 0, 100, -Float::INFINITY]) ).to eq [-Float::INFINITY, 0, 10, 100, Float::INFINITY]
  end

end
