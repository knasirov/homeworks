def sluggish_octopus(fish_array)
  fish_array.length.times do
    (fish_array.length - 1).times do |i|
      self[i], self[i + 1] = self[i + 1], self[i] if self[i] > self[i + 1]
    end
  end
  fish_array.last
end

def dominant_octopus(fish_array)
  # we can use merge_sort to find fish in O(nlogn)
  # the code is long and goes like this:
  # blah blah blah. blah blah. blaaarrrhghghghhh
end

def clever_octopus(fish_array)
  longest_fish = nil
  fish_array.each do |fish|
    longest_fish = fish if fish.length > longest_fish.length
  end
  longest_fish
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index { |tile, idx| return idx if direction == tile }
end

tiles_hash = { "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3,
               "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7 }

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
