#!/bin/bash

mkdir -p audios
mkdir -p videos
mkdir -p documents
mkdir -p images
mkdir -p others

fileTypeDeclared=0
audio=0
video=0
docs=0
image=0
other=0

noDays=0

while getopts "havdiot:" opt; do
  case $opt in
    a)
      audio=1
      fileTypeDeclared=1
      ;;
    v)
      video=1
      fileTypeDeclared=1
      ;;
    i)
      image=1
      fileTypeDeclared=1
      ;;
    d)
      docs=1
      fileTypeDeclared=1
      ;;
    o)
      other=1
      fileTypeDeclared=1
      ;;
    t)
      # ADD INTEGER VALIDATION
      noDays=${OPTARG}
      ;;
    h)
      echo "Usage: cleanup [-a] [-v] [-d] [-i] [-o] [-t DAYS]"
      echo ""
      echo "File filters, if none of the filters are provided cleanup cleans all files in to their respective folders."
      echo -e "\t-a, Cleanup all audio files"
      echo -e "\t-v, Cleanup all video files"
      echo -e "\t-d, Cleanup all document files"
      echo -e "\t-i, Cleanup all image files"
      echo -e "\t-o, Cleanup all other files"
      echo ""
      echo "Timing filter, if filter is not provided cleans up all requested file types."
      echo -e "\t-t=DAYS, Number of days since the last time the file was accessed"
      exit 1
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

timeAccessed=""

if [ $noDays -gt 0 ]
then
    timeAccessed="-atime +${noDays}"
fi

if [ $fileTypeDeclared -eq 0 ]
then
  # Find and move all Audio files to corresponding ./audios folder
  find . -maxdepth 1 ${timeAccessed} -type f -iname "*.mp3" -o -iname "*.ogg" -o -iname "*.m4a" -o -iname "*.wav" -o -iname "*.wma" -o -iname "*.wpl" -o -iname "*.mid" -o -iname "*.midi" -o -iname "*.aif" -o -iname "*.flac" | xargs -I '{}' mv '{}' ./audios/

  # Find and move all Image files to corresponding ./images folder
  find . -maxdepth 1 ${timeAccessed} -type f -iname "*.bmp" -o -iname "*.gif" -o -iname "*.ico" -o -iname "*.jpeg" -o -iname "*.jpg" -o -iname "*.png" -o -iname "*.psd" -o -iname "*.svg" -o -iname "*.tiff" -o -iname "*.tif" -o -iname "*.ps" | xargs -I '{}' mv '{}' ./images/

  # Find and move all Documents to corresponding ./documents folder
  find . -maxdepth 1 ${timeAccessed} -type f -iname "*.doc" -o -iname "*.docx" -o -iname "*.odt" -o -iname "*.pdf" -o -iname "*.rtf" -o -iname "*.tex" -o -iname "*.txt" -o -iname "*.wks" -o -iname "*.wps" -o -iname "*.wpd" -o -iname "*.key" -o -iname "*.odp" -o -iname "*.pbs" -o -iname "*.ppt" -o -iname "*.pptx" -o -iname "*.ods" -o -iname "*.xlr" -o -iname "*.xls" -o -iname "*.xlsx" | xargs -I '{}' mv '{}' ./documents/

  # Find and move all Videos to corresponding ./videos folder
  find . -maxdepth 1 ${timeAccesssed} -type f -iname "*.3g2" -o -iname "*.3gp" -o -iname "*.avi" -o -iname "*.flv" -o -iname "*.h264" -o -iname "*.m4v" -o -iname "*.mkv" -o -iname "*.mov" -o -iname "*.mp4" -o -iname "*.mpg" -o -iname "*.mpeg" -o -iname "*.rm" -o -iname "*.swf" -o -iname "*.vob" -o -iname "*.wmv" | xargs -I '{}' mv '{}' ./videos/

  # Find and move all other remaining files to corresponding ./others folder
  find . -maxdepth 1 ${timeAccessed} -type f ! -iname "cleanup.sh" | xargs -I '{}' mv '{}' ./others/

else
  
  if [ $audio -eq 1 ]
    then
    # Find and move all Audio files to corresponding ./audios folder
    find . -maxdepth 1 ${timeAccessed} -type f -iname "*.mp3" -o -iname "*.ogg" -o -iname "*.m4a" -o -iname "*.wav" -o -iname "*.wma" -o -iname "*.wpl" -o -iname "*.mid" -o -iname "*.midi" -o -iname "*.aif" -o -iname "*.flac" | xargs -I '{}' mv '{}' ./audios/
  fi

  if [ $image -eq 1 ]
    then
    # Find and move all Image files to corresponding ./images folder
    find . -maxdepth 1 ${timeAccessed} -type f -iname "*.bmp" -o -iname "*.gif" -o -iname "*.ico" -o -iname "*.jpeg" -o -iname "*.jpg" -o -iname "*.png" -o -iname "*.psd" -o -iname "*.svg" -o -iname "*.tiff" -o -iname "*.tif" -o -iname "*.ps" | xargs -I '{}' mv '{}' ./images/
  fi

  if [ $docs -eq 1 ]
    then
    # Find and move all Documents to corresponding ./documents folder
    find . -maxdepth 1 ${timeAccessed} -type f -iname "*.doc" -o -iname "*.docx" -o -iname "*.odt" -o -iname "*.pdf" -o -iname "*.rtf" -o -iname "*.tex" -o -iname "*.txt" -o -iname "*.wks" -o -iname "*.wps" -o -iname "*.wpd" -o -iname "*.key" -o -iname "*.odp" -o -iname "*.pbs" -o -iname "*.ppt" -o -iname "*.pptx" -o -iname "*.ods" -o -iname "*.xlr" -o -iname "*.xls" -o -iname "*.xlsx" | xargs -I '{}' mv '{}' ./documents/
  fi

  if [ $video -eq 1 ]
    then
    # Find and move all Videos to corresponding ./videos folder
    find . -maxdepth 1 ${timeAccesssed} -type f -iname "*.3g2" -o -iname "*.3gp" -o -iname "*.avi" -o -iname "*.flv" -o -iname "*.h264" -o -iname "*.m4v" -o -iname "*.mkv" -o -iname "*.mov" -o -iname "*.mp4" -o -iname "*.mpg" -o -iname "*.mpeg" -o -iname "*.rm" -o -iname "*.swf" -o -iname "*.vob" -o -iname "*.wmv" | xargs -I '{}' mv '{}' ./videos/
  fi

  if [ $other -eq 1 ]
    then
    # Find and move all other remaining files to corresponding ./others folder
    find . -maxdepth 1 ${timeAccessed} -type f ! -iname "cleanup.sh" | xargs -I '{}' mv '{}' ./others/
  fi
fi
