RSpec.describe User, type: :model do
  context 'Presence validations tests' do
    it 'returns false if the username is not present' do
      user = User.new(password: 'Some Content')
      expect(user.valid?).to eq(false)
    end

    it 'returns false if the password is not present' do
      user = User.new(username: 'Some Content')
      expect(user.valid?).to eq(false)
    end
  end
  context 'Association Test' do
    it 'ensures a user has many created events' do
      should have_many(:events)
    end

    it 'ensures event has many attendees' do
      should have_many(:attended_events)
    end
  end
end
