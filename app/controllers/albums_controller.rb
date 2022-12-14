# frozen_string_literal: true

class AlbumsController < ApplicationController
  before_action :set_album, only: %i[show edit update destroy]

  # GET /albums or /albums.json
  def index
    # binding.pry
    @albums = Album.all
  end

  # GET /albums/1 or /albums/1.json
  def show; end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit; end

  # POST /albums or /albums.json
  def create
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save

        format.html { redirect_to album_url(@album), notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_album
    @album = if params[:id].nil?
               Album.find(1)
             else
               Album.find(params[:id])

             end
  end

  # Only allow a list of trusted parameters through.
  def album_params
    params.require(:album).permit(:name)
  end
end
