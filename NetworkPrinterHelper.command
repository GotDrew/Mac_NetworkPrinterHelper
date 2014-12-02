#!/bin/bash
#########################################################
#########################################################
#   Installing networked printers from command line.    #
#   Server is assumed at lpd://10.1.0.7                 #
#   Drivers for the Mac can be found here:              #
#   /Library/Printers/PPDs/Contents/Resources/          #
#   I'm using Fuji Xerox printers.                      #
#                                                       #
#   This looks to see if the drivers are already        #
#   installed (if not it installs it) and then asks     #
#   what printer you want to install from a list.       #
#                                                       #
#   I've cut it down from 60 to 3 printers in each      #
#   of the 3 offices in a made up place.                #
#   The lists are the different Offices, the different  #
#   Types of printers and a list All.                   #
#                                                       #
#   Hopefully no bugs after I cut everything out.       #
#########################################################
#########################################################

#   Check that the drivers are installed
StartFunk ()
{
	clear
	echo _________________________________________________
	echo --Printer Installer--
	echo --Welcome--
	echo 
	echo "Checking if the driver is installed..."
        #   I'm only looking for the one driver because the driver that I install adds all needed drivers. 
	if [ -a /Library/Printers/PPDs/Contents/Resources/FX\ ApeosPort-V\ C4475\ PS.gz ]
		then
			echo "Driver is installed, Moving on."
			sleep 2
			StartSelections
		else
			echo "Driver is not installed, Installing."
			sleep 2
			InstallDriver
	fi
}

#   Install the driver and tell user why your grabbing a password
InstallDriver ()
{
	clear
	echo _________________________________________________
	echo --Printer Installer--
	echo --Installing Drivers--
	echo 
	echo
        #   You could add more drivers if you need to and install them one after another.
        #   Or move this to before adding the printer add the driver as needed.
	sudo installer -pkg /Volumes/InstallPrinter/driver.pkg -target /
	echo 
	echo Installed driver.
	sleep 1
	StartSelections
}

#   First menu giving lists
StartSelections ()
{
	clear
	echo _________________________________________________
	echo --Printer Installer--
	echo --Select Location--
	echo 
	PS3='Please select location: '
	options=("Main" "Office 1" "Office 2" "Store room" "Type" "All" "Quit")
	select opt in "${options[@]}"
	do
		case $opt in
			"Main")
				ListofMain
				break
				;;
			"Office 1")
				ListofOff1
				break
				;;
			"Office 2")
				ListofOff2
				break
				;;
			"Type")
				TypeSelections
				break
				;;
			"All")
				ListofAll
				break
				;;
			"Quit")
				break
				;;
			*) 
				echo invalid option;;
		esac
	done
} 

#   Menu for Printer type
TypeSelections ()
{
	clear
	echo _________________________________________________
	echo --Printer Installer--
	echo --Select Printer Type--
	echo 
	PS3='Please select printer type: '
	options=("Printer Scanner" "Colour Printer" "Black & White" "Back")
	select opt in "${options[@]}"
	do
		case $opt in
			"Printer Scanner")
				ListScanner
				break
				;;
			"Colour Printer")
				ListColour
				break
				;;
			"Printer")
				ListPrinter
				break
				;;
			"Back")
				StartSelections
				break
				;;
			*) 
				echo invalid option;;
		esac
	done
	#echo _________________________________________________
} 

#   Office lists
ListofMain ()
{
	clear
	echo _________________________________________________
	echo --Printer Installer--
	echo --Select Printer--
	echo 
  
	PS3='Please select printer name: '
	options=( "Printer Scanner" "Colour Printer" "Printer" "Back")
	select opt in "${options[@]}"
	do
		case $opt in
			"Printer Scanner")
				PRINTER=MainScanner
				InstallScanner
				break
				;;
				
			"Colour Printer")
				PRINTER=MainColour
				InstallColour
				break
				;;
				
			"Printer ")
				PRINTER=MainPrinter
				InstallPrinter
				break
				;;
			"Back")
				StartSelections
				break
				;;
			*) 
				echo invalid option;;
		esac
	done
}

ListofOff1 ()
{
	clear
	echo _________________________________________________
	echo --Printer Installer--
	echo --Select Printer--
	echo 
  
	PS3='Please select printer name: '
	options=( "Printer Scanner" "Colour Printer" "Printer" "Back")
	select opt in "${options[@]}"
	do
		case $opt in
			"Printer Scanner")
				PRINTER=Office1Scanner
				InstallScanner
				break
				;;
				
			"Colour Printer")
				PRINTER=Office1Colour
				InstallColour
				break
				;;
				
			"Printer ")
				PRINTER=Office1Printer
				InstallPrinter
				break
				;;
			"Back")
				StartSelections
				break
				;;
			*) 
				echo invalid option;;
		esac
	done
}

ListofOff2 ()
{
	clear
	echo _________________________________________________
	echo --Printer Installer--
	echo --Select Printer--
	echo 
  
	PS3='Please select printer name: '
	options=( "Printer Scanner" "Colour Printer" "Printer" "Back")
	select opt in "${options[@]}"
	do
		case $opt in
			"Printer Scanner")
				PRINTER=Office2Scanner
				InstallScanner
				break
				;;
				
			"Colour Printer")
				PRINTER=Office2Colour
				InstallColour
				break
				;;
				
			"Printer ")
				PRINTER=Office2Printer
				InstallPrinter
				break
				;;
			"Back")
				StartSelections
				break
				;;
			*) 
				echo invalid option;;
		esac
	done
}

#   Type lists
ListScanner ()
{
	clear
	echo _________________________________________________
	echo --Printer Installer--
	echo --Select Printer--
	echo 
  
	PS3='Please select printer name: '
	options=("Main Scanner" "Office1 Scanner" "Office2 Scanner" "Back")
	select opt in "${options[@]}"
	do
		case $opt in
			"Main Scanner")
				PRINTER=MainScanner
				InstallScanner
				break
				;;
				
			"Office1 Scanner")
				PRINTER=Office1Scanner
				InstallScanner
				break
				;;
				
			"Office2 Scanner")
				PRINTER=Office2Scanner
				InstallScanner
				break
				;;
				
			"Back")
				StartSelections
				break
				;;
			*) 
				echo invalid option;;
		esac
	done
}

ListColour ()
{
	clear
	echo _________________________________________________
	echo --Printer Installer--
	echo --Select Printer--
	echo 
  
	PS3='Please select printer name: '
	options=("Main Colour" "Office1 Colour" "Office2 Colour" "Back")
	select opt in "${options[@]}"
	do
		case $opt in
			"Main Colour")
				PRINTER=MainColour
				InstallColour
				break
				;;
				
			"Office1 Colour")
				PRINTER=Office1Colour
				InstallColour
				break
				;;
				
			"Office2 Colour")
				PRINTER=Office2Colour
				InstallColour
				break
				;;
				
			"Back")
				StartSelections
				break
				;;
			*) 
				echo invalid option;;
		esac
	done
}

ListPrinter ()
{
	clear
	echo _________________________________________________
	echo --Printer Installer--
	echo --Select Printer--
	echo 
  
	PS3='Please select printer name: '
	options=("Main Printer" "Office1 Printer" "Office2 Printer" "Back")
	select opt in "${options[@]}"
	do
		case $opt in
			"Main Printer")
				PRINTER=MainPrinter
				InstallPrinter
				break
				;;
				
			"Office1 Printer")
				PRINTER=Office1Printer
				InstallPrinter
				break
				;;
				
			"Office2 Printer")
				PRINTER=Office2Printer
				InstallPrinter
				break
				;;
				
			"Back")
				StartSelections
				break
				;;
			*) 
				echo invalid option;;
		esac
	done
}

#   List of all printers
ListofAll ()
{
	clear
	echo _________________________________________________
	echo --Printer Installer--
	echo --Select Printer--
	echo 
  
	PS3='Please select printer name: '
	options=("Back")
	select opt in "${options[@]}"
	do
		case $opt in
                        # Just add all printers here.
				
			"Back")
				StartSelections
				break
				;;
			*) 
				echo invalid option;;
		esac
	done
}

#   Installign the printers.
#   Change these lines to the correct drivers for your printers.
InstallScanner ()
{
	clear
	echo _________________________________________________
	echo --Printer Installer--
	echo --Installing $PRINTER--
	echo 
	echo "Installing printer... Please wait..."
	lpadmin -E -p $PRINTER -v lpd://10.1.0.7 -P /Library/Printers/PPDs/Contents/Resources/FX\ ApeosPort-V\ C4475\ PS.gz -D "$PRINTER"
	Finished
}

InstallColour ()
{
	clear
	echo _________________________________________________
	echo --Printer Installer--
	echo --Installing $PRINTER--
	echo 
	echo "Installing printer... Please wait..."
	lpadmin -E -p $PRINTER -v lpd://10.1.0.7 -P /Library/Printers/PPDs/Contents/Resources/FX\ DocuPrint\ CP405\ PS.gz -D "$PRINTER"
	Finished
}

InstallPrinter ()
{
	clear
	echo _________________________________________________
	echo --Printer Installer--
	echo --Installing $PRINTER--
	echo 
	echo "Installing printer... Please wait..."
	lpadmin -E -p $PRINTER -v lpd://10.1.0.7 -P /Library/Printers/PPDs/Contents/Resources/FX\ DocuPrint\ P455\ PS.gz -D "$PRINTER"
	Finished
}

#   Lastly, tell the users its installed and give them the option to quit or install another one.
Finished ()
{
	clear
	echo _________________________________________________
	echo --Printer Installer--
	echo --Finished--
	echo
        echo Finished installing $PRINTER
        echo "If there are any problems contact the IT department."
        echo 
	PS3='Please select an option: '
	options=("Install another printer" "Quit")
	select opt in "${options[@]}"
	do
		case $opt in
			"Install another printer")
				echo "you chose choice 1"
				StartSelections
				break
				;;
			"Quit")
				break
				;;
			*) 
				echo invalid option;;
		esac
	done
}
#   This calls the first function.
StartFunk
