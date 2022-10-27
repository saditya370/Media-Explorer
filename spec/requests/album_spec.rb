require 'rails_helper'

RSpec.describe 'Albums', type: :request do
  let(:valid_attributes) do
    {
      'id' => '1',
      'name' => 'adi'
    }
  end
  let(:invalid_attributes) do
    {
      'id' => 'aid',
      'name' => '2'
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      album = Album.new(valid_attributes)

      album.save
      get albums_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      album = Album.new(valid_attributes)

      album.save
      get album_url(album)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_album_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      album = Album.new(valid_attributes)

      album.save
      get edit_album_url(album)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Post' do
        expect do
          album = Album.new(valid_attributes)

          album.save
          post albums_url, params: { album: valid_attributes }
        end.to change(Album, :count).by(1)
      end

      it 'redirects to the created post' do
        post albums_url, params: { album: valid_attributes }
        expect(response).not_to be_successful
      end
    end
  end
end
