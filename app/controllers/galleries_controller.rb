class GalleriesController < ApplicationController
  def new
    @gallery = Gallery.new
  end

  def create
    @waypoint = Waypoint.find(params[:waypoint_id])
    if @waypoint.present?
      @gallery = @waypoint.galleries.create(gallery_params)

      if @gallery.valid?
        flash[:success] = "gallery successfully created"
        redirect_to current_user
      else
        flash[:danger] = "whoops, something went wrong" 
        render 'new'
      end
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
    @waypoint = Waypoint.find(@gallery.waypoint_id)
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