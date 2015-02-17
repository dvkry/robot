class OffBoardError < StandardError
  
  def initialize(msg = "Play off board")
    super(msg)
  end
end