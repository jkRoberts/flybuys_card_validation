class FlyBuysCard < OpenStruct
  CARD_STEP_AMOUNT=2

  def card_type
    # Take card number, get first digits, and determine card type
    if card_number.starts_with?("60141")
      "Fly Buys Black"
    elsif card_number.starts_with?("6014352")
      "Fly Buys Red"
    elsif card_number.starts_with?("6014355526", "6014355527", "6014355528", "6014355529")
      "Fly Buys Green"
    elsif card_number.starts_with?("6014")
      "Fly Buys Blue"
    else
      "Unknown"
    end
  end
  
  def valid_card_number?
    return false unless card_number.starts_with?("6014") && (card_number.length == 16 || card_number.length == 17)

    numbers = card_number.split(//)
    numbers.reverse!.map!(&:to_i)
    (CARD_STEP_AMOUNT - 1).step(numbers.size - 1, CARD_STEP_AMOUNT).map { |i| numbers[i] = numbers[i].to_i * 2 }

    doubled_numbers = numbers.join('').split(//).map(&:to_i)
    total = doubled_numbers.reduce(:+)
    
    total % 10 == 0
  end
end