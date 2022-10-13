# frozen_string_literal: true

class DragController < ApplicationController
  def photo
    @photo = Photo.find(params[:resource][:id])
    @photo.insert_at!(params[:resource][:position].to_i + 1)
  end

  private

  def drag_photo_params
    params.require(:resource).permit(:id, :position, :image)
  end
end
