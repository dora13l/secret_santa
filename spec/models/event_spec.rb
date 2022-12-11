require 'rails_helper'

RSpec.describe Event, type: :model do
  current_user = User.first_or_create!(email: 'test1@test.com', password: '123456', first_name: 'Doreen', last_name: 'Lam')
  it 'has a name' do
    event = Event.new(
      name: '',
      location: 'London',
      user: current_user,
      price: 10
    )

    expect(event).to_not be_valid
    event.name = "Secret Santa woo"
    expect(event).to be_valid
  end

  it 'has a name at least 2 charcters long' do
    event = Event.new(
      name: 'h',
      location: 'Spain',
      user: current_user,
      price: 10
    )
    expect(event).to_not be_valid
    event.name = "Secret Santa woo"
    expect(event).to be_valid
  end

  it 'has numerical price' do
    event = Event.new(
      name: 'Secrets',
      location: 'London',
      user: current_user,
      price: 10
    )

    expect(event.price).to be_a(Integer)
  end
end
