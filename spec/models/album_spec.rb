require 'rails_helper'

RSpec.describe Album, type: :model do
  it 'returns album name' do
    album = Album.create(name: 'there')
    expect(album.name).to eq('there')
  end

  it 'Model is only valid with name attribute' do
    album = Album.new(name: 'Aditya')
    expect(album).to be_valid
  end

  it 'Model is not valid if  name attribute is nil' do
    album = Album.new(name: nil)
    expect(album).to_not be_valid
  end
end
