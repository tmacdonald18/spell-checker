--[[
Program: spell-checker.lua
Authors: Tyler MacDonald and Lucca Eloy
Date: 2/29/2017

Checks the spelling of a .txt file and returns a list of the misspelled words.
--]]

-- Download the dictionary into a table
io.input("C:\\Users\\Tyler\\Documents\\Lua\\Programs\\common-program\\dictionary.txt")
a = {}
for line in io.lines() do
  table.insert(a, line)
end
print(table.getn(a))
io.close()

-- Print instructions
print("Welcome to the spell-checker. Please input 1 to enter a text file to spell check, input 2 to enter a new word into the dictionary, or input 3 to exit the program: ")

-- Read input
::getChoice::
input = io.stdin:read("*n")

-- Process selection
if input == 1 then
  print("Please input the path name to a .txt file: ")
  input = io.read()
  spellCheck(input)
elseif input == 2 then
  print("Please input a word to add to the dictionary: ")
  input = io.read()
  addWord(input)
elseif input == 3 then
  goto exit
else
  print("Incorrect input. Please input 1 to enter a text file to spell check, input 2 to enter a new word into the dictionary, or input 3 to exit the program.")
  goto getChoice
end

-- End of program
::exit::


  