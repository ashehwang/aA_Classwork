Problem 1:
Given a pattern and a string str, determine if str follows the same pattern.
Example 1
Input: pattern = "abba", str = "dog cat cat dog"
Output: true
Example 2
Input: pattern = "abba", str = "dog cat cat fish"
Output: false
Example 3
Input: pattern = "aaaa", str = "dog cat cat dog"
Output: false
Example 4
Input: pattern = "abba", str = "dog dog dog dog"
Output: false
You may assume pattern contains only lowercase letters, and str contains lowercase letters that may be separated by a single space. Can you solve it in O(N) time and O(1) space?

Problem 2:
Given two strings S and T, return if they are equal when both are typed into empty text editors. In this case, # indicates a backspace character.
Example 1
Input: S = "ab#c", T = "ad#c"
Output: true
Explanation: Both S and T become "ac".
Example 2
Input: S = "ab##", T = "c#d#"
Output: true
Explanation: Both S and T become "".
Example 3
Input: S = "a##c", T = "#a#c"
Output: true
Explanation: Both S and T become "c".
Example 4
Input: S = "a#c", T = "b"
Output: false
Explanation: S becomes "c" while T becomes "b".
Note:
1. 1 <= S.length <= 200
2. 1 <= T.length <= 200
3. S and T only contain lowercase letters and '#' characters.
Can you solve it in O(N) time and O(1) space