# frozen_string_literal: true

class PhotosController < ApplicationController
  before_action :set_album
  def index
    @album = Album.find(params[:album_id])
    # @photo = @album.photos.all.order(position: :asc)
  end

  def create
    # @photo = @album.photos.new
    all_photos = photo_params[:image]

    all_photos.shift
    all_photos.each do |a|
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

  def set_album
    @album = Album.find(params[:album_id])
  end

  def photo_params
    params.require(:photo).permit(:album_id, image: [])
  end
end
