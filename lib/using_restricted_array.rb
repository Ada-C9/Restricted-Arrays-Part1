require_relative 'restricted_array.rb'
require 'pry'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
def length(array)
  i = 0
  i += 1 while array[i] != nil
  return i
  raise NotImplementedError
end

# Prints each integer values in the array
def print_array(array)
  i = 0
  while array[i] != nil
    puts array[i]
    i += 1
  end
  return
  raise NotImplementedError
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  return false if length < 1

  i = 0
  while i < length
    return true if array[i] == value_to_find
    i += 1
  end
  return false
  raise NotImplementedError
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  return false if length < 1

  i = 0
  max = array[0]
  while i < length
    max = array[i] if array[i] > max
    i += 1
  end
  return max
  raise NotImplementedError
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  return false if length < 1

  i = 0
  min = array[0]
  while i < length
    min = array[i] if array[i] < min
    i += 1
  end
  return min
  raise NotImplementedError
end

# Reverses the values in the integer array in place
def reverse(array, length)
  return false if length < 1

  position = 0
  reverse_pos = length - 1
  iteration = length / 2
  iteration.times do
    placeholder = array[position]
    array[position] = array[reverse_pos]
    array[reverse_pos] = placeholder
    position += 1
    reverse_pos -= 1
  end
  return array
  raise NotImplementedError
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  # return false if length < 1
  low = 0
  high = length - 1

  while low < high
    mid = (low + high)/2
    if array[mid] == value_to_find
      return true
    elsif array[mid] > value_to_find
      high = mid - 1
    else
      low = mid + 1
    end
  end

  return true if array[low] == value_to_find
  return false
  # raise NotImplementedError
end

# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2) since to find the correct value to be in a given location,
# all the remaining elements are visited. This is done for each location.
# (nested loop of size n each)
# Space complexity = O(1) since the additional storage needed does not depend
#                    on input array size.
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
