#> maceprotection:image/set_image_data
#
# This function sets the image data.
#
# @input $(image_data) {string[][]} The data to set  
# @input $(width) {number} The width of the image  
# @input $(height) {number} The height of the image  
# @input $(background_color) {string} The background color of the image  
# @input $(description) {string[]} The description on the right hand side  
# @writes storage maceprotection:image image_data  
# @writes storage maceprotection:image width  
# @writes storage maceprotection:image height  
# @writes storage maceprotection:image background_color  
# @writes storage maceprotection:image description  
# @writes storage maceprotection:image pixel_character.blank  
# @writes storage maceprotection:image pixel_character.chat  
# @writes storage maceprotection:image pixel_character.lore

data remove storage maceprotection:image image_data
data remove storage maceprotection:image width
data remove storage maceprotection:image height
data remove storage maceprotection:image background_color
data remove storage maceprotection:image description

$data modify storage maceprotection:image image_data set value $(image_data)
$data modify storage maceprotection:image width set value $(width)
$data modify storage maceprotection:image height set value $(height)
$data modify storage maceprotection:image background_color set value "$(background_color)"
$data modify storage maceprotection:image description set value $(description)

data modify storage maceprotection:image pixel_character.blank set value "　"
data modify storage maceprotection:image pixel_character.pixel set value "▌▌"
data modify storage maceprotection:image pixel_character.line_break set value '\n'

function maceprotection:image/process/generate
