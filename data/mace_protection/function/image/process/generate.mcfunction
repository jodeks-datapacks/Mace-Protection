#> mace_protection:image/process/generate
#
# This function generates the image data.

data modify storage mace_protection:image data.current.image_data set from storage mace_protection:image data.image_data
data modify storage mace_protection:image data.current.description set from storage mace_protection:image data.description
data modify storage mace_protection:image data.current.pixel_character set from storage mace_protection:image data.pixel_character.pixel

# Reset index score
scoreboard players set $index.image_data mace_protection.image 0
# Set width
execute store result score $width mace_protection.image run data get storage mace_protection:image data.width
# Set height
execute store result score $height mace_protection.image run data get storage mace_protection:image data.height
# Set length
scoreboard players operation $length mace_protection.image = $width mace_protection.image
scoreboard players operation $length mace_protection.image *= $height mace_protection.image
# Clear remaining entries in tellraw
data remove storage mace_protection:image data.tellraw

# Add spacing on top
function mace_protection:image/process/append/line_break
# Loop over image data
function mace_protection:image/process/loop_over_image_data
# Add spacing on bottom
function mace_protection:image/process/append/line_break