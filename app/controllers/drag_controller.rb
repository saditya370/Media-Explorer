class DragController < ApplicationController


    def photo
        # @album = Album.find(drag_album_params[:id])
        @photo = Photo.find(params[:resource][:id])
        @photo.insert_at!(params[:resource][:position].to_i + 1)
        # debugger
    end 
    private

    def drag_photo_params 
        params.require(:resource).permit(:id,:position,:image)
    end
   
end
