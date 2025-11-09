#> maceprotection:uninstall
# Function to uninstall the datapack

data remove storage maceprotection:image image_data
data remove storage maceprotection:image width
data remove storage maceprotection:image height
data remove storage maceprotection:image background_color
data remove storage maceprotection:image description
data remove storage maceprotection:image tellraw

advancement revoke @a only jodek:maceprotection
advancement revoke @a only jodek:utility
advancement revoke @a only jodek:root

scoreboard objectives remove maceprotection.image

say Successfully uninstalled Mace Protection Enchantment!