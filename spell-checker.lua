--[[
Program: spell-checker.lua
Authors: Tyler MacDonald and Lucca Eloy
Date: 2/29/2017

Checks the spelling of a .txt file and returns a list of the misspelled words.
--]]

--local dictionaryFile = "C:\\Users\\Tyler\\Documents\\Lua\\Programs\\common-program\\dictionary.txt"
local dictionaryFile = "dictionary.txt"


local function printInstructions()
  -- Prints the instructions
  print("Please input 1 to enter a text file to spell check, input 2 to enter a new word into the dictionary, or input 3 to exit the program: ")
end

local function spellCheck(path)
  -- Runs through and spell checks .txt file
  local txt = io.open(path, "r")
  io.input(txt)
  local txtStr =  txt:read("*all")
  txt:close()
  local words = {}
  wrongWords = {}
  for word in txtStr:gmatch("%w+") do table.insert(words, word) end
  print (#words)
  print(words[2])
  k = 1
  for i = 1, #words do
    check(words[i])
  end  
  for i = 1, #wrongWords do
    print(wrongWords[i])
    end
  end 
  
  
function check(word)
  for j = 1, #a do
    if word == a[j] then
   -- or string.lower(word) == a[j] 
      print("Correctly spelled word!")
      return
      end
  end
  print("Misspelled word!")
  wrongWords[#wrongWords+1] = word
  return
  end

-- Download the dictionary into a table
dic = io.open(dictionaryFile, "r")
io.input(dic)
a = {}
for line in io.lines() do
  table.insert(a, line)
end
print(#a)
dic:close()

-- Print instructions
print("Welcome to the spell-checker.")

-- Read input
::getChoice::
printInstructions()
input = io.stdin:read("*l")

-- Process selection
if input == "1" then
  print("Please input the path name to a .txt file: ")
  repeat path = io.stdin:read() until path ~= "\n"
  print(path)
  spellCheck(path)
  goto getChoice
elseif input == "2" then
  print("Please input a word to add to the dictionary: ")
  word = io.stdin:read("*l")
  f = io.open(dictionaryFile, "a")
  io.output(f)
  io.write("\n")
  io.write(word)
  io.close(f)
  print("Successfully added word to the dictionary!")
  goto getChoice  
elseif input == "3" then
  goto exit
else
  print("Incorrect input.")
  goto getChoice
end

-- End of program
::exit::


  