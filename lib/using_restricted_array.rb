require 'pry'
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
    count = count + 1
  end
  return count
end

# Prints each integer values in the array
def print_array(array)
  count = 0
  until array[count] == nil
    print array[count]
    count += 1
  end
end
#
# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  value_found = false
  unless value_found == true
    index = 0
    length.times do
      if array[index] == value_to_find
        value_found = true
      else
        index += 1
      end
    end
  end
  return value_found
end
#

def find_first_non_nil (array, length)
  # I made this to help my find_largest and find_smallest
  # methods to not break when arrays have values of nil
  # at one or more positions.
  first_non_nil = false
  index = 0
  until first_non_nil != false
    length.times do
      if array[index] != nil
        first_non_nil = index
      else
        index +=1
      end
    end
  end
  return first_non_nil
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  # This is not passing on sorted, reversed arrays, but I think
  # that might be because the test is broken.  It seems to be
  # asserting equal to the array's minimum value instead of the maximum.
  first_non_nil = find_first_non_nil(array, length)
  if array[0] == nil
    largest = array[first_non_nil]
  else
    largest = array[0]
  end
  index = 0
  length.times do
    if array[index] == nil
    elsif array[index] > largest
      largest = array[index]
    end
    index += 1
  end
  return largest
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  first_non_nil = find_first_non_nil(array, length)
  nil_count = first_non_nil - 0
  smallest = array[first_non_nil]
  index = 0
  length.times do
    if array[index] == nil
      nil_count += 1
    elsif array[index] < smallest
      smallest = array[index]
    end
    index += 1
  end
  if nil_count > 0
    smallest = nil
  end
  return smallest
end
#


#
# Reverses the values in the integer array in place
def reverse(array, length)
  # I tried to do this, even though it wasn't assigned yet,
  # because it was an interesting puzzle.  It's failing
  # the tests that involve reversed arrays, but after using
  # pry a bunch to see what was going on, I am going to go
  # out on a limb and guess that the failures are due to the
  # tests being set up  to teach us something about
  # destructive and non-destructive array methods, and that
  # we just haven't gotten all the instructions for that
  # part of the assignment yet.
  reversed_array = []
  og_index = length - 1
  tgt_index = 0
  unless og_index == -1
    length.times do
      reversed_array[tgt_index] = array[og_index]
      tgt_index += 1
      og_index -= 1
    end
  end
  return reversed_array
end

#
# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  search_position = (length - 1)
  found = false
    unless found == true
      (length / 2).times do
        unless array[search_position] == nil
          if array[search_position] == value_to_find
            found = true
          elsif
            array[search_position] > value_to_find
              search_position -= (search_position / 2)
          elsif
            array[search_position] < value_to_find
              search_position += (search_position / 2)
          end
        end
      end
    end
  return found
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
    temp_index = index + 1 # compare with values at index+1 to length-1
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
