require 'rails_helper'

RSpec.describe Operation, type: :model do
  subject do
    user = User.create(name: 'nedjwa', password: 'password', email: 'nedjwa@gmail.com')
    Operation.new(name: 'Trip', amount: 867.4, user: user)
  end

  before { subject.save }

  it 'should have valid name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have valid amount' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end
end