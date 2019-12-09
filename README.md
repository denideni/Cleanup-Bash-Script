# Cleanup-Bash-Script
a bash script to cleanup your current directory


Usage: cleanup [-a] [-v] [-d] [-i] [-o] [-t DAYS]  
      Explanation of available flags below:  
      -a Cleanup all audio files  
      -v Cleanup all video files  
      -d Cleanup all document files  
      -i Cleanup all image files  
      -o Cleanup all other files  
      If none of the filters above are provided then it cleans all in the current directory.  

      Timing filter, if filter is not provided cleans up all requested files in the current directory.  
      -t=DAYS Number of days since the last time the file was accessed.
