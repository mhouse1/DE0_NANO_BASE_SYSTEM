# DE0_NANO_BASE_SYSTEM
starting point for all future DE0-nano devboard based projects

Tested working with Quartus 18 running on windows 10

# Base system features:
* SDRAM with PLL setup
* SYSTEM ID
* JTAG debug and running working
* PIO
* Nios II/e processor
* onchip memory
* PIO for LEDs and switches


# adding to the base system
* in order to keep base system clean and small to download, do not commit generated files.
  * use git command "git add" to add specific files you want to commit, then, to ignore all other files except ".gitignore" you can run the command "git status -s | grep -e "^\?\?" | grep -v ".gitignore" | cut -c 4- >> .gitignore"
  
