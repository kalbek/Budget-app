require 'rails_helper'

RSpec.describe Expense, type: :model do
  subject { described_class.new(name: 'Expense Name', icon: 'GROCERY.png') }

  context 'validations' do
    it 'should have a valid name' do
      expect(subject.name).to be_present
    end

    it 'should have a valid icon' do
      expect(subject.icon).to be_present
    end
  end
end
