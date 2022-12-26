# frozen_string_literal: true

class PhotosController < ApplicationController
  before_action :set_album
  def index
  end

  def create
    all_photos = photo_params[:image]
    all_photos.shift
    all_photos.each do |a|
      @photo = @album.photos.create!(image: a)
    end

    if @photo != nil && @photo.save
      if @album == Album.first
        redirect_to root_path
      else
        redirect_to album_path(@album)
      end
    else
      redirect_to album_path(@album)
    end
  end

  def update
    if @photo.update
      redirect_to root_path
    else
      redirect_to album_path(@ablum)
    end
  end

  private

  def set_album
    @album = Album.find_by(id: params[:album_id])
  end

  def photo_params
    params.require(:photo).permit(:album_id, image: [])
  end
end
