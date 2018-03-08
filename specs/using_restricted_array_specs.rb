require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'
require_relative '../lib/restricted_array'
require_relative '../lib/using_restricted_array'

describe "restricted array" do
  it "001 length method" do
    size = 5
    my_integer_array = RestrictedArray.new(size)

    my_integer_array_length = length(my_integer_array)

    my_integer_array_length.must_equal size
  end

  it "002 linear search method - value exists in the middle, in the array" do
    size = 9
    my_integer_array = RestrictedArray.new(size)
    value_to_find = 120
    middle_index = size / 2
    my_integer_array[middle_index] = value_to_find

    search(my_integer_array, size, value_to_find).must_equal true
  end

  it "003 linear search method - value exists at the last index in the array" do
    size = 7
    my_integer_array = RestrictedArray.new(size)
    size.times do |i|
      my_integer_array[i] = i
    end
    value_to_find = 120
    my_integer_array[size - 1] = value_to_find

    search(my_integer_array, size, value_to_find).must_equal true
  end

  it "004 linear search method - value does not exist in array" do
    size = 4
    my_integer_array = RestrictedArray.new(size)
    size.times do |i|
      my_integer_array[i] = i
    end
    value_to_find = 120

    search(my_integer_array, size, value_to_find).must_equal false
  end

  it "005 find largest in unsorted array" do
    size = 17
    my_integer_array = RestrictedArray.new(size)

    largest = find_largest(my_integer_array, size)

    sort(my_integer_array, size)
    largest.must_equal my_integer_array[size - 1]
  end

  it "006 find largest in sorted array" do
    size = 14
    my_integer_array = RestrictedArray.new(size)
    sort(my_integer_array, size)

    largest = find_largest(my_integer_array, size)

    largest.must_equal my_integer_array[size - 1]
  end

  it "007 find smallest in unsorted array" do
    size = 12
    my_integer_array = RestrictedArray.new(size)

    smallest = find_smallest(my_integer_array, size)

    sort(my_integer_array, size)
    smallest.must_equal my_integer_array[0]
  end

  it "008 find smallest in sorted array" do
    size = 11
    my_integer_array = RestrictedArray.new(size)
    sort(my_integer_array, size)

    smallest = find_smallest(my_integer_array, size)

    smallest.must_equal my_integer_array[0]
  end

  it "009 reverse array - odd count" do
    size = 9
    my_integer_array = RestrictedArray.new(size)
    test_array = Array.new(size)
    size.times do |i|
      test_array[i] = my_integer_array[i]
    end
    test_array.reverse!

    reverse(my_integer_array, size)

    length(my_integer_array).must_equal size
    size.times do |i|
      my_integer_array[i].must_equal test_array[i]
    end
  end

  it "010 reverse array - even count" do
    size = 8
    my_integer_array = RestrictedArray.new(size)

    test_array = Array.new(size)

    size.times do |i|
      test_array[i] = my_integer_array[i]
    end
    test_array.reverse!

    reverse(my_integer_array, size)

    length(my_integer_array).must_equal size

    size.times do |i|
      my_integer_array[i].must_equal test_array[i]
    end
  end

  it "011 find largest in sorted, reversed array" do
    size = 14
    my_integer_array = RestrictedArray.new(size)
    sort(my_integer_array, size)
    reverse(my_integer_array, size)

    largest = find_largest(my_integer_array, size)

    largest.must_equal my_integer_array[0]
  end

  it "012 find smallest in sorted, reversed array" do
    size = 11
    my_integer_array = RestrictedArray.new(size)
    sort(my_integer_array, size)
    reverse(my_integer_array, size)

    smallest = find_smallest(my_integer_array, size)

    smallest.must_equal my_integer_array[size - 1]
  end

  it "013 linear search method on sorted, reversed array - value exists in the array" do
    size = 13
    my_integer_array = RestrictedArray.new(size)
    size.times do |i|
      my_integer_array[i] = i * 10
    end
    value_to_find = 0
    reverse(my_integer_array, size)

    search(my_integer_array, size, value_to_find).must_equal true
  end

  it "014 binary search method - value exists at the last index in the array" do
    size = 13
    my_integer_array = RestrictedArray.new(size)
    size.times do |i|
      my_integer_array[i] = i * 10
    end
    value_to_find = (size - 1) * 10

    binary_search(my_integer_array, size, value_to_find).must_equal true
  end

  it "015 binary search method - value exists at the middle index in the array" do
    size = 15
    my_integer_array = RestrictedArray.new(size)
    size.times do |i|
      my_integer_array[i] = i * 10
    end
    value_to_find = (size/2) * 10

    binary_search(my_integer_array, size, value_to_find).must_equal true
  end

  it "016 binary search method - value does not exist in the array" do
    size = 15
    my_integer_array = RestrictedArray.new(size)
    size.times do |i|
      my_integer_array[i] = i * 10
    end
    value_to_find = size * 10

    binary_search(my_integer_array, size, value_to_find).must_equal false
  end
end
