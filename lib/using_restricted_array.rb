require 'pry'
require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
def length(array)
  key = 0

  until array.[](key) == nil
    key += 1
    array.[](key)
  end

  return key
end

# Prints each integer value in the array
def print_array(array)
  key = 0

  until array.[](key) == nil
    print "#{array.[](key)} "
    key += 1
  end

end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)

  length.times do |key|
    if array.[](key) == value_to_find
      return true
    end
  end

  return false
end

# Finds and returns the largest integer value in the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  num = array.[](0)

  length.times do |key|
    if num < array.[](key)
      num = array.[](key)
    end
  end

  return num
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  num = array.[](0)

  length.times do |key|
    if num > array.[](key)
      num = array.[](key)
    end
  end

  return num
end

# Reverses the values in the integer array in place
def reverse(array, length)

  first = 0
  last = length - 1

  until first >= last
    store = array.[](first)

    array.[]=(first, array.[](last))
    array.[]=(last, store)

    first += 1
    last -= 1
  end

end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)

  low_index = 0
  high_index = length-1

  while low_index < high_index
    mid_index = (low_index + high_index)/2

    if array.[](mid_index) == value_to_find
      return true
    elsif array.[](mid_index) > value_to_find
      high_index = mid_index - 1
    elsif array.[](mid_index) < value_to_find
      low_index = mid_index + 1
    end

  end

  array.[](low_index) == value_to_find

end

# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2) since to find the correct value to be in a given location,
# all the remaining elements are visited. This is done for each location.
# (nested loop of size n each)
# Space complexity = O(1) since the additional storage needed does not depend
# on input array size.
def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index+1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1 # move to next index
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end
## --- END OF METHODS ---
