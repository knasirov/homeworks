class LRUCache
  def initialize(size)
    @cache = []
    @size  = size
  end

  def count
    @cache.count
  end

  def add(el)
    if include?(el)
      make_most_recent(el)
    else
      count < @size ? @cache << el : shift_n_push(el)
    end
    el
  end

  def show
    p @cache.dup
  end

  private

  def include?(element)
    @cache.each { |el| return true if el == element }
    false
  end

  def shift_n_push(el)
    @cache.shift
    @cache << el
  end

  # this is terrible implementtation
  # i dont't like using delete because it deletes every element equal to
  # passed in element, but in this class we can only have one of each el.
  def make_most_recent(el)
    el_idx = @cache.find_index(el)
    (el_idx + 1...count).each do |i|
      @cache[i - 1] = @cache[i]
    end
    @cache[count - 1] = el
  end
end
