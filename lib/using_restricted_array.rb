require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
def length(array)
  # can't use times (cuz I don't know the number); but I can use until or while conditionals
  # ask index if it's nil, if it's not nil then add to the counter
  counter = 0 # <-- counter asks: "are you empty? No, then go to the next one"
  # while counter != nil
  until array[counter] == nil
    counter += 1
  end
  return counter
end

# Prints each integer values in the array
def print_array(array)
  # raise NotImplementedError
  # can't use each, but can use 'times', can't use length
  counter = 0
  until array[counter] == nil
    puts "#{array[counter]}"
    counter += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  # raise NotImplementedError
  # length is known, we should use it
  # like a lottery that has been played, check the numbers
  # i = 0 <<< --- don't need this
  length.times do |i|
    if array[i] == value_to_find
      return true
    end # ends if
  end # ends loop
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  # raise NotImplementedError
  largest_int = array[0]  # the default, we'll reassign it later
  (length - 1).times do |index|
    if array[index + 1] > largest_int
      largest_int = array[index + 1]
    end
  end
  return largest_int
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  # raise NotImplementedError
  smallest_int = array[0]
  (length - 1).times do |index|
    if array[index + 1] < smallest_int
      smallest_int = array[index + 1]
    end
  end
  return smallest_int
end

# Reverses the values in the integer array in place
def reverse(array, length)
  # raise NotImplementedError
  # assume array is 4 intergers long
  # use a temp array variable
  # array[0] = array[length - 1]
  # array[length - 1] = temp
  # use a times loop?
  # use RestrictedArray instance
  reversed_array = RestrictedArray.new(length)
  # reversed_array is empty array with same length as the original array they gave you in the param
  index = 0
  while index < length
    reversed_array[index] = array[length - 1 - index]
    index += 1
  end
  # next, do a times loop to copy reversed array to original array(AKA "array")
  length.times do |i|
    array[i] = reversed_array[i] # <<<-- copying one to the other
  end
  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  low_index = 0
  high_index = length
  middle_index = (low_index + high_index) / 2

  while low_index < middle_index
    if value_to_find < array[middle_index]
      high_index = middle_index
      middle_index = (low_index + high_index) / 2
    elsif value_to_find > array[middle_index]
      low_index = middle_index
      middle_index = (low_index + high_index) / 2
    else
      return true
    end
  end
  return false
end


###########################################
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
