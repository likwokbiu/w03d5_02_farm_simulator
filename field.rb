class Field

  NUMBER_OF_CORN_PER_HECTARE = 20
  NUMBER_OF_RICE_PER_HECTARE = 40
  NUMBER_OF_WHEAT_PER_HECTARE = 30

  def initialize(type, size)
    @type = type
    @size = size
    @harvested = false
  end

  def type
    @type
  end

  def size
    @size
  end

  def harvested
    @harvested
  end

  def type=(type)
    @type = type
  end

  def size=(size)
    @size = size
  end

  def harvest
    @harvested = true
  end

  def food
    return (NUMBER_OF_CORN_PER_HECTARE * @size) if @type == "corn" && @harvested == true
    return (NUMBER_OF_RICE_PER_HECTARE * @size) if @type == "rice" && @harvested == true
    return (NUMBER_OF_WHEAT_PER_HECTARE * @size) if @type == "wheat" && @harvested == true
    return 0
  end

end
