# frozen_string_literal: true

class PhotosController < ApplicationController
  def index
    @album = Album.find(params[:album_id])
    # @photo = @album.photos.all.order(position: :asc)
  end

  def create
    @album = Album.find(params[:album_id])
    @photo = @album.photos.new
    var = photo_params[:image]

    var.each do |a|
      next if a == ''

      @photo = @album.photos.create!(image: a)
    end

    if @photo.save
      if @album == Album.first

        redirect_to root_path

      else
        redirect_to album_path(@album)
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @album = Album.find(params[:album_id])
    if @photo.update

      redirect_to root_path

    else
      redirect_to album_path(@ablum)

    end
  end

  private

  def photo_params
    params.require(:photo).permit(:album_id, image: [])
  end
end
