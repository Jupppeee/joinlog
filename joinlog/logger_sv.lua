local logs = "https://discordapp.com/api/webhooks/606268766287953930/ZFcbGZ-6E1ehePt72DyXDS307CCJ0UFr5naWSXnLt8UdqnXqMqFLQ6farrJt9Rrs4ogfo-"   -- change this
local communityname = "NAME"     -- change
local communtiylogo = "https://imgur.com/zz2EXieX" --Must end with .png or .jpg

AddEventHandler('playerConnecting', function()
local name = GetPlayerName(source)
local steamhex = GetPlayerIdentifier(source)
local licenses = GetPlayerIdentifiers(source)
local ip = GetPlayerEndpoint(source)
local connect = {
            {
                ["color"] = "56108",
                ["title"] = "Kansalainen liittymässä kaupunkiin",
                ["description"] = "Steam: **"..name.."**\n Hex: **"..steamhex.."**\n Lisenssi: **"..licenses[2].."**\nIP: **"..ip.."**",
	            ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "Tietoa kansalaisesta", embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerDropped', function(reason)
local name = GetPlayerName(source)
local steamhex = GetPlayerIdentifier(source)
local licenses = GetPlayerIdentifiers(source)
local ip = GetPlayerEndpoint(source)
local disconnect = {
            {
                ["color"] = "16711680",
                ["title"] = "Kansalainen poistui kaupungista",
                ["description"] = "Steam: **"..name.."**\nID: **"..source.."**\n Hex: **"..steamhex.."**\n Lisenssi: **"..licenses[2].."**\nIP: **"..ip.."**",
	            ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

    PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "Tietoa kansalaisesta", embeds = disconnect}), { ['Content-Type'] = 'application/json' })
end)
