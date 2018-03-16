require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
def length(array)
  count = 0
  until array[count] == nil
    count += 1
  end
  count
end

# Prints each integer values in the array
def print_array(array)
  count = 0
  printed_array = ""
  until count == length(array)
    until count == length(array) - 1
      printed_array << "#{array[count]} "
      count += 1
    end
    printed_array << "#{array[count]}"
    count += 1
  end
  printed_array
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  count = 0
  until count == length
    return true if array[count] == value_to_find
    count += 1
  end
  false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  count = 0
  largest_value = 0
  until count == length
    if array[count] > largest_value
      largest_value = array[count]
    end
    count += 1
  end
  largest_value
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  count = 0
  smallest_value = 200
  until count == length
    if array[count] < smallest_value
      smallest_value = array[count]
    end
    count += 1
  end
  smallest_value
end

# Reverses the values in the integer array in place
def reverse(array, length)
  count_1 = 0
  count_2 = length - 1
  while count_1 <= count_2
    early_value = array[count_1]
    array[count_1] = array[count_2]
    array[count_2] = early_value
    count_1 += 1
    count_2 -= 1
  end
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  low = 0
  high = length - 1
  mid = high/2
  until low == high
    return true if array[low] == value_to_find
    return true if array[mid] == value_to_find || array[high] == value_to_find
    if value_to_find > array[mid]
      low = mid
      mid = (low + high / 2)
    elsif value_to_find < array[mid]
      high = mid
      mid = (low + high / 2)
    end
  end
  false
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
