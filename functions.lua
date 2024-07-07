local functions = {}

--- Habilita o UTF-8 no terminal
---
function functions.enableUTF8()
    os.execute("chcp 65001")
end

---Printa no terminal a aprensentação do projeto de simulador de batalha.
---
function functions.printHeader()
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
end

---Organiza um barra de atributos do personagem.
---@param attribute number Número 10
---@return string
---
function functions.AttributeBar(attribute)
    attribute = attribute or 10
    local result = ""
    for i = 0, 9, 1 do
        if i <= attribute then
            result = result .. "■"
        else
            result = result .. "□"
        end
    end
    return result
end

function functions.printMonster(monster)
    print("| "..monster.Name)
    print("| "..monster.Description)
    print("|               Atributos ↓")
    print("| Vida Máxima:       " ..functions.AttributeBar(monster.Maxhealth))
    print("| Vida:              "..functions.AttributeBar(monster.Health))
    print("| Ataque:            "..functions.AttributeBar(monster.Attack))
    print("| Defesa:            "..functions.AttributeBar(monster.Defense))
    print("| Speed:             " ..functions.AttributeBar(monster.Speed))
end




return functions