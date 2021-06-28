require 'rails_helper'
RSpec.describe CheckFlyBuysCardNumber, type: :model do
  describe '#perform' do
    let(:check_card_number) { CheckFlyBuysCardNumber.perform(card_number) }

    subject { check_card_number }

    context 'a valid Fly Buys Black card number is supplied' do
      let(:card_number) { '60141016700078611' }

      it 'should return a valid message' do
        subject
        expect(check_card_number.message).to eq "Fly Buys Black: 60141016700078611 (valid)"
      end
    end

    context 'an invalid Fly Buys Black card number is supplied' do
      let(:card_number) { '6014152705006141' }

      it 'should return an invalid message' do
        subject
        expect(check_card_number.message).to eq "Fly Buys Black: 6014152705006141 (invalid)"
      end
    end

    context 'a "card number" that meets none of the card number requirements is supplied' do
      let(:card_number) { '601311111111111' }

      it 'should return an unknown, invalid message' do
        subject
        expect(check_card_number.message).to eq "Unknown: 601311111111111 (invalid)"
      end
    end
  end
end