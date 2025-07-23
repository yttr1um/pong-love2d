Ball = {}

function Ball:load()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.width = 10
    self.height = 10
    self.speed = 400
    self.xVel = -self.speed
    self.yVel = 0

    self.sounds = {}
    self.sounds.bounce = love.audio.newSource("sounds/pongball.wav", "static")
    self.sounds.score = love.audio.newSource("sounds/pongscore.wav", "static")
end

function Ball:update(dt)
    self:move(dt)
    self:collide()
end

function Ball:move(dt)
    self.x = self.x + self.xVel * dt
    self.y = self.y + self.yVel * dt
end

function Ball:collide()
    if checkCollision(self, Player) then
        self.xVel = self.speed

        local middleBall = self.y + self.height / 2
        local middlePlayer = Player.y + Player.height / 2
        local collisionPosition = middleBall - middlePlayer
        self.yVel =  collisionPosition * 5

        self.sounds.bounce:play()
    end

    if checkCollision(self, AI) then
        self.xVel = -self.speed

        local middleBall = self.y + self.height / 2
        local middleAI = AI.y + AI.height / 2
        local collisionPosition = middleBall - middleAI
        self.yVel =  collisionPosition * 5

        self.sounds.bounce:play()
    end

    if self.y < 0 then 
        self.y = 0
        self.yVel = -self.yVel
        self.sounds.bounce:play()

    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
        self.yVel = -self.yVel
        self.sounds.bounce:play()
    end

    if self.x < 0 then
        self.x = love.graphics.getWidth() / 2 - self.width /2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.yVel = 0
        self.xVel = self.speed
        AI.score = AI.score + 1
        self.sounds.score:play()
    end

    if self.x + self.width > love.graphics.getWidth() then
        self.x = love.graphics.getWidth() / 2 - self.width /2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.yVel = 0
        self.xVel = -self.speed
        Player.score = Player.score + 1
        self.sounds.score:play()
    end
end

function Ball:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end