require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
def length(array)
  array_length = 0
  while array[array_length] != nil
    array_length += 1
  end
  return array_length
end

# Prints each integer values in the array
def print_array(array)
  character_position = 0
  while character_position < length(array)
    print array[character_position]
    character_position += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  value_position = 0
  while value_position < length
    if array[value_position] == value_to_find
      return true
    else
      value_position += 1
    end
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  largest_integer_value = array[0]
  integer_position = 0
  while integer_position < length
    if largest_integer_value < array[integer_position]
      largest_integer_value = array[integer_position]
    end
    integer_position += 1
  end
  return largest_integer_value
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  smallest_integer_value = array[0]
  integer_position = 0
  while integer_position < length
    if array[integer_position] < smallest_integer_value
      smallest_integer_value = array[integer_position]
    end
    integer_position += 1
  end
  return smallest_integer_value
end

# Reverses the values in the integer array in place
def reverse(array, length)
  reverse_array = Array.new(length)
  length.times do |index|
    reverse_array[index] = array[index]
  end

  integer_position = 0
  reverse_integer_position = length - 1

  while reverse_integer_position >= 0
    array[integer_position] = reverse_array[reverse_integer_position]
    reverse_integer_position -= 1
    integer_position += 1
  end
  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  min = 0
  max = length - 1
  while min <= max
    mid = (max + min) / 2
    if array[mid] == value_to_find
      return true
    elsif array[mid] < value_to_find
      min = mid + 1
    else
      max = mid - 1
    end
  end
  return false
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
# --- END OF METHODS ---
