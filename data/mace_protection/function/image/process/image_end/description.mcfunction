# Append blank
function mace_protection:image/process/append/blank

data modify storage mace_protection:image data.tellraw append \
  from storage mace_protection:image data.current.description_text

# Append blank
function mace_protection:image/process/append/blank

# Append line_break
execute unless score $index.image_data mace_protection.image = $length mace_protection.image \
  run function mace_protection:image/process/append/line_break

# Remove first element from the description
data remove storage mace_protection:image data.current.description[0]
 