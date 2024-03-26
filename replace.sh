#!/bin/bash

# Specify the directory containing the files
directory="./public/plants"

# Change directory to the specified directory
cd "$directory"

# Loop through each file in the directory
for file in *.JPG; do
    # Extract the filename and extension
    filename="${file%.*}"
    extension="${file##*.}"

    # Construct the new filename with the updated extension
    new_filename="$filename.jpg"

    # Rename the file
    mv "$file" "$new_filename"
done
