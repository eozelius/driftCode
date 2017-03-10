class GalleriesController < ApplicationController
  def new
    @gallery = Gallery.new
  end

  def create

  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update

  end

  def destroy

  end

  private
    def gallery_params
      params.require(:gallery).permit(:title, :description, :x, :y, :coverphoto)
    end
end