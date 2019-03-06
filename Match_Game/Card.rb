class Card
  
  attr_reader :face_up, :value

  def initialize(value)
    @value = value
    @face_up = false
  end

  def display_info
    @face_up ? @value : " "
  end

  def flip
    @face_up ? @face_up = false : @face_up = true
  end

  def ==(other_card)
    self.value == other_card.value if other_card != nil
  end

end