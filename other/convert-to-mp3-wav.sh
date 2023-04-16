#!/bin/bash

#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Mahmoud Mohamed   #
#                                   #
#####################################

# load colors #
. COLORS.sh

# convert any videos to .mp3 file #
function video_to_mp3() {

    # Change directory to the specified path, or use the current directory if none is given #
    cd "$path"

    # notify the user #
    echo -e "${BGreen}\n[*] converting all ${BYellow}videos ${BGreen}to ${BYellow}.mp3\n${BCyan}"

    # Loop through all files in the directory with the specified video format extension #
    for file in *."$2"; do

      # Use ffmpeg to convert the video to an mp3 file with the same name, and pipe the output to pv to show a progress bar #
      ffmpeg -hide_banner -loglevel panic -i "$file" -vn -acodec libmp3lame -qscale:a 2 "${file%.*}.mp3" | pv -lep -s "$(du -b "$file" | awk '{print $1}')" -N 'Encoding' > /dev/null

    done

    # notify the user #
    echo -e "${BGreen}\n[✔] D O N E!" ${RESET_COLOR}

}

# convert any .mp3 file to .wav file #
function mp3_to_wav() {
  
    # Change directory to the specified path, or use the current directory if none is given #
    cd "$path"

    # notify the user #
    echo -e "${BGreen}\n[*] converting all ${BYellow}.mp3 ${BGreen}to ${BYellow}.wav\n${BCyan}"

    # Loop through all files in the directory with a .mp3 extension #
    for file in *.mp3; do

      # Use ffmpeg to convert the mp3 file to a wav file with the same name, and pipe the output to pv to show a progress bar #
      ffmpeg -hide_banner -loglevel panic -i "$file" "${file%.*}.wav" | pv -lep -s "$(du -b "$file" | awk '{print $1}')" -N 'Encoding' > /dev/null

    done

    # notify the user #
    echo -e "${BGreen}\n[✔] D O N E!" ${RESET_COLOR}

}

# Parsing command-line args #

path=$(pwd) # set default path to current working directory #

while getopts "f:c:p:" opt; do
  case $opt in
    c)
      if [ "$OPTARG" == "video" ]; then
        video_to_mp3 "${@: $OPTIND}" # Pass remaining arguments to function #
      elif [ "$OPTARG" == "wav" ]; then
        mp3_to_wav "${@: $OPTIND}" # Pass remaining arguments to function #
      else
        echo -e "${BRed}\n[✘] Invalid argument: $OPTARG" ${RESET_COLOR}
        exit 1
      fi
      ;;
    f)
      format="$OPTARG"
      ;;
    p)
      path="$OPTARG"
      ;;
    \?)
      echo -e "${BRed}\n[✘] Invalid option: -$OPTARG" ${RESET_COLOR}
      exit 1
      ;;
  esac
done

# If no arguments were given, print usage information #
if [ $OPTIND -eq 1 ]
then
    echo -e "${BBlue}\nUsage: ${BCyan}$0 -c [video|wav] -f [format] -p [path]" ${RESET_COLOR}
    echo -e "${BBlue}Options:" ${RESET_COLOR}
    echo -e "       ${BPurple}-c${RESET_COLOR}     Convert either video or mp3 to wav format. Required argument: ${BYellow}[video|wav]${RESET_COLOR}"
    echo -e "       ${BPurple}-f${RESET_COLOR}     Specify the format of the input video or mp3 files. Required argument: ${BYellow}[format]${RESET_COLOR}"
    echo -e "       ${BPurple}-p${RESET_COLOR}     Specify the path to the directory containing the files to convert. Optional argument. Default: current directory"
    echo -e "${BBlue}Examples:" ${RESET_COLOR}
    echo -e "       ${BPurple}$0 -c video -f mkv -p ~/Videos${RESET_COLOR}"
    echo -e "       ${BPurple}$0 -c wav${RESET_COLOR}" 
    exit 1
fi
