#!/bin/bash

#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Mahmoud Mohamed   #
#                                   #
#####################################

# Create a directory to store renamed images #
mkdir -p renamed_images

# Loop through each image file in the current directory #
for img_file in *.jpg *.jpeg *.png *.gif *.bmp *.svg; do
    # Check if there are any files with the current extension #
    if [ -e "$img_file" ]; then
        # Extract filename without extension #
        filename=$(basename -- "$img_file")
        filename_no_ext="${filename%.*}"

        # Rename image to imageName-square format #
        new_filename="${filename_no_ext}-square.${img_file##*.}"

        # Move renamed image to the new directory #
        cp "$img_file" "renamed_images/$new_filename"

        echo -e "Renamed $img_file to $new_filename"
    fi
done

echo -e "All images have been renamed and moved to \`renamed_images\` directory."
