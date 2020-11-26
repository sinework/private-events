RSpec.describe Event, type: :model do
  describe 'validations' do
    it 'ensures the title is present' do
      event = Event.new(description: 'desc', date: Time.now, user_id: 21)
      expect(event.valid?).to eq(false)
    end
    it 'ensures the description is present' do
      event = Event.new(title: 'desc', date: Time.now, user_id: 21)
      expect(event.valid?).to eq(false)
    end
    it 'ensures the date is present' do
      event = Event.new(title: 'title', description: 'desc', user_id: 21)
      expect(event.valid?).to eq(false)
    end
  end
  context 'Association Test' do
    it 'ensures event event belongs to one user' do
      should belong_to(:creator)
    end

    it 'ensures event has many attendees' do
      should have_many(:attendees)
    end
  end
end
