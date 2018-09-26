--Make sure LuaMacros is installed
--Plug in scanners
--Press the play button
--if "ERROR: Device with name Scanner# not found" than change the below Identifier, Change to '0000AAA' to set manually on each boot

                                           --SystemId = \\?\HID#VID_046D&PID_C52B&MI_00#7&  0000AAA  &0&0000#{884B96C3-56EF-11D1-BC8C-00A0C91405DD}
local IdentifierScanner1 = '1676BF89'	   --Set this value to the ID of this device (can be found in SystemID as shown the line above)
local IdentifierScanner2 = '2759D1C6'      --3A13826B   2759D1C6







clear() --clear the console from last run
BarCodeScanner1 = ''									--Create a string to save the data in while we are collecting it
BarCodeScanner2 = ''									--^

TypingFree = true

if IdentifierScanner1 == '0000AAA' then					--if no Scanner1 ID is set up
	lmc_assign_keyboard('Scanner1');					--just do the input
else 
	lmc_device_set_name('Scanner1', IdentifierScanner1);--Set it's name
end
if IdentifierScanner2 == '0000AAA' then					--if no Scanner2 ID is set up
	lmc_assign_keyboard('Scanner2');					--just do the input
else 
	lmc_device_set_name('Scanner2', IdentifierScanner2);--Set it's name
end

dev = lmc_get_devices()
print("===== Connected devies: =====")
for key,value in pairs(dev) do
  print(key..':')
  for key2,value2 in pairs(value) do print('  '..key2..' = '..value2) end
end   

lmc.minimizeToTray = true								-- Hide window to tray to keep taskbar tidy  
--lmc_minimize()

local config = {
	[13]  = "Enter",	--Enter
	[32]  = " ",		--Space
        [17]  = "",		--Ignore
        [74]  = "",		--Ignore
        [16]  = "",		--Ignore (Barcode scanner specific, "rShift")

	[string.byte('Q')] = "q",
	[string.byte('W')] = "w",
	[string.byte('E')] = "e",
	[string.byte('R')] = "r",
	[string.byte('T')] = "t",
	[string.byte('Y')] = "y",
	[string.byte('U')] = "u",
	[string.byte('I')] = "i",
	[string.byte('O')] = "o",
	[string.byte('P')] = "p",
	[string.byte('A')] = "a",
	[string.byte('S')] = "s",
	[string.byte('D')] = "d",
	[string.byte('F')] = "f",
	[string.byte('G')] = "g",
	[string.byte('H')] = "h",
	--[string.byte('J')] = "j",
	[string.byte('K')] = "k",
	[string.byte('L')] = "l",
	[string.byte('Z')] = "z",
	[string.byte('X')] = "x",
	[string.byte('C')] = "c",
	[string.byte('V')] = "v",
	[string.byte('B')] = "b",
	[string.byte('N')] = "n",
	[string.byte('M')] = "m",

	[string.byte('0')] = "0",
	[string.byte('1')] = "1",
	[string.byte('2')] = "2",
	[string.byte('3')] = "3",
	[string.byte('4')] = "4",
	[string.byte('5')] = "5",
	[string.byte('6')] = "6",
	[string.byte('7')] = "7",
	[string.byte('8')] = "8",
	[string.byte('9')] = "9",
}

function wait(Seconds)
  local start = os.time()
  repeat until os.time() > start + Seconds
end

function sleep(n)
  if n > 0 then os.execute("ping -n " .. tonumber(n+1) .. " localhost > NUL") end
end

print("===== Sucesfully booted =====")
lmc_set_handler('Scanner1', function(button, direction)		--Define callback for this scanner
    if (direction == 0) then return end 						--Ignore key upstrokes. 
	if type(config[button]) == "string" then					--If the button is known
		if config[button] == "Enter" then						--If we are at the end an a Enter has been pressed
			BarCodeScanner1 = '0B' .. BarCodeScanner1 .. '~'	--Add the Prefix and the enter
			print('Scanned:    ' .. BarCodeScanner1)
                        repeat until TypingFree
                        TypingFree = false
                        sleep(0.1)
                        lmc_send_keys(BarCodeScanner1)						--Send the keys though to the PC (and thus imput them in excel)
			BarCodeScanner1 = ''								--Reset the string, we have now done these inputs
                        TypingFree = true
        	else
			BarCodeScanner1 = BarCodeScanner1 .. config[button]	--Add this key to the string
		end 
	else
		print('Not assigned key pressed: ' .. button)
	end
end)
lmc_set_handler('Scanner2', function(button, direction)		--Define callback for this scanner
    if (direction == 0) then return end 						--Ignore key upstrokes. 
	if type(config[button]) == "string" then					--If the button is known
		if config[button] == "Enter" then						--If we are at the end an a Enter has been pressed
			BarCodeScanner2 = '1B' .. BarCodeScanner2 .. '~'	--Add the Prefix and the enter
			print('Scanned:    ' .. BarCodeScanner2)
                        repeat until TypingFree
                        TypingFree = false
                        sleep(0.1)
			lmc_send_keys(BarCodeScanner2)						--Send the keys though to the PC (and thus imput them in excel)
			BarCodeScanner2 = ''								--Reset the string, we have now done these inputs
                        TypingFree = true
                else
			BarCodeScanner2 = BarCodeScanner2 .. config[button]
		end 
	else
		print('Not assigned key pressed: ' .. button)
	end
end)
