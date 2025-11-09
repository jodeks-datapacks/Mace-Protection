#> maceprotection:image/process/generate
#
# This function generates the image data.

data modify storage maceprotection:image current.image_data set from storage maceprotection:image image_data
data modify storage maceprotection:image current.description set from storage maceprotection:image description
data modify storage maceprotection:image current.pixel_character set from storage maceprotection:image pixel_character.pixel

# Reset index score
scoreboard players set $index.image_data maceprotection.image 0
# Set width
execute store result score $width maceprotection.image run data get storage maceprotection:image width
# Set height
execute store result score $height maceprotection.image run data get storage maceprotection:image height
# Set length
scoreboard players operation $length maceprotection.image = $width maceprotection.image
scoreboard players operation $length maceprotection.image *= $height maceprotection.image
# Clear remaining entries in tellraw
data remove storage maceprotection:image tellraw

# Add spacing on top
function maceprotection:image/process/append/line_break
# Loop over image data
function maceprotection:image/process/loop_over_image_data
# Add spacing on bottom
function maceprotection:image/process/append/line_break