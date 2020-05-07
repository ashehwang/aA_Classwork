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

S = "aba", T = "aab"

@stackfor S []
@stackfor T []
each char = if push
# pop  @stackforS == @stackforT

Class Stack
    attr_reader :stack
    def initialize 
        @stack = []
    end

    def push(val)
        @stack << val
    end

    def pop
        @stack.pop
    end

    def empty?
        @stack.empty
    end
end ON

sstack = Stack.new
S.each char do |char|
if char =="#"
 sstack.pop unless sstack.empty?
 else sstack.push(char)
end

tstack = Stack.new
T.each char do |char|
if char =="#"
 tstack.pop unless tstack.empty?
 else tstack.push(char)
end

Ssstack.stack == Tsstack.stack