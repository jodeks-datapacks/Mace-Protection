# Copy current pixel
data modify storage mace_protection:image data.current.pixel_color set \
  from storage mace_protection:image data.current.image_data[0]
data modify storage mace_protection:image data.current.description_text set \
  from storage mace_protection:image data.current.description[0]

scoreboard players add $index.image_data mace_protection.image 1

# Calculate column
scoreboard players operation $index.column mace_protection.image = $index.image_data mace_protection.image
scoreboard players operation $index.column mace_protection.image %= $width mace_protection.image

# Calculate row
scoreboard players operation $index.row mace_protection.image = $index.image_data mace_protection.image
scoreboard players operation $index.row mace_protection.image /= $width mace_protection.image

# Append start spacing
execute if score $index.column mace_protection.image matches 1 run \
  function mace_protection:image/process/append/blank

# Append colored pixel
execute unless data storage mace_protection:image data.current{pixel_color: ''} run \
  function mace_protection:image/process/append/pixel
# Append background pixel
execute if data storage mace_protection:image data.current{pixel_color: ''} run \
  function mace_protection:image/process/append/background

# Append description
execute if score $index.column mace_protection.image matches 0 run \
    function mace_protection:image/process/image_end/description

# Remove first element from the image_data array
data remove storage mace_protection:image data.current.image_data[0]
# Loop over rows
execute if score $index.row mace_protection.image < $height mace_protection.image run \
  function mace_protection:image/process/loop_over_image_data
 