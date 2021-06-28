class CheckFlyBuysCardNumber
  include UseCase

  attr_reader :card_number, :card, :message

  def initialize(fb_card_number)
    @card_number = fb_card_number.gsub(/\s+/, '')
    @card = FlyBuysCard.new(card_number: card_number)
  end

  def perform
    generate_message
    puts message
  end

  private

  def generate_message
    @message = "#{card.card_type}: #{card_number} (#{validate_card_number ? "valid" : "invalid"})"
  end

  def validate_card_number
    card.valid_card_number?
  end
end