Input: pattern = "abba", str = "dog cat cat dog"
Output: true
Example 2
Input: pattern = "abba", str = "dog cat cat fish"
Output: false
Example 3
Input: pattern = "aaaa", str = "dog cat cat dog"
Output: false

pattern = "abba", str = "ddccccdd" -> false

split the string into words O(n)
iterate through the list of words and the pattern simulatenously O(n)
    check if we have seen the letter in the pattern before O(1)
        if we haven't, we store the letter and the corresponding word into a hash O(1)
    else
        we check if the current word matches our stored word O(1)
            return false if it doesn't

we have found that all the words match, so return true O(1)
(pattern, str).each_with_index |pattern, string(words, i|

def pattern_solver(pattern, str)
    seen_before = {}
    str.split.each_with_index do |word, i|
        char = pattern[i]
        if seen_before[char]
            return false unless seen_before[char] == word
        else
            seen_before[char] = word
        end
    end
    true 
end