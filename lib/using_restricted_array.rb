require_relative 'restricted_array.rb'
require 'pry'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
def length(array)
  length_of_array = 0
  while array[length_of_array] != nil
    array[length_of_array]
    length_of_array+=1
  end
  return length_of_array
end

# Prints each integer values in the array
def print_array(array)
  element = 0
  array_display = ''
  while array[length_of_array] != nil
    array_display += array[element].to_s + ' '
    element+=1
  end
  puts array_display
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  has_been_found = false
  index = 0
  while index < length
    if array[index] == value_to_find
      return true
    end
    index+=1
  end
  return false

end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  if length == 0
    return nil
  else
    i = 0
    largest_value = array[0]
    while i < length
      if largest_value < array[i]
        largest_value = array[i]
      end
      i+=1
      #binding.pry
    end
  end

  return largest_value
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  smallest_value = array[0]
  i = 0

  if length == 0
    return nil
  end
  while i < length
    if smallest_value > array[i]
      smallest_value = array[i]
    end
    i+=1
  end
  return smallest_value
end

# Reverses the values in the integer array in place
def reverse(array, length)
  raise NotImplementedError
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  # with an empty array value will not be found.
  if length == 0
    return false
  end

  low = 0
  high = length-1

  while low <= high
    mid = (low + high)/2
    if value_to_find == array[mid]
      return true
    elsif value_to_find < array[mid]
      high = mid - 1
    elsif value_to_find > array[mid]
      low = mid + 1
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
## --- END OF METHODS ---
