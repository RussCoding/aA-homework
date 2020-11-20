def sluggish_octopus(fish)
    answer = fish.first
    fish.each do |ele1|
        fish.each do |ele2|
            answer = ele1 if ele1.length > ele2.length && ele1.length > answer.length
        end
    end
    answer
end

def merge_sort (array, &prc)
    return array if array.length <= 1

    mid_idx = array.length / 2
    merge(
      merge_sort(array.take(mid_idx), &prc),
      merge_sort(array.drop(mid_idx), &prc),
      &prc
    )
  end

  # NB: In Ruby, shift is an O(1) operation. This is not true of all languages.
  def merge(left, right, &prc)
    merged_array = []
    prc = Proc.new { |num1, num2| num1 <=> num2 } unless block_given?
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged_array << left.shift
      when 0
        merged_array << left.shift
      when 1
        merged_array << right.shift
      end
    end

    merged_array + left + right
  end

  def dominant_octopus(arr)
    merge_sort(arr)[-1]
  end


def  clever_octopus(arr)
    largest = arr.first
    arr.each {|fish| largest = fish if fish.length >  largest.length}
    largest
end

def slow_dance(dir, tiles)
    tiles.each_with_index {|tile,idx| return idx if tile == dir}
end
def constant_dance(dir,tiles)
    tiles[dir]
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
tiles_hash = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, 
        "left" => 6,  "left-up" => 7 }

fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

p sluggish_octopus(fishes)
p dominant_octopus(fishes)
p clever_octopus(fishes)
p slow_dance("down", tiles_array)
p constant_dance("down",tiles_hash)


