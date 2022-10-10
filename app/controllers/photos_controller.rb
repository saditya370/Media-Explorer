class PhotosController < ApplicationController
  def create
    @album = Album.find(params[:album_id])
    @photo = @album.photos.new
    var = photo_params[:image]
    # debugger
    var.each do |a|
      if(a == "")
        next
      end
      @photo= @album.photos.create!(image: a)
    end
    
    if @photo.save
      redirect_to album_path(@album)
    else
      render :new , status: :unprocessable_entity
    end
  end

  private 

  def photo_params 

      params.require(:photo).permit(:album_id,image: [])

  end
end
