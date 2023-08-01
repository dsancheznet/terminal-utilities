#!/bin/sh

# Shutdown_til_recording script written by D.Sánchez 2023
# This script has to be run as root!!!

# Set variables
DVR_DIRECTORY='/nonexistent/.hts/tvheadend/dvr/log'
START_GAP=300
ACTUAL_TIME=`date +%s`
START_TIME=0
STOP_TIME=0

# Define some functions

USER_IS_ROOT ()
{
    [ "$(id -u)" -eq 0 ]
}

# Begin
# Check if the script is being run by root ( or sudo )
if USER_IS_ROOT; then

    # Read the recordings from DVR database
    # Iterate over all past and future recordings
    for SCHED in `ls $DVR_DIRECTORY/*`; do
        # Extract Start time
        TMP_START_TIME=`cat $SCHED | grep '"start"' | head -n 1 | grep -o "[0-9]*"`
        # Extract Stop time
        TMP_STOP_TIME=`cat $SCHED | grep '"stop"' | head -n 1 | grep -o "[0-9]*"`
        # Does the schedule finish before now?
        if [ $((TMP_STOP_TIME)) -le $((ACTUAL_TIME)) ]; then
		# YES
		# This block is empty, but I'm reluctant to reverse the logic, for syntactical reasons.
		:
        else
		# NO
		# Is the start time in the past and is the stop time in the future ( checked in previous if )?
		if [ $((TMP_START_TIME)) -le $((ACTUAL_TIME)) ]; then
		    # YES - This means we are recording right now
		    logger "Mediaserver Control: The server currently is recording. Skipping shutdown!"
		    exit 1
		else
		    # NO - This means that the start time is in the future and the stop time as well
		    # Is the current timer nearer to present time than the saved timer or is the saved timer equal to 0?
		    if [ $((TMP_START_TIME)) -lt $((START_TIME)) -o $((START_TIME)) -eq 0 ]; then
			# YES
			# Save both values for later
			START_TIME=$TMP_START_TIME
			STOP_TIME=$TMP_STOP_TIME
			logger "Mediaserver Control: Found a timer! ( Start time: `date -d @$TMP_START_TIME` / Stop  time: `date -d @$TMP_STOP_TIME` )"
		    fi
		fi
	fi
    done

    # Analyze the values
    # Has any timer been found?
    if [ $((START_TIME)) -ne 0 ]; then
        # YES
        # Set the RTC alarm to zero first
        echo 0 > /sys/class/rtc/rtc0/wakealarm
        # Calculate when to start the server applying the time gap
        RTC_START=$((START_TIME-START_GAP))
        # Write the resulting value to the RTC
        echo $RTC_START > /sys/class/rtc/rtc0/wakealarm
        logger "Mediaserver Control: Writing RTC. Server will start at `date -d @$RTC_START`"
    fi

    # We are done with the timers, now let's check if somebody is connected to any service

    # SSH
    # Capture how many users are connected to the system
    TMP_SESSIONS=`who | wc -l`
    # Are more than 0 users connected to the system?
    if [ $((TMP_SESSIONS)) -gt 0 ]; then
        # YES
	logger "Found an active session. Aborting shutdown!"
        # Stop the script with exit code 2
        exit 2
    fi

    # Jellyfin / TVHeadend

    # If we've gotten here, then let's shutdown
    logger "Shutting down system."
    /usr/sbin/poweroff

else
    logger "Mediaserver Control: This script needs to be run as root. Please re-run it with administration privileges."
    exit 0
fi


# TODO:
# Implement a power button catch to execute this script: https://superuser.com/questions/1523918/run-script-when-power-button-pressed
