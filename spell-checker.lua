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
  print("\nPlease input 1 to enter a text file to spell check, input 2 to enter a new word into the dictionary, or input 3 to exit the program: ")
end

local function spellCheck(path)
  -- Runs through and spell checks .txt file
  
  local txt = io.open(path, "r")
  io.input(txt)

  local txtStr =  txt:read("*all")
  txt:close()

  string.lower(txtStr)

  local words = {}
  wrongWords = {}

  for word in txtStr:gmatch("%w+") do table.insert(words, string.lower(word)) end

  print (#words, "words in the file.")

  for i = 1, #words do
    check(words[i])
  end  
  
  -- puts all the wrong words into lowercase, probably a better way to do this
  for i = 1, #wrongWords do
    wrongWords[i] = string.lower(wrongWords[i])
  end
  
  -- quicksort wrong words
  quickSort(wrongWords)

  for i = 1, #wrongWords do
    print(wrongWords[i])
  end
  
  print("\nThere are this many words spelled incorrectly: ",#wrongWords)
    
end -- end spellCheck()

function quickSort(list)
  quickSortHelper(list, 1, #list - 1)
end -- end quickSort()

function quickSortHelper(list, first, last)
  if first < last then
    splitPoint = partition(list, first, last)
    quickSortHelper(list, first, splitPoint - 1)
    quickSortHelper(list, splitPoint + 1, last)
  end
end -- end quickSortHelper()

function partition(list, first, last)
  pivotValue = list[first]
  
  leftMark = first + 1
  rightMark = last
  
  done = false
  while not done do
    while leftMark <= rightMark and list[leftMark] <= pivotValue do
      leftMark = leftMark + 1
    end

    while list[rightMark] >= pivotValue and rightMark >= leftMark do
      rightMark = rightMark - 1
    end
    
    if rightMark < leftMark then
      done = true
    else
      temp = list[leftMark]
      list[leftMark] = list[rightMark]
      list[rightMark] = temp
    end
   end
   
   temp = list[first]
   list[first] = list[rightMark]
   list[rightMark] = temp
   
   return rightMark
end -- end partition()

function check(word)
  print(word)
  c = string.sub(word, 1, 1)
  if tonumber(c) == nil then
    for i = 1, #dictWords[c] do
      if word == dictWords[c][i] then
     -- or string.lower(word) == dictionaryWords[j] 
        print("Correctly spelled word!")
       return
      end
     end
   end
  
  print("Misspelled word!")
  wrongWords[#wrongWords+1] = word
  return
end -- end check()

function downloadDictionary()
  -- Download the dictionary into a table
  dic = io.open(dictionaryFile, "r")
  io.input(dic)
  dictWords = {}
  dictWords.a = {}
  dictWords.b = {} 
  dictWords.c = {}
  dictWords.d = {}
  dictWords.e = {}
  dictWords.f = {}
  dictWords.g = {}
  dictWords.h = {}
  dictWords.i = {}
  dictWords.j = {}
  dictWords.k = {}
  dictWords.l = {}
  dictWords.m = {}
  dictWords.n = {}
  dictWords.o = {}
  dictWords.p = {}
  dictWords.q = {}
  dictWords.r = {}
  dictWords.s = {}
  dictWords.t = {}
  dictWords.u = {}
  dictWords.v = {}
  dictWords.w = {}
  dictWords.x = {}
  dictWords.y = {}
  dictWords.z = {}
  for line in io.lines() do
    dWord = string.lower(line)
    c = string.sub(dWord, 1, 1)
    print(c)
    table.insert(dictWords[c], dWord)
  end
  
  --print("\nThere are ",#dictWords," words in the dictionary.")
  dic:close()
end

downloadDictionary()

-- Print Greeting
print("\nWelcome to Spell-Checker.")

-- Read input
::getChoice::
printInstructions()
input = io.stdin:read("*l")

-- Process selection
if input == "1" then
  -- Spell check
  ::spellCheck::
  
  print("\nPlease input the path name to a .txt file, or input -1 to go back: ")
  repeat path = io.stdin:read() until path ~= "\n"
  
  if path ~= "-1" then
    spellCheck(path)
  end
  
  goto getChoice
  
elseif input == "2" then
  print("\nPlease input a word to add to the dictionary, or input -1 to go back: ")
  word = io.stdin:read("*l")
  
  if word ~= "-1" then
    f = io.open(dictionaryFile, "a")
    io.output(f)
    io.write("\n")
    io.write(word)
    io.close(f)
    --TODO: Should probably redownload the dictionary at this point, or just add the new word to the end of the dictionary array as quick fix
    downloadDictionary()
    print("\nSuccessfully added word to the dictionary!")
  end
  
  goto getChoice  
  
elseif input == "3" then
  goto exit
  
else
  print("\nIncorrect input.")
  goto getChoice
end

-- End of program
::exit::
print("\nThank you for using Spell-Checker!")


  