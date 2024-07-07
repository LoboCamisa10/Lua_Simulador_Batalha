-- Require
local player = require("definitions/player")
local monster = require("definitions.monster")
local functions = require("functions")

--Habitlita o UTF-8 no terminal

functions.enableUTF8()

--Printa o cabeçalho no terminal
functions.printHeader()

local boss = monster

functions.printMonster(boss)

