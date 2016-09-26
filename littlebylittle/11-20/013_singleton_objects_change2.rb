module LiveCell
	def self.to_s() 'o' end
	def self.next_generation(x,y,board)
		case board.neighbos(x,y).count(LIVE_CELL)
		when 2..3 then self
		else DEAD_CELL
		end
	end
end



module DeadCell
	def self.to_s() '.' end
	def self.next_generation(x,y,board)
		case board.neighbos(x,y).count(LIVE_CELL)
		when 3 then LIVE_CELL
		else self
		end
	end
end

puts [
[DeadCell, LiveCell, LiveCell, DeadCell],
[DeadCell, LiveCell, LiveCell, DeadCell]

]
    
#=>.
#o
#o
#.
#.
#o
#o
#.

p [
[DeadCell, LiveCell, LiveCell, DeadCell],
[DeadCell, LiveCell, LiveCell, DeadCell]
]
#=>[[#<Object:0x007fc59204b208>, #<Object:0x007fc59204b280>,
##<Object:0x007fc59204b280>, #<Object:0x007fc59204b208>],
#[#<Object:0x007fc59204b208>, #<Object:0x007fc59204b280>,
##<Object:0x007fc59204b280>, #<Object:0x007fc59204b208>]] 
