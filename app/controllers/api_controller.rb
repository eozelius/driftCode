class ApiController < ApplicationController
  def home
    journeys = User.find(1).driftmap.journeys
    response = responsify journeys
    render json: response
  end

  def profile_page
    user = User.find(params[:id])
    journeys = user.driftmap.journeys
    response = responsify journeys
    render json: response
  end

  def journey_edit
    journeys = []
    journeys.push(Journey.find params[:id])

    response = responsify journeys
    render json: response
  end

  private
    def responsify(journeys)
      response = []

      journeys.each do |journey|
        my_journey_wps = []

        journey.waypoints.order(:date).each do |wp|
          wp_images = []
          wp.waypoint_images.each do |image|
            wp_images.push(image)
          end         

          my_journey_wps.push({ 
            id: wp.id,
            title: wp.title,
            body: wp.body,
            x: wp.x,
            y: wp.y,
            journey_id: wp.journey_id,
            driftmap_id: journey.driftmap_id,
            images: wp_images,
            date: {
              year:  wp.date.year,
              month: wp.date.month,
              day:   wp.date.day 
            } 
          })
        end

        response.push({ 
          journey: journey, 
          waypoints: my_journey_wps 
        })
      end

      return response
    end
end