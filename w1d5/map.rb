class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    if lookup(key)
      @map.each { |pair| pair[-1] = value if pair.first == key }
    else
      @map << [key, value]
    end
  end

  def lookup(key)
    @map.each { |pair| return pair.last if pair.first == key }
    false
  end

  def remove(key)
    @map.each { |pair| @map.delete(pair) if pair.first == key }
  end

  def show
    @map
  end
end
