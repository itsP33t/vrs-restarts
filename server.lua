-- Table to keep track of triggered events
local triggeredEvents = {}

-- Function to check if an event has been triggered for a given target time
local function IsTriggered(targetTime)
  return triggeredEvents[targetTime]
end

-- Function to set an event as triggered for a given target time
local function SetTriggered(targetTime)
  triggeredEvents[targetTime] = true
end

-- Function to check the server time and trigger net events
local function checkServerTime()
  local currentTime = os.date("*t")

  for _, targetTime in ipairs(Config.targetTimes) do
    -- Check if the func field is defined
    if targetTime.func then
      -- Calculate the target timestamp
      local targetTimestamp = os.time({year = currentTime.year, month = currentTime.month,
                                        day = currentTime.day, hour = targetTime.hour,
                                        min = targetTime.minute, sec = 0})

      -- Check if the current time matches the target time and the event hasn't been triggered yet
      if currentTime.hour == targetTime.hour and
         currentTime.min == targetTime.minute and not IsTriggered(targetTime) then
        targetTime.func(table.unpack(targetTime.args)) -- Call the function with arguments
        SetTriggered(targetTime)
      end
    else
      print("Error: Missing function for target time:", targetTime.hour, targetTime.minute)
    end
  end

  Citizen.SetTimeout(15000, checkServerTime)
end

-- Start the timer by calling the checkServerTime function once
checkServerTime()
