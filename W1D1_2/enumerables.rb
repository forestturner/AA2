
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
      if (element.is_a?(Array))
        # p element
        element.my_flatten
        # p results
      else
        results << element
      end
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

# my_each_test()
# my_select_test()
# my_reject_test()
# my_any_and_all_test()
my_flatten_test()
