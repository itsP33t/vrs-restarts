--[[
$$\    $$\                                         
$$ |   $$ |                                        
$$ |   $$ | $$$$$$\   $$$$$$\   $$$$$$$\  $$$$$$\  
\$$\  $$  |$$  __$$\ $$  __$$\ $$  _____|$$  __$$\ 
 \$$\$$  / $$$$$$$$ |$$ |  \__|\$$$$$$\  $$$$$$$$ |
  \$$$  /  $$   ____|$$ |       \____$$\ $$   ____|
   \$  /   \$$$$$$$\ $$ |      $$$$$$$  |\$$$$$$$\ 
    \_/     \_______|\__|      \_______/  \_______|                                           
            store.VerseScripts.net
--]]
-- Need help? https://discord.gg/verse-scripts
Config = {}

function TriggerAnnouncement(n)
	if n == 1 then
		TriggerEvent("p33t-announce:server:announce", "The server will be restarted in 10 minutes", "restart")
	elseif n == 2 then
		TriggerEvent("p33t-announce:server:announce", "The server will be restarted in 5 minutes", "restart")
	elseif n == 3 then
		TriggerEvent("p33t-announce:server:announce", "The server will be restarted in 1 minute", "restart")
	end -- add another elseif if you want to add more messages and times
end

-- Define the target times in hours and minutes
Config.targetTimes = {
	{ hour = 23, minute = 50, func = TriggerAnnouncement, args = { 1 } },
	{ hour = 23, minute = 55, func = TriggerAnnouncement, args = { 2 } },
	{ hour = 23, minute = 59, func = TriggerAnnouncement, args = { 3 } },
}
