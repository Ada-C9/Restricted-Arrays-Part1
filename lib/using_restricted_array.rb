require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
def length(array)
  index = 0
  index += 1 while !array[index].nil?
  return index
end

# Prints each integer values in the array
def print_array(array)
  index = 0
  while !array[index] == nil?
    puts array[index]
    index += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  is_found = false
  index = 0
  while !is_found && index < length
    is_found = array[index] == value_to_find
    index += 1
  end
  return is_found
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  largest = 0
  index = 0
  while index < length
    largest = array[index] if array[index] > largest
    index += 1
  end
  return largest
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  smallest = array[0]
  index = 1
  while index < length
    smallest = array[index] if array[index] < smallest
    index += 1
  end
  return smallest
end

# Reverses the values in the integer array in place
def reverse(array, length)
  mid = length / 2
  index = 0
  while index < mid
    temp_holder = array[index]
    array[index] = array[length - index - 1]
    array[length - index - 1] = temp_holder
    index += 1
  end
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  raise NotImplementedError
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
