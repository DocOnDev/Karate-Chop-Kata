class Chop
  def self.find(lookFor = nil, lookIn = [], start_index = nil, end_index = nil)
    start_index ||= 0
    end_index ||= lookIn.length
    middle = (start_index + end_index) / 2
    return middle if lookFor == lookIn[middle]
    return -1 if (middle == start_index || middle == end_index)
    return find(lookFor, lookIn, middle, end_index) if lookFor > lookIn[middle]
    return find(lookFor, lookIn, start_index, middle) if lookFor < lookIn[middle]
  end
end
