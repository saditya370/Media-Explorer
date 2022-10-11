class AddPositionToPhotos < ActiveRecord::Migration[7.0]
  def change
    add_column :photos, :position, :integer

    
    
    
    
  end
end
