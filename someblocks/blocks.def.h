//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	
        {" ", "cat /sys/class/net/wlan0/operstate",                              30,          0},

        {" ", "getvolume",                                                        1,           0},
        
        {" ", "getbattery",                                                       30,          0},
        
        {" ", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",          30,		    0},

	    {" ", "date '+%B %d (%A) %R'",	                    			           60,		    0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
