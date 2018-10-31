require 'rspec'
require 'spec_helper'
require 'a-1'

describe 'missing_numbers' do
  it 'returns the correct numbers ordered from least to greatest' do
    expect(missing_numbers([2, 3, 7])).to eq([4, 5, 6])
  end

  it 'returns an empty array if no numbers are needed to complete the set' do
    expect(missing_numbers([1, 2, 3])).to eq([])
  end

  it 'works with negative numbers' do
    expect(missing_numbers([-4, 1, 4])).to eq([-3, -2, -1, 0, 2, 3])
  end

  it 'can handle larger sets' do
    expect(missing_numbers([2, 2000])).to eq((3..1999).to_a)
  end

end

describe "#nth_prime" do
  # `nth_prime(n)` returns the nth prime number
  it "returns the first prime number" do
    expect(nth_prime(1)).to eq(2)
  end

  it "returns the fifth prime number" do
    expect(nth_prime(5)).to eq(11)
  end

  it "returns nil when asked for the zeroth prime" do
    expect(nth_prime(0)).to be_nil
  end
end

describe 'Hash#my_select' do
  it 'does not call the built in Hash#select' do
    test_hash = {a: 1, b: 2, c: 3}
    expect(test_hash).not_to receive(:select)
    test_hash.my_select {}
  end

  it 'yields each element to the block' do
    test_hash = {a: 1, b: 2, c: 3}
    expect { |b| test_hash.my_select(&b)}.to yield_successive_args([:a, 1], [:b, 2], [:c, 3])
  end

  it 'returns a hash of filtered key-value pairs based on key' do
    test_hash = {a: 1, b: 2, c: 3}
    expect(test_hash.my_select { |k, v| k == :a }).to eq({a: 1})
  end

  it 'returns a hash of filtered key-value pairs based on value' do
    test_hash = {a: 1, b: 2, c: 3}
    expect(test_hash.my_select { |k, v| v >= 2 }).to eq({b: 2, c: 3})
  end

end

describe 'longest_palindrome' do

  it 'returns false if there is no palindrome longer than two letters' do
    expect(longest_palindrome("palindrome")).to eq(false)
  end

  it 'returns the correct length of the palindrome' do
    expect(longest_palindrome("181847117432")).to eq(6)
  end

  it 'returns the correct length for the longest palindrome in the string' do
    expect(longest_palindrome("noonminimum")).to eq(5)
  end

end

describe 'Array#my_each' do
  it 'calls the block passed to it' do
    expect do |block|
      ["test array"].my_each(&block)
    end.to yield_control.once
  end

  it 'yields each element to the block' do
    expect do |block|
      ["el1", "el2"].my_each(&block)
    end.to yield_successive_args("el1", "el2")
  end

  it 'does NOT call the Array#each or Array#map! method' do
    original_array = ["original array"]
    expect(original_array).not_to receive(:each)
    expect(original_array).not_to receive(:map!)
    original_array.my_each {}
  end

  it 'is chainable and returns the original array' do
    original_array = ["original array"]
    expect(original_array.my_each {}).to be(original_array)
  end
end

describe "#bubble_sort" do
  # write a new `Array#bubble_sort` method; it should not modify the
  # array it is called on, but creates a new sorted array.
  let(:array) { [1, 2, 3, 4, 5].shuffle }

  it "works with an empty array" do
    expect([].bubble_sort).to eq([])
  end

  it "works with an array of one item" do
    expect([1].bubble_sort).to eq([1])
  end

  it "sorts numbers" do
    expect(array.bubble_sort).to eq(array.sort)
  end

  it "will use block if given" do
    sorted = array.bubble_sort do |num1, num2|
      # order numbers based on descending sort of their squares
      num2**2 <=> num1**2
    end

    expect(sorted).to eq([5, 4, 3, 2, 1])
  end

  it "does not modify original" do
    duped_array = array.dup
    duped_array.bubble_sort
    expect(duped_array).to eq(array)
  end
end

describe 'Cat' do
  subject(:cat) { Cat.new('George') }

  it 'should have a name' do
    expect(cat.name).to eq('George')
  end

  it 'should not allow you to change their name' do
    expect{ cat.name = 'Frederick' }.to raise_error
  end

  it 'should meow' do
    expect(cat.meow).to eq('meow')
  end

  it 'should meow when it receives affection' do
    expect(cat).to receive(:meow)
    cat.receive_love
  end
end

describe 'Dog' do
  BREEDS = ['Husky', 'Black Labrador', 'German Shepherd', 'Chihuahua']
  subject(:dog) { Dog.new('Maximus', 'Doberman') }
  let(:cat) { Cat.new('Frederick') }

  it 'should have a name and breed' do
    expect(dog.name).to eq('Maximus')
    expect(dog.breed).to eq('Doberman')
  end

  it 'should allow you to change their name' do
    dog.name = 'Wolfie'
    expect(dog.name).to eq('Wolfie')
  end

  it 'should play with cat friends' do
    expect(cat).to receive(:receive_love)
    dog.play_with(cat)
  end

  it 'should have a puppy factory to make puppies' do
    expect(Dog).to receive(:new)
    Dog.make_a_pup
  end

  it 'should assign random breeds from the provided set when making puppies' do
    pup = Dog.make_a_pup
    expect(Dog::BREEDS).to include(pup.breed)
  end
end

describe 'Human' do
  subject(:owner) { Human.new('Jorge') }
  let(:dog) { Dog.new('Leila', 'Boston Terrier') }

  it 'is unhappy without a dog to play with' do
    expect(owner.happy?).to be false
  end

  it 'should enjoy puppy love' do
    dog.play_with(owner)
    expect(owner.happy?).to be true
  end
end
