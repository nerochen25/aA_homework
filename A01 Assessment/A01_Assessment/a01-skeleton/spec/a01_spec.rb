require 'rspec'
require 'spec_helper'
require 'a01'

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

describe "#dups" do
  # Write a new Array method (using monkey-patching) that will return
  # the location of all identical elements. The keys are the
  # duplicated elements, and the values are arrays of their positions,
  # sorted lowest to highest.

  it "solves a simple example" do
    expect([1, 3, 0, 1].dups).to eq({ 1 => [0, 3] })
  end

  it "finds two dups" do
    expect([1, 3, 0, 3, 1].dups).to eq({ 1 => [0, 4], 3 => [1, 3] })
  end

  it "finds multi-dups" do
    expect([1, 3, 4, 3, 0, 3].dups).to eq({ 3 => [1, 3, 5] })
  end

  it "returns {} when no dups found" do
    expect([1, 3, 4, 5].dups).to eq({})
  end
end

describe "#fibs_rec" do
  # write a recursive implementation of a method that returns the
  # first `n` fibonacci numbers.

  it "returns first fibonacci number" do
    expect(fibs_rec(1)).to eq([0])
  end

  it "returns first two fib numbers" do
    expect(fibs_rec(2)).to eq([0, 1])
  end

  it "returns many fibonacci numbers" do
    expect(fibs_rec(6)).to eq([0, 1, 1, 2, 3, 5])
  end

  it "calls itself recursively" do
    expect(self).to receive(:fibs_rec).at_least(:twice).and_call_original
    fibs_rec(6)
  end
end

describe '#uniq_subs' do
  # write a method that finds all the unique substrings for a word

  it "returns an array" do
    expect("substring".uniq_subs).to be_a(Array)
  end

  it "does not return any duplicate substrings" do
    expect("stringstring".uniq_subs.uniq).to eq("stringstring".uniq_subs)
  end

  it "returns all unique substrings" do
    expect("str".uniq_subs).to match(["s", "st", "str", "t", "tr", "r"])
  end

  it "returns all unique substrings II" do
    expect("abab".uniq_subs).to match([
      "a",
      "ab",
      "aba",
      "abab",
      "b",
      "ba",
      "bab"
      ])
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

describe 'Array#my_map' do
  it 'calls the block passed to it' do
    expect do |block|
      ["test array"].my_map(&block)
    end.to yield_control.once
  end

  it 'yields each element to the block' do
    expect do |block|
      ["el1", "el2"].my_map(&block)
    end.to yield_successive_args("el1", "el2")
  end

  it 'runs the block for each element' do
    expect([1, 2, 3].my_map { |el| el * el }).to eq([1, 4, 9])
    expect([-1, 0, 1].my_map { |el| el.odd? }).to eq([true, false, true])
  end

  it 'does NOT call the built in Array#map method' do
    original_array = ["original array"]
    expect(original_array).not_to receive(:map)
    original_array.my_map {}
  end

  it 'is chainable and returns a new array' do
    original_array = ["original array"]
    expect(original_array.my_map {}).not_to eq(original_array)
  end
end
