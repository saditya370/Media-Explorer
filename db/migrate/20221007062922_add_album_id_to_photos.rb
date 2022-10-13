# frozen_string_literal: true

class AddAlbumIdToPhotos < ActiveRecord::Migration[7.0]
  def change
    add_column :photos, :album_id, :integer
  end
end
