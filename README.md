# terminal-utilities
A few assorted utilities to be used on a command line.

## tube-play

`tube-play` needs a few packets to be installed.

· ffmpeg

· yt-dlp

· mpv

`tube-play` plays the audio track from a youtube link provided as the first argument.


## clitube

`clitube` needs the following packets to be installed.

· whiptail

· yt-dlp

· vlc ( which provides nvlc )

· jq ( allows to extract the json data from radio browser )  

`clitube` allows to search youtube for videos and permits to play them, all from the command line

Installing all neccessary dependencies under Debian is accomplished by
`sudo apt install jq yt-dlp vlc`
Note that the non-free repo has to be activated.

## font_installer.sh

This script installs all neccessary system fonts for the terminal.

## embed_icon

Is a script to embed svg image data into markdown documents. I use it in Joplin to embed SVG images directly.
