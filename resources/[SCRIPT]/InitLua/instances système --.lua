

--[[

- Creer table pour chaque instance
- repertorier joueur dans instance
- expclure de la boucle les joueurs dans l'instance

    for i=1,256 do
        if NetworkIsPlayerActive(i) then

                if not table.hashid[nomdujoueur].present then

                    SetEntityVisible(GetPlayerPed(i), false, false)
                    SetEntityVisible(PlayerPedId(), true, true)
                    SetEntityNoCollisionEntity(GetPlayerPed(i), GetPlayerPed(-1), false)

                end
        end
    end

]]