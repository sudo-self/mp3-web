#!/bin/bash

# Loop through all files in the current directory
for file in *; do
  # Check if the file is a valid audio/video file based on its extension
  case "$file" in
    *.mp4|*.webm|*.flac|*.m4a|*.aac|*.ogg)
      # Set output file name
      output="${file%.*}.mp3"

      # Convert audio/video file to mp3 with good quality
      ffmpeg -i "$file" -vn -ar 44100 -ac 2 -b:a 192k "$output"

      echo "Converted: $file to $output"
      ;;
  esac
done

