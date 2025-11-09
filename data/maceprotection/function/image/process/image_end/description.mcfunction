# Append blank
function maceprotection:image/process/append/blank

data modify storage maceprotection:image tellraw append \
  from storage maceprotection:image current.description_text

# Append blank
function maceprotection:image/process/append/blank

# Append line_break
execute unless score $index.image_data maceprotection.image = $length maceprotection.image \
  run function maceprotection:image/process/append/line_break

# Remove first element from the description
data remove storage maceprotection:image current.description[0]
 