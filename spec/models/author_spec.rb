require 'rails_helper'

RSpec.describe Author, type: :model do
  context 'Validation Presence Tests' do
    it 'Ensures full name presence'
    it 'Ensures email presence'
    it 'Ensures password presence'
    it 'Should save successfully'
  end

  context 'Validation Length Tests' do
    it 'Ensures full name character length, more than 5'
    it 'Ensures full name character length, less than 30'
    it 'Ensures email character length, less than 50'
    it 'Ensures password character length, same or more than 8'
  end

  context 'Email Format Tests' do
    it 'Ensures email format not valid'
    it 'Ensures email format valid'
  end

  context 'Username and Email Uniqueness Tests' do
    it 'Ensures username has uniqueness'
    it 'Ensures email has uniqueness'
  end
end
