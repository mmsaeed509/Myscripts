#!/bin/bash

#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Mahmoud Mohamed   #
#                                   #
#####################################

# Define the destination directory #
destination="/home/o0xwolf/NewFolder"

# Initialize a counter #
counter=1

# Loop through each directory in the current directory #
for dir in */;
    
    do
        
        # Check if preview.png exists in the current directory #
        if [ -e "$dir/preview.png" ];
            
            then

                # Copy preview.png to the destination directory with a numbered name #
                cp "$dir/preview.png" "$destination/$counter.png"
                echo "Copied $dir/preview.png to $destination/$counter.png"
                ((counter++))

        else

            echo "No preview.png found in $dir"

        fi
        
done

