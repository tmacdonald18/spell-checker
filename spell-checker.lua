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
	if txt == nil then
		print("\nSpecified file not found.")
	else
		io.input(txt)

		local txtStr =  txt:read("*all")
		txt:close()

		string.lower(txtStr)

		local words = {}
		wrongWords = {}
   -- name = txtStr:gsub("%p", "")
   -- print(name)
 
		for word in txtStr:gmatch("([^".."%s+".."]+)") do table.insert(words, string.lower(word)) end
		words = cleanUp(words)

		print ("\nThere are " .. #words .. " words in the file.\n")

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
			print(i .. ": " .. wrongWords[i])
		end
		  
		print("\nThere are this many words spelled incorrectly: ",#wrongWords)
	end	
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
  c = string.sub(word, 1, 1)
  if tonumber(c) ~= nil then
	return
  else
	for i = 1, #dictWords[c] do
      if word == dictWords[c][i] then
		return
	  end
     end
   end
  
  wrongWords[#wrongWords+1] = word
end -- end check()

function cleanUp(words)
  -- Helper function
  for i = 1, #words do 
  words[i] = clean(words[i])
  end
  return words
end -- end cleanUp()

function clean(word)
  -- Trims the fat off recursively
  c = string.sub(word, -1, -1)
  if c:find('%p') ~= nil then
    word = string.sub(word, 1, -2)
    word = clean(word)
  end
  c = string.sub(word, 1, 1)
  if c:find('%p') ~= nil then
    word = string.sub(word, 2, -1)
    word = clean(word)
  end
  return word
end -- end clean()

function downloadDictionary()
  -- Download the dictionary into a table
  dic = io.open(dictionaryFile, "r")
  io.input(dic)
  dictWords = {}
  dictWords_meta = {}
  dictWords_meta.__index = function(t, key, value)
	rawset(t, key, {})
	setmetatable(t[key], dictWords_meta)
	return t[key]
  end
  setmetatable(dictWords, dictWords_meta)
  for line in io.lines() do
    dWord = string.lower(line)
    c = string.sub(dWord, 1, 1)
    table.insert(dictWords[c], dWord)
  end
  
  --print("\nThere are ",#dictWords," words in the dictionary.")
  dic:close()
end

-- Print Greeting
print("\nWelcome to Spell-Checker.")

downloadDictionary()

-- Read input
::getChoice::
printInstructions()
input = io.stdin:read("*l")

-- Process selection
if input == "1" then
  print("\nPlease input the path name to a .txt file, or input -1 to go back: ")
  repeat path = io.stdin:read() until path ~= "\n"
  
  if path ~= "-1" then
    spellCheck(path)
  end
  
  goto getChoice
  
elseif input == "2" then
	print("\nPlease input a word to add to the dictionary, or input -1 to go back: ")
	word = io.stdin:read("*l")
  
	if word == "-1" then
		goto getChoice
	end
  
    f = io.open(dictionaryFile, "a")
    io.output(f)
    io.write("\n")
    io.write(word)
    io.close(f)
    downloadDictionary()
    print("\nSuccessfully added word to the dictionary!")
	
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


  