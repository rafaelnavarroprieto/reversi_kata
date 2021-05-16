class Token
  attr_accessor :color

  def initialize(color)
    case color.downcase
    when 'white'
      @color = true
    when 'black'
      @color = false
    else
      raise 'token cannot be create.'
    end
  end

  def reverse
    @color = !@color
  end

  def white?
    @color == true
  end

  def black?
    @color != true
  end
end
