-- Require
local player = require("definitions/player")
local monster = require("definitions.monster")
local functions = require("functions")

--Habitlita o UTF-8 no terminal

functions.enableUTF8()

--Printa o cabeçalho no terminal
functions.printHeader()

local boss = monster
local jogador = player

functions.printMonster(boss)


print()
print(string.format("HP %s →  %d / %d ", player.name, player.health, player.maxhealth))
print(string.format("HP %s →  %d / %d ", monster.Name, monster.Health, monster.Maxhealth))
print("========================")
functions.LoopActions(boss, jogador)