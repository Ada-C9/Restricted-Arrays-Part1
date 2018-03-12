require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/restricted_array'
require_relative '../lib/using_restricted_array'

describe "restricted array" do
  it "length method" do
    size = 5
    int_array = RestrictedArray.new(size)

    int_array_length = length(int_array)

    int_array_length.must_equal size
  end

  it "linear search method - value exists in the middle, in the array" do
    size = 9
    int_array = RestrictedArray.new(size)
    value_to_find = 120
    middle_index = size / 2
    int_array[middle_index] = value_to_find

    search(int_array, size, value_to_find).must_equal true
  end

  it "linear search method - value exists at the last index in the array" do
    size = 7
    int_array = RestrictedArray.new(size)
    size.times do |i|
      int_array[i] = i
    end
    value_to_find = 120
    int_array[size - 1] = value_to_find

    search(int_array, size, value_to_find).must_equal true
  end

  it "linear search method - value does not exist in array" do
    size = 4
    int_array = RestrictedArray.new(size)
    size.times do |i|
      int_array[i] = i
    end
    value_to_find = 120

    search(int_array, size, value_to_find).must_equal false
  end

  it "find largest in unsorted array" do
    size = 17
    int_array = RestrictedArray.new(size)

    largest = find_largest(int_array, size)

    sort(int_array, size)
    largest.must_equal int_array[size - 1]
  end

  it "find largest in sorted array" do
    size = 14
    int_array = RestrictedArray.new(size)
    sort(int_array, size)

    largest = find_largest(int_array, size)

    largest.must_equal int_array[size - 1]
  end

  it "find smallest in unsorted array" do
    size = 12
    int_array = RestrictedArray.new(size)

    smallest = find_smallest(int_array, size)

    sort(int_array, size)
    smallest.must_equal int_array[0]
  end

  it "find smallest in sorted array" do
    size = 11
    int_array = RestrictedArray.new(size)
    sort(int_array, size)

    smallest = find_smallest(int_array, size)

    smallest.must_equal int_array[0]
  end

  it "reverse array - odd count" do
    size = 9
    int_array = RestrictedArray.new(size)
    test_array = Array.new(size)
    size.times do |i|
      test_array[i] = int_array[i]
    end
    test_array.reverse!

    reverse(int_array, size)

    length(int_array).must_equal size
    size.times do |i|
      int_array[i].must_equal test_array[i]
    end
  end

  it "reverse array - even count" do
    size = 8
    int_array = RestrictedArray.new(size)
    test_array = Array.new(size)
    size.times do |i|
      test_array[i] = int_array[i]
    end
    test_array.reverse!

    reverse(int_array, size)

    length(int_array).must_equal size
    size.times do |i|
      int_array[i].must_equal test_array[i]
    end
  end

  it "find largest in sorted, reversed array" do
    size = 14
    int_array = RestrictedArray.new(size)
    sort(int_array, size)
    reverse(int_array, size)

    largest = find_largest(int_array, size)

    largest.must_equal int_array[0]
  end

  it "find smallest in sorted, reversed array" do
    size = 11
    int_array = RestrictedArray.new(size)
    sort(int_array, size)
    reverse(int_array, size)

    smallest = find_smallest(int_array, size)

    smallest.must_equal int_array[size - 1]
  end

  it "linear search method on sorted, reversed array - value exists in the array" do
    size = 13
    int_array = RestrictedArray.new(size)
    size.times do |i|
      int_array[i] = i * 10
    end
    value_to_find = 0
    reverse(int_array, size)

    search(int_array, size, value_to_find).must_equal true
  end

  it "binary search method - value exists at the last index in the array" do
    size = 13
    int_array = RestrictedArray.new(size)
    size.times do |i|
      int_array[i] = i * 10
    end
    value_to_find = (size - 1) * 10

    binary_search(int_array, size, value_to_find).must_equal true
  end

  it "binary search method - value exists at the middle index in the array" do
    size = 15
    int_array = RestrictedArray.new(size)
    size.times do |i|
      int_array[i] = i * 10
    end
    value_to_find = (size/2) * 10

    binary_search(int_array, size, value_to_find).must_equal true
  end

  it "binary search method - value does not exist in the array" do
    size = 15
    int_array = RestrictedArray.new(size)
    size.times do |i|
      int_array[i] = i * 10
    end
    value_to_find = size * 10

    binary_search(int_array, size, value_to_find).must_equal false
  end
end
