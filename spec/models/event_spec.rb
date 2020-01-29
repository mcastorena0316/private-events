require 'rails_helper'

RSpec.describe Event, type: :model do
  before :each do
    @user = User.create(email: 'foobar@example.com', name: 'foobar')
    @event = @user.events.create(eventname: 'mufasa', description: 'mufasaisinthehouse', date: '2020/1/12')
  end

  context 'with valid details' do
    it 'should create an event' do
      expect(@event).to be_valid
    end

    it 'should have an event name' do
      expect(@event.eventname).to be_present
    end

    it 'should have a description' do
      expect(@event.description).to be_present
    end
  end

  context 'with invalid details' do
    it 'should not be valid' do
      @event.eventname = "    "
      expect(@event).to_not be_valid
    end

    it 'should not be valid' do
      @event.description = "    "
      expect(@event).to_not be_valid
    end
  end
end
