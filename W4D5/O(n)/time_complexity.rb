require "byebug"

def my_min(arr) #O(N^2)

    curr_min = arr[0]

    arr.each do |ele|
        arr.each do |other_ele|
            curr_min = other_ele if other_ele < curr_min
        end
    end

    curr_min
end

def better_min(arr) #O(N)

    curr_min = arr.first

    arr.each do |ele|
        curr_min = ele if ele < curr_min
    end

    curr_min
end

def worse_contiguous_subsum(arr) #O(N^3)
    results = []

    (0...arr.length).each do |i|
        (i...arr.length).each do |j|
            results << arr[i..j]
        end
    end

    results.map(&:sum).max
end

def largest_contiguous_subsum(arr) #GOAL O(N)
    largest_subsum = arr.first
    current_subsum = arr.first

    (1...arr.length).each do |i|
        # debugger
        current_subsum = 0 if current_subsum < 0
        current_subsum += arr[i]
        largest_subsum = current_subsum if largest_subsum < current_subsum
    end

    largest_subsum

end

# list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8


# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])

def first_anagram?(str1, str2) #O(N!)
    substr = str1.split("").permutation.to_a.map{ |ele| ele.join("") }
    substr.include?(str2)
end

def second_anagram?(str1, str2) #O(N^2)
    copy_str = str2.split("")
    str1.each_char do |char|
        index = copy_str.find_index(char)
        return false if index.nil?
        copy_str.delete_at(index)
    end
    copy_str.empty?
end

def third_anagram?(str1, str2) #O(NlogN)
    alphabet = ("a".."z").to_a
    array1 = str1.split("").map{ |ele| alphabet.index(ele)}
    array2 = str2.split("").map{ |ele| alphabet.index(ele)}
    array1.merge_sort == array2.merge_sort
end

def fourth_anagram?(str1, str2) #O(N)
    count = Hash.new(0)
    str1.each_char {|char| count[char] += 1}
    str2.each_char {|char| count[char] -= 1}
    count.values.all?{|val| val == 0}
end

class Array
    def merge_sort(&prc)
    
    return [] if self.length == 0
    return self if self.length == 1

    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    mid = self.length / 2
    left = self[0...mid]
    right = self[mid..-1]

    left_arr = left.merge_sort(&prc)
    right_arr = right.merge_sort(&prc)

    Array.merge(left_arr, right_arr, &prc)
  end

  private
  def self.merge(left, right, &prc)
    result = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        result << left.shift
      when 0
        result << left.shift
      when 1 
        result << right.shift
      end
    end
    result + left + right
  end
end

# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true

def bad_two_sum?(arr, target)
    (0...arr.length-1).each do |i|
        (i+1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target
        end
    end
    false
end




def ok_two_sum?(arr, target) #O(NlogN)
    sorted = arr.merge_sort

    i = 0
    j = arr.length - 1

    while i != j
        case (sorted[i] + sorted[j]) <=> target
        when 0
            return true
        when 1
            j -= 1
        when -1
            i += 1
        end
    end

    false

end


def two_sum?(arr, target)
    count = Hash.new(0)
    arr.each_with_index do |ele , i|
        # debugger
        return true if count[target - ele] == 1
        count[ele] += 1
    end
    false
end

# arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false

def windowed_max_range(arr, window)
    sub_arr = []
    (0...arr.length - window + 1).each do |i|
        sub_arr << arr[i...i + window]
    end
    sub_arr.map { |arr| arr.max - arr.min }.max
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8 #2 - 4 3- 3
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8


[1, 0, 2, 5, 4, 8]