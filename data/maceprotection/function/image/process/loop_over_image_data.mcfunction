# Copy current pixel
data modify storage maceprotection:image current.pixel_color set \
  from storage maceprotection:image current.image_data[0]
data modify storage maceprotection:image current.description_text set \
  from storage maceprotection:image current.description[0]

scoreboard players add $index.image_data maceprotection.image 1

# Calculate column
scoreboard players operation $index.column maceprotection.image = $index.image_data maceprotection.image
scoreboard players operation $index.column maceprotection.image %= $width maceprotection.image

# Calculate row
scoreboard players operation $index.row maceprotection.image = $index.image_data maceprotection.image
scoreboard players operation $index.row maceprotection.image /= $width maceprotection.image

# Append start spacing
execute if score $index.column maceprotection.image matches 1 run \
  function maceprotection:image/process/append/blank

# Append colored pixel
execute unless data storage maceprotection:image current{pixel_color: ''} run \
  function maceprotection:image/process/append/pixel
# Append background pixel
execute if data storage maceprotection:image current{pixel_color: ''} run \
  function maceprotection:image/process/append/background

# Append description
execute if score $index.column maceprotection.image matches 0 run \
    function maceprotection:image/process/image_end/description

# Remove first element from the image_data array
data remove storage maceprotection:image current.image_data[0]
# Loop over rows
execute if score $index.row maceprotection.image < $height maceprotection.image run \
  function maceprotection:image/process/loop_over_image_data
 