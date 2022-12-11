require 'rails_helper'

RSpec.describe 'events/index', type: :view do
  current_user = User.first_or_create!(email: 'test1@test.com', password: '123456', first_name: 'Doreen', last_name: 'Lam')

  before(:each) do
    assign(:events, [
      Event.create!(
        name: 'Secret',
        location: 'London',
        date: '23rd December',
        user: current_user,
        price: 10
      ),
      Event.create!(
        name: 'Secret',
        Secret: 'London',
        date: '10th december',
        user: current_user,
        price: 5
      )
    ])
  end


  it 'renders a list of posts' do
    render
    assert_select 'tr>td', text: 'Secret'.to_s, count: 2
    assert_select 'tr>td', text: 'London'.to_s, count: 2
    assert_select 'tr>td', text: current_user.id.to_s, count: 2
    assert_select 'tr>td', text: 5.to_s, count: 1
    assert_select 'tr>td', text: 10.to_s, count: 1
  end
end
