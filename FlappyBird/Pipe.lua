Pipe = Class{}

local PIPE_IMAGE = love.graphics.newImage('pipe.png')

local PIPE_SCROLL = -60

PIPE_SPEED = 60
PIPE_HEIGHT = 288
PIPE_WIDTH = 70

function Pipe:init(orientation,y)
	self.width = PIPE_IMAGE:getWidth()
	self.height = PIPE_HEIGHT
	self.x = VIRTUAL_WIDTH
	self.y = y

	self.orientation = orientation

end

function Pipe:update(dt)
	self.x = self.x + PIPE_SCROLL*dt
end

function Pipe:render()
    love.graphics.draw(PIPE_IMAGE, self.x, 

        -- shift pipe rendering down by its height if flipped vertically
        (self.orientation == 'top' and self.y + PIPE_HEIGHT or self.y), 

        -- scaling by -1 on a given axis flips (mirrors) the image on that axis
        0, 1, self.orientation == 'top' and -1 or 1)
end
