class Cell
  attr_accessor :content
  attr_writer :enable_to_pick

  EMPTY_CONTENT = '.'.freeze
  ENABLE_CONTENT = '0'.freeze

  def initialize(token = nil)
    @content = token.is_a?(Token) ? token : nil
    @enable_to_pick = false
  end

  def add_token(color)
    @content = Token.new(color)
  end

  def change_token
    return unless enabled?

    @content.reverse
    change_enable_or_disable
  end

  def show_cell
    if !@content.nil?
      @content.white? ? 'W' : 'B'
    else
      enabled? ? ENABLE_CONTENT : EMPTY_CONTENT
    end
  end

  def enabled?
    @enable_to_pick
  end

  def change_enable_or_disable
    @enable_to_pick = !@enable_to_pick
  end
end
