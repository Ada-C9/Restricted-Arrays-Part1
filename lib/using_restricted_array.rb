require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
def length(array)
  i = 0
  while array[i] != nil
    i += 1
  end
  return i
end


# Prints each integer values in the array
def print_array(array)
  i = 0
  while array[i] != nil
    print array[i]
    i += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  i = 0
  until array[i] == nil
    if value_to_find == array[i]
      return true
    end
    i += 1
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  largest_int = array[0]
  i = 0
  while i < length
    if array[i] > largest_int
      largest_int = array[i]
    end
    i += 1
  end
  return largest_int
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  i = 0
  smallest_int = array[0]
  while i < length
    if array[i] < smallest_int
      smallest_int = array[i]
    end
    i += 1
  end
  return smallest_int
end

# Reverses the values in the integer array in place
def reverse(array, length)
  first = 0
  final = -1
  while first < length
    array[first] = array[final]
    array[final] = array[first]
    first += 1
    final -= 1
  end
  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find) #[1,2,3,4,5]
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

  if array[low] == value_to_find
    return true
  else
    return false
  end
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
