require 'rails_helper'

RSpec.describe User, type: :model do
  it 'happy path' do
    user = FactoryBot.create(:user, id:1, email:"email@email.com", password_digest: "123")

    expect(user).to be_valid
  end

  it 'no duplicate emails allowed' do
    FactoryBot.create(:user, id:1, email:"email@email.com", password_digest: "123")

    expect {
      FactoryBot.create(:user, id:2, email:"email@email.com", password_digest: "123")
    }.to raise_error(Exception, /duplicate key value violates unique constraint \"index_users_on_email\"/)
  end
end
