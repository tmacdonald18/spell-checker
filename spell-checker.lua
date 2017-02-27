--[[
Program: spell-checker.lua
Authors: Tyler MacDonald and Lucca Eloy
Date: 2/29/2017

Checks the spelling of a .txt file and returns a list of the misspelled words.
--]]

local dictionaryFile = "C:\\Users\\Tyler\\Documents\\Lua\\Programs\\common-program\\dictionary.txt"

local function printInstructions()
  -- Prints the instructions
  print("Please input 1 to enter a text file to spell check, input 2 to enter a new word into the dictionary, or input 3 to exit the program: ")
end

-- Download the dictionary into a table
dic = io.open(dictionaryFile, "r")
io.input(dic)
a = {}
for line in io.lines() do
  table.insert(a, line)
end
print(table.getn(a))
dic:close()

-- Print instructions
print("Welcome to the spell-checker.")

-- Read input
::getChoice::
printInstructions()
input = io.stdin:read("*n")

-- Process selection
if input == 1 then
  print("Please input the path name to a .txt file: ")
  path = io.stdin:read("*all")
  spellCheck(path)
  goto getChoice
elseif input == 2 then
  print("Please input a word to add to the dictionary: ")
  word = io.stdin:read("*l")
  f = io.open(dictionaryFile, "a")
  io.output(f)
  io.write(word)
  io.close(f)
  print("Successfully added word to the dictionary!")
  goto getChoice  
elseif input == 3 then
  goto exit
else
  print("Incorrect input.")
  goto getChoice
end

-- End of program
::exit::


  