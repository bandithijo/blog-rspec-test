require 'rails_helper'

RSpec.describe Author, type: :model do
  context 'Validation Presence Tests' do
    it 'Ensures full name presence' do
      author = Author.new(
        full_name: nil,
        email: Faker::Internet.free_email,
        password: Faker::Team.name.downcase.strip.gsub(' ', '')
      ).save
      expect(author).to eq(false)
    end

    it 'Ensures email presence' do
      author = Author.new(
        full_name: Faker::Team.name.titlecase,
        email: nil,
        password: Faker::Team.name.downcase.strip.gsub(' ', '')
      ).save
      expect(author).to eq(false)
    end

    it 'Ensures password presence' do
      author = Author.new(
        full_name: Faker::Team.name.titlecase,
        email: Faker::Internet.free_email,
        password: nil
      ).save
      expect(author).to eq(false)
    end

    it 'Should save successfully' do
      author = Author.new(
        full_name: Faker::Team.name.titlecase,
        email: Faker::Internet.free_email,
        password: Faker::Team.name.downcase.strip.gsub(' ', '')
      ).save
      expect(author).to eq(true)
    end
  end

  context 'Validation Length Tests' do
    it 'Ensures full name character length, more than 5' do
      author = Author.new(
        full_name: 'ban',
        email: Faker::Internet.free_email,
        password: Faker::Team.name.downcase.strip.gsub(' ', '')
      ).save
      expect(author).to eq(false)
    end

    it 'Ensures full name character length, less than 30' do
      author = Author.new(
        full_name: 'bandithijobandithijobandithijobandithijo',
        email: Faker::Internet.free_email,
        password: Faker::Team.name.downcase.strip.gsub(' ', '')
      ).save
      expect(author).to eq(false)
    end

    it 'Ensures email character length, less than 50' do
      author = Author.new(
        full_name: Faker::Team.name.titlecase,
        email: 'bandithijobandithijobandithijobandithijobandithijo@gmail.com',
        password: Faker::Team.name.downcase.strip.gsub(' ', '')
      ).save
      expect(author).to eq(false)
    end

    it 'Ensures password character length, same or more than 8' do
      author = Author.new(
        full_name: Faker::Team.name.titlecase,
        email: Faker::Internet.free_email,
        password: 'bandit'
      ).save
      expect(author).to eq(false)
    end
  end

  context 'Email Format Tests' do
    it 'Ensures email format not valid' do
      author = Author.new(
        full_name: Faker::Team.name.titlecase,
        email: 'bandithijo@bandithijo',
        password: Faker::Team.name.downcase.strip.gsub(' ', '')
      ).save
      expect(author).to eq(false)
    end

    it 'Ensures email format valid' do
      author = Author.new(
        full_name: Faker::Team.name.titlecase,
        email: Faker::Internet.free_email,
        password: Faker::Team.name.downcase.strip.gsub(' ', '')
      ).save
      expect(author).to eq(true)
    end
  end

  context 'Email Uniqueness Tests' do
    before do
      Author.new(
        full_name: Faker::Team.name.titlecase,
        email: 'bandithijo@gmail.com',
        password: Faker::Team.name.downcase.strip.gsub(' ', '')
      ).save
    end

    it 'Ensures email has uniqueness' do
      author = Author.new(
        full_name: Faker::Team.name.titlecase,
        email: 'bandithijo@gmail.com',
        password: Faker::Team.name.downcase.strip.gsub(' ', '')
      ).save
      expect(author).to eq(false)
    end
  end
end
