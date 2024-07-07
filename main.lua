-- Require
local player = require("definitions/player")
local monster = require("definitions.monster")

--Habitlita o UTF-8 no terminal
os.execute("chcp 65001")

--Printa o cabeçalho no terminal
print([[
================================================================================================
           /\                                                                      /\
 _         )( ______________________                        ______________________ )(        _
(_)///////(**)______________________> SIMULADOR DE BATALHA <_____________________(**)\\\\\\\(_)
           )(                                                                      )(
           \/                                                                      \/
================================================================================================

                            Empunhe sua espada e prepare-se para lutar!
                                       É hora da batalha!

]])

local boss = monster

player.Health = player.Health -2
print(string.format("HP %s = %d / %d",player.Name, player.Health, player.Maxhealth))
print("")
monster.Health = monster.Health - 7
print(string.format("HP %s = %d / %d",monster.Name, monster.Health, monster.Maxhealth))


