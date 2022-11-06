PipePair = Class{}



function PipePair:init(y)
    GAP_HEIGHT = math.random(90,120)
	self.x = VIRTUAL_WIDTH
	self.y = y

	self.pipes = {
        ['upper'] = Pipe('top', self.y),
        ['lower'] = Pipe('bottom', self.y + GAP_HEIGHT + PIPE_HEIGHT)
    }
 
    self.remove = false
end

function PipePair:update(dt)
	if self.x > -PIPE_WIDTH then
		self.x = self.x - PIPE_SPEED * dt
		self.pipes['lower'].x = self.x
        self.pipes['upper'].x = self.x
    else 
        self.remove = true
        self.scored = false
    end
end

function PipePair:render()  
    for l, pipe in pairs(self.pipes) do
        pipe:render()
    end
end