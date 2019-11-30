require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Validation Presence Tests' do
    it 'Ensures title presence' do
      article = Article.new(
        title: nil,
        post: Faker::Hipster.paragraphs.map! { |w| "#{w}" }.join,
        author_id: 1
      ).save
      expect(article).to eq(false)
    end

    it 'Ensures post presence' do
      article = Article.new(
        title: Faker::Team.name,
        post: nil,
        author_id: 1
      ).save
      expect(article).to eq(false)
    end

    it 'Ensures author id presence' do
      article = Article.new(
        title: Faker::Team.name,
        post: Faker::Hipster.paragraphs.map! { |w| "#{w}" }.join,
        author_id: nil
      ).save
      expect(article).to eq(false)
    end

    it 'Should save successfully' do
      article = Article.new(
        title: Faker::Team.name,
        post: Faker::Hipster.paragraphs.map! { |w| "#{w}" }.join,
        author_id: 1
      ).save
      expect(article).to eq(true)
    end
  end

  context 'Validation Length Tests' do
    it 'Ensures title character  length, not less than 5' do
      article = Article.new(
        title: 'ban',
        post: Faker::Hipster.paragraphs.map! { |w| "#{w}" }.join,
        author_id: 1
      ).save
      expect(article).to eq(false)
    end

    it 'Ensures title character length, not more than 30' do
      article = Article.new(
        title: 'bandithijobandithijobandithijobandithijo',
        post: Faker::Hipster.paragraphs.map! { |w| "#{w}" }.join,
        author_id: 1
      ).save
      expect(article).to eq(false)
    end

    it 'Ensures post character length, not less than 5' do
      article = Article.new(
        title: Faker::Team.name,
        post: 'ban',
        author_id: 1
      ).save
      expect(article).to eq(false)
    end
  end

  context 'Data Type Tests'
end
