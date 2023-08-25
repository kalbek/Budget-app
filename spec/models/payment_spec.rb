require 'rails_helper'

RSpec.describe Payment, type: :model do
  subject { described_class.new(name: 'Payment Name', amount: 100) }

  context 'validations' do
    it 'should have a valid name' do
      expect(subject.name).to be_present
    end

    it 'should have a valid amount' do
      expect(subject.amount).to be_present
    end

    it 'should have a non-negative amount' do
      subject.amount = -50
      expect(subject).to_not be_valid
    end
  end
end
