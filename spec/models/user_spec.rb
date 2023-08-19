require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'John Doe', email: 'jon@email.com') }

  context 'validations' do
    it 'should have a valid name' do
      expect(subject.name).to be_present
    end

    it 'should have a valid name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have a valid email' do
      expect(subject.email).to be_present
    end

    it 'should have a valid email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end
end
