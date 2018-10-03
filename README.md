# THIS IS DUTCH FREEWARE (FREE TO USE BUT LOCKED)
This is a warehouse management system in excel (DUTCH ONLY!)

If you want to use it feel free, macro's are hidden behind a lock. 
But if you want to translate, or have a good proposal to change code, feel free to contact.

![Screenshot of software](https://i.imgur.com/kO67IRf.png)

"Magazijn 2" supports Multiple Scanners, (V1 is outdated and unsupported)

[MB] = For Multiple Barcodes support (so can be skiped).

--------
# Install
> 1) [MB] Install LuaMacros (or unzip the LuaMacros.zip).

You should now be able to start with **"Startup"**.

--------
# Startup
> 1) [MB] Execute 'MultibleScannersHandler.lua' with the installed '//LuaMacros/LuaMacros.exe'.
> 2) [MB] Press the blue play button at the left-ish top on the screen.
> 3) [MB] **If** needed to manually set barcode scanners ID each time (Prompt; "Press a key to indentify device Scanner#"); **Then** do 4 + 5
> 4) [MB] [opt] Open notepad or something else to type in **so you wont type in this LUA script!!!**.
> 5) [MB] [opt] Scan something with the scanner (This will bound that scanner to the ID).
> 6) [MB] Check for errors (EXAMPLE: [LUA] ERROR: Device with name Scanner1 not found) see **"On error"**.
> 7) Open the Excel file "Magazijn 2.xlsm".
> 8) Enable the macro's, you should see a pop-up about who made this program if it worked.

You should now be able to start with **"Scanning"**.

--------	
# Scanning
[MB] The PC can't handle multiple inputs at the exact same time, Let a gap of at least **0.5 seconds between each input/scan**

[MB] Each scanner will remember it's own UserID, so both scanners ban be used separately (Each barcode has a prefix '0b' or '1b' done by 'MultibleScannersHandler.lua')

Borrow
> 1) Scan the UserID.
> 2) Scan all ItemID(s) that you want to lend to this person.

Hand-In
> 1) Scan the UserID.
> 2) The 'UserHas' will be filled with all stuff the user has, click on it to start handing the items in (Direct Hand-In is without prompt or such! so be careful). SideNote: Do not scan stuff while doing this, this also count as an input.

--------
# On error
### [Excel] macro error
Try a restart the file or do a Soft-Reboot:
> 1) End macro code warning
> 2) Select the first sheet 'Uitlenen en innemen'
> 3) Select left down (A24) and do a Soft-Reboot
> 4) Write down what happened and contact me with this info for it to be solved [github.com/jellewie](https://github.com/jellewie/Magazijn/issues) 

### [Excel] module 2 error
You are running 32bit, please upgrade to 64bit

### [LUA] ERROR: Device with name Scanner# not found
> 1A) Change the IdentifierScanner# to '0000AAA' to set manually on each boot

> 1B) Change the IdentifierScanner# to the ID of the scanner (found in the log in the lower half of the LUA screen when play is pressed)

Example of "0000AAA":

	\\?\HID#VID_111B&BBB_B11B&BB_11#1&0000AAA&1&1111#{111B11B1-11BB-11B1-BB1B-11B1B11111BB}
--------
# Translate and settings
### Add users
> 1A) Use the 'Instellingen' sheet to add a user

> 1B1) Unhide the 'DB' sheet
> 1B2) Add users directly below the last user, Do not move Users around! do not leave white spaces!
> 1B3) Hide the 'DB' sheet

### Change settings / Change language
> 1) In each sheet there is a hidden backup layout, change text here to let it be permanent (Pause Macro's if you can't select it)
> 2) In the sheet 'Instellingen' sheet click in the right bottom corner to show secret settings
> 3) Change the text of (most if not all) messages. (Yellow cells are editable (red isn't!))
> 4) In the sheet 'Instellingen' sheet click in the right bottom corner to hide secret settings
--------
# More features of excel
SmartInput ArrowLeft = select scanner 1 cell. ArrowRight = select scanner 2 cell
ItemID and UserID ArrowLeft and ArrowRight to switch from scanner 1 to scanner 2
Scanner1 ArrowLeft = SmartInput
Scanner2 ArrowRight = SmartInput

Click LastSuccesvolInput to set things ready for a undo.

Click LastClickUserID or ItemID for the ItemID and UserID

Click UserHas ItemID or ItemName to set things ready for handing in that item

Click the sheet 'Momenteel uitgeleend' to get a list of items that are currently borrowed. **Scanning only works while the cell SmartInput is selected, so selecting this sheet disables scanners! be aware**

Click in the sheet 'Momenteel uitgeleend' on items to set things ready to Hand In **(this will overwrite UserID of scanner 1! be aware)**

Click in the sheet 'Momenteel uitgeleend' on the UserID, UserName, ItemID or ItemName to sort **This will only sort the data that is currently on this list (so no data that isn't shown because of the cell limits)** (sorting also works in the 'DB') 

Click the sheet 'DB uitgeleend' is the DataBase with users and borrowed items, you can color stuff green, or remove stuff (dont leave gaps!)

Click in the sheet 'DB uitgeleend' on "B2" to reset this full database, this should not be done by normal users (has prompts)
