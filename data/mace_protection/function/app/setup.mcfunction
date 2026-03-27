#> mace_protection:app/setup
# Called on load

scoreboard objectives add jodek.config dummy
execute unless score &mace_protection_load_message jodek.config = &mace_protection_load_message jodek.config run scoreboard players set &mace_protection_load_message jodek.config 1
execute unless score &mace_protection_advancements jodek.config = &mace_protection_advancements jodek.config run scoreboard players set &mace_protection_advancements jodek.config 1

# Initiate all scoreboard objectives
scoreboard objectives add mace_protection.image dummy

# Print the image
function mace_protection:config/image