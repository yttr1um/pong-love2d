local Player = require("player")
local Ball = require("ball")
local AI = require("ai")

function love.load()
    Player:load()
    AI:load()
    Ball:load()
end

function love.update(dt)
    Player:update(dt)
    AI:update(dt)
    Ball:update(dt)
end

function love.draw()
    Player:draw()
    AI:draw()
    Ball:draw()
end

function checkCollision(a, b)
    if a.x + a.width > b.x and a.x< b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
        return true
    else
        return false
    end
end