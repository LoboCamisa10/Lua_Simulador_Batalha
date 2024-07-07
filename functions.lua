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

---Printa as informações do monstro 
---@param monster string Uma variável de um arquivo com informações de um monstro 
function functions.printMonster(monster)
    print("| "..monster.Name)
    print("| "..monster.Description)
    print("|               Atributos ↓")
    print("| Vida Máxima:       " ..functions.AttributeBar(monster.Maxhealth))
    print("| Vida:              "..functions.AttributeBar(monster.Health))
    print("| Ataque:            "..functions.AttributeBar(monster.Attack))
    print("| Defesa:            "..functions.AttributeBar(monster.Defense))
    print("| Speed:             "..functions.AttributeBar(monster.Speed))
end

function functions.printOpcoes()
    print("O que você vai fazer? ")
    print([[
        1 - Atacar com a espada.
        2 - Usar poção de regenaração.
        3 - Atirar uma pedra.
        4 - Se esconder.
    ]])
end

function functions.LoopActions(monster,  player)
    while true do
        --Printa as opções do jogador no terminal
        functions.printOpcoes()

        --Printa a pergunta e faz o imput da ação do player
        print("Digite uma ação de 1 a 4: ")
        local action = io.read("*n")

        --Turno do jogador escolher uma ação--------------------------------
        if action == 1 then
            monster.Health = monster.Health - 7
            print(string.format(" ► Você desfere um golpe com sua espada no %s e causou %d de dano! ◄", monster.Name, 7))
            print(string.format("HP %s →  %d / %d ", player.name, player.health, player.maxhealth))
            print(string.format("HP %s →  %d / %d ", monster.Name, monster.Health, monster.Maxhealth))
            print("========================")
        
        elseif action == 2 then
            if player.health == player.maxhealth then
                print("Sua vida ja está cheia!")
            else
                local heal = player.maxhealth - player.health
                player.health = player.health + heal
                print(string.format(" ► Você curou %d de vida! ◄", heal))
            end

            print(string.format("HP %s →  %d / %d ", player.name, player.health, player.maxhealth))
            print(string.format("HP %s →  %d / %d ", monster.Name, monster.Health, monster.Maxhealth))
            print("========================")
        
        elseif action == 3 then
            monster.Health = monster.Health - 3
            print(string.format(" ► Você atirou uma pedra na cabeça do %s e causou %d de dano! ◄", monster.Name, 3))
            print(string.format("HP %s →  %d / %d ", player.name, player.health, player.maxhealth))
            print(string.format("HP %s →  %d / %d ", monster.Name, monster.Health, monster.Maxhealth))
            print("========================")

        elseif action == 4 then
            if player.health >= 5 then
                print("Player fugiu da luta e se escondeu!")
                print()
                break
            else
                print("Você não possui vida o suficiente para fugir!")
                print()
            end
        end

        if monster.Health <= 0 then
            print(string.format("► O %s foi derrotado! \n Parábens pela vitória 😁 ◄",monster.Name))
            break
        end

        -- Turno do monstro fazer uma jogada--------------------------------
        local ActionMonster = math.random(4)
        
        if ActionMonster == 1 then
            player.health = player.health - 2
            print(string.format(" ► O %s mordeu e causou %d de dano a você! ◄",monster.Name, 2))
            print(string.format("HP %s →  %d / %d ", player.name, player.health, player.maxhealth))
            print(string.format("HP %s →  %d / %d ", monster.Name, monster.Health, monster.Maxhealth))
            print("========================")
        
        elseif ActionMonster == 2 then
            if monster.Health == monster.Maxhealth then
                print(string.format("► A vida do %s está cheia! ◄",monster.Name))
            else
                local monsterHealthNow = (monster.Maxhealth - monster.Health)
                local porcentageHeal = (monsterHealthNow / 100 ) * 30
                monster.Health = monster.Health + math.floor(porcentageHeal - 0.5)
                print(string.format(" ► O %s curou %d de vida! ◄", monster.Name, math.floor(porcentageHeal - 0.5)))
            end

            print(string.format("HP %s →  %d / %d ", player.name, player.health, player.maxhealth))
            print(string.format("HP %s →  %d / %d ", monster.Name, monster.Health, monster.Maxhealth))
            print("========================")
        
        elseif ActionMonster == 3 then
            player.health = player.health - 1
            print(string.format(" ► O %s rugiu e causou %d de dano a você! ◄",monster.Name, 2))
            print(string.format("HP %s →  %d / %d ", player.name, player.health, player.maxhealth))
            print(string.format("HP %s →  %d / %d ", monster.Name, monster.Health, monster.Maxhealth))
            print("========================")

        elseif ActionMonster == 4 then
            if monster.Health >= monster.Maxhealth/1.8 then
                print(string.format("O %s correu da batalha e se escondeu.",monster.Name))
                break
            else
                print(string.format("O %s tentou fugir da batalha mas fracassou!",monster.Name))
            end
        end

        --Finalização com a morte do player ou do monstro
        if player.health <= 0 then
            print(string.format("O %s foi derrotado! \n Você foi derrotado 😥",player.name))
            break
        end

        

    end
end

return functions