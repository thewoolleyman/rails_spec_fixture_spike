require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a fixture with a name' do
    user = users(:one)
    expect(user.name).to eq('MyString')
  end
end
