
def my_each_test
  return_value = [1, 2, 3].my_each do |num|
    puts num
  end.my_each do |num|
    puts num
  end
#  => 1
#     2
#     3
#     1
#     2
#     3

  p return_value  # => [1, 2, 3]
end

def my_select_test
  a = [1, 2, 3]
  p a.my_select { |num| num > 1 } # => [2, 3]
  p a.my_select { |num| num == 4 } # => []
end

def my_reject_test
  a = [1, 2, 3]
 p a.my_reject { |num| num > 1 } # => [1]
 p a.my_reject { |num| num == 4 } # => [1, 2, 3]
end

def my_any_and_all_test()
  a = [1, 2, 3]
  p a.my_any? { |num| num > 1 } # => true
  p a.my_any? { |num| num == 4 } # => false
  p a.my_all? { |num| num > 1 } # => false
  p a.my_all? { |num| num < 4 } # => true
end

def my_flatten_test()

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten
 # => [1, 2, 3, 4, 5, 6, 7, 8]
end

class Array
  def my_flatten()
    results = []
    self.each do |element|
      element.is_a?(Array) ? (results +=   element.my_flatten()) : results << element
    end
    return results
  end
  def my_each(&prc)
    self.length.times do |index|
      prc.call(self[index])
    end
    self
  end
  def my_select(&prc)
    results = []
    self.my_each do |num|
      prc.call(num) ? results << num : false
    end
    results
  end
  def my_reject(&prc)
    results = []
    self.my_each do |num|
      prc.call(num) ?  false : results << num
    end
    results
  end
  def my_any?(&prc)
    self.my_each do |num|
      prc.call(num) ? (return true) : false
    end
    false
  end
  def my_all?(&prc)
    self.my_each do |num|
      prc.call(num) ? true : (return false)
    end
    true
  end
end



# Write my_zip to take any number of arguments. It should return a new array
# containing self.length elements. Each element of the new array should be an
# array with a length of the input arguments + 1 and contain the merged elements
# at that index. If the size of any argument is less than self, nil is returned
# for that location.
#
# Example:
#
class Array
  def my_zip(*input_arrays)
    number_of_arrays = self.length
    results = []
    number_of_arrays.times do |index|
      one_array = []
      one_array.push(self[index])
      input_arrays.each do |input_array|
        input_array[index] ? one_array.push(input_array[index]) : one_array.push(nil)
      end
      results << one_array
    end
    results
  end
end

def my_zip_test
  a = [ 4, 5, 6 ]
  b = [ 7, 8, 9 ]
  p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
  p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

  c = [10, 11, 12]
  d = [13, 14, 15]
  p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
end



# My Rotate
#
# Write a method my_rotate that returns self rotated. By default, the array
# should rotate by one element. If a negative value is given, the array is rotated
# in the opposite direction.
#
# Example:
def my_rotate_test()
  a = [ "a", "b", "c", "d" ]
  p a.my_rotate         #=> ["b", "c", "d", "a"]
  p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
  p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
  p a.my_rotate(15)     #=> ["d", "a", "b", "c"]
end

class Array
  def my_rotate(number = 1)
    results = []
    number =  number % self.length
  #  index_change = number
    self.length.times do |index|
      p index
      p number
      results.push(self[number - index])
    end
    results
  end

end

my_rotate_test()

# My Join
#
# my_join returns a single string containing all the elements of the array,
# separated by the given string separator. If no separator is given, an empty
# string is used.
#
# Example:
#
# a = [ "a", "b", "c", "d" ]
# a.my_join         # => "abcd"
# a.my_join("$")    # => "a$b$c$d"
# My Reverse
#
# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
#
# Example:
#
# [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# [ 1 ].my_reverse               #=> [1]
# Review
#
# Now that we're all warmed up, let's go back to the iteration exercises from
# the prepwork and implement the following methods:
#
#  factors(num)
#  bubble_sort!(&prc)
#  bubble_sort(&prc)
#  substrings(string)
#  subwords(word, dictionary)
# Remember that these are from the prepwork, so there are specs for them. You
# can use those to test your solutions.
#





# my_each_test()
# my_select_test()
# my_reject_test()
# my_any_and_all_test()
# my_flatten_test()
 # my_zip_test()
