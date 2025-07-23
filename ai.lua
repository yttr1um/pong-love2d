local AI = {}

function AI:load()
    self.x = love.graphics.getWidth() - 50
    self.y = love.graphics.getHeight() / 2
    self.width = 20
    self.height = 100
end

function AI:update(dt)

end

function AI:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return AI