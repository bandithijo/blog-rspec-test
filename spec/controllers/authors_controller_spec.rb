require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
  context 'Get #index' do
    it 'Returns a success response' do
      get :index
      expect(response).to be_ok
    end
  end

  context 'Get #show' do
    it 'Returns a success response' do
      author = Author.create!(
        full_name: Faker::Team.name.titlecase,
        email: Faker::Internet.free_email,
        password: Faker::Team.name.downcase.strip.gsub(' ', '')
      )
      get :show, params: { id: author.to_param }
      expect(response).to be_ok
    end
  end

  context 'Proper Routes Tests' do
    it 'Should has proper index route' do
      expect(get: '/authors').to be_routable
    end

    it 'Should has proper show route' do
      expect(get: '/authors/1').to be_routable
    end

    it 'Should has proper new route' do
      expect(get: '/authors/new').to be_routable
    end

    it 'Should has proper edit route' do
      expect(get: '/authors/1/edit').to be_routable
    end

    it 'Should has proper destroy route' do
      expect(delete: '/authors/1').to be_routable
    end
  end
end
