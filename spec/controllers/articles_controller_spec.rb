require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  context 'Get #index' do
    it 'Returns a success response' do
      get :index
      expect(response).to be_ok
    end
  end

  context 'Get #show' do
    before do
      @author = Author.create!(
        full_name: Faker::Team.name.titlecase,
        email: Faker::Internet.free_email,
        password: Faker::Team.name.downcase.strip.gsub(' ', '')
      )
    end

    it 'Returns a success response' do
      article = Article.create!(
        title: Faker::Team.name.titlecase,
        post: Faker::Hipster.paragraphs.map! { |w| "#{w}" }.join,
        author_id: @author.id
      )
      get :show, params: { id: article.to_param }
      expect(response).to be_ok
    end
  end

  context 'proper Routes Tests' do
    it 'Should has proper index route' do
      expect(get: '/articles').to be_routable
    end

    it 'Should has proper show route' do
      expect(get: '/articles/1').to be_routable
    end

    it 'Should has proper new route' do
      expect(get: '/articles/new').to be_routable
    end

    it 'Should has proper edit route' do
      expect(get: '/articles/1/edit').to be_routable
    end

    it 'Should has proper destroy route' do
      expect(delete: '/articles/1').to be_routable
    end
  end
end
