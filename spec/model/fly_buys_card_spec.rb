require 'rails_helper'
RSpec.describe FlyBuysCard, type: :model do
  let(:card) { FlyBuysCard.new(card_number: card_number) }

  describe '#card_type' do
    subject { card.card_type }

    context 'with a Fly Buys Black Card Number' do
      let(:card_number) { "60141016700078611" }

      it 'should return "Fly Buys Black"' do
        expect(subject).to eq "Fly Buys Black"
      end
    end

    context 'with an Unknown Card Number' do
      let(:card_number) { "601311111111111" }

      it 'should return "Fly Buys Black"' do
        expect(subject).to eq "Unknown"
      end
    end
  end

  describe '#valid_card_number?' do
    subject { card.valid_card_number? }

    context 'the number is a valid card number' do
      let(:card_number) { '6014355526000020' }

      it 'should return false' do
        expect(subject).to eq true
      end
    end

    context 'the number is too short' do
      let(:card_number) { '6014666555' }

      it 'should return false' do
        expect(subject).to eq false
      end
    end

    context 'the number doesn\'t start with 6014' do
      let(:card_number) { '60131016700078611' }

      it 'should return false' do
        expect(subject).to eq false
      end
    end

    context 'the validation algorithm returns false' do
      let(:card_number) { '6014355526000028' }

      it 'should return false' do
        expect(subject).to eq false
      end
    end
  end
end