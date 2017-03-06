--[[
Program:  testing.lua

Testing for:
Alphabetizing with QuickSort
]]--

local strings = {"Hell", "Never", "Super", "Very", "Greatful"}

for i=1,#strings do 
    word = strings[i]
    local size = string.len(word)
    print("Length of word is: ",size)
    for j=1,size do
        print(string.sub(word, j, j))
    end
end