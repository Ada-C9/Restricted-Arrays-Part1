require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
def length(array)
  length = 0
  idx = 0
  until array[idx] == nil
    length += 1
    idx+= 1
  end
  return length
end

# Prints each integer values in the array
def print_array(array)
  idx = 0
  until array[idx] == nil
    print array[idx]
    idx += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)

  if length == 0 || length == nil
    return false
  end

  if value_to_find == nil
    return false
  end

  idx = 0
  length.times do
    if array[idx] == value_to_find
      return true
    end
    idx += 1
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  if length == 0 || length == nil
    return nil
  end

  idx = 0
  largest_value = array[0]
  length.times do
    if array[idx] >= largest_value
      largest_value = array[idx]
    end
    idx += 1
  end
  return largest_value
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  if length == 0
    return nil
  end

  idx = 0
  smallest_value = array[0]

  length.times do
    if array[idx] <= smallest_value
      smallest_value = array[idx]
    end
    idx += 1
  end
  return smallest_value
end

# Reverses the values in the integer array in place
def reverse(array, length)

end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  if length == 0 || length == nil
    return false
  end

  if value_to_find == nil
    return false
  end

  low = 0
  mid = length / 2
  high = length - 1



  while low < high
    if array[mid] == value_to_find
      return true
    elsif array[mid] > value_to_find
      high = mid - 1
    elsif array[mid] < value_to_find
      low = mid + 1
    end

    if array[low] == value_to_find
      return true
    elsif array[high] == value_to_find
      return true
    else
      return false
    end
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
my_array = [1, 2, 3, 4]
puts "result of method is:"
puts reverse(my_array, 3)
