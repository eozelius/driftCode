class ApiController < ApplicationController
  def home
    journeys = [User.find(1).driftmap.journeys.third, User.find(1).driftmap.journeys.last]
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
        wps = Array.new, galleries = [], friends = [], essays = [], treks = []

        journey.waypoints.order(:date).each do |wp|
=begin
          # galleries
          if wp.galleries.any?
            wp.galleries.each do |g|
              galleries.push({
                title: g.title,
                description: g.description,
                coverphoto: g.coverphoto,
                x: g.x,
                y: g.y,
                waypoint_id: g.waypoint_id
              })
            end
          end

          # friends  
          if wp.friends.any?
            wp.friends.each do |f|
              friends.push({
                first_name: f.first_name,
                last_name: f.last_name,
                photo: f.photo,
                description: f.description,
                x: f.x,
                y: f.y,
                member: f.member,
                visible: f.visible,
                email: f.email,
                waypoint_id: f.waypoint_id
              })
            end
          end
          
          # Essays
          if wp.essays.any?
            wp.essays.each do |e|
              essays.push({
                title: e.title,
                body: e.body,
                coverphoto: e.coverphoto,
                x: e.x,
                y: e.y,
                waypoint_id: e.waypoint_id
              })
            end
          end

          # treks
          if wp.treks.any?
            wp.treks.each do |t|
              treks.push({
                title: t.title,
                description: t.description,
                coverphoto: t.coverphoto,
                waypoint_id: t.waypoint_id
              })
            end
          end
=end
=begin
          wps.push({ 
            id: wp.id,
            title: wp.title,
            body: wp.body,
            x: wp.x,
            y: wp.y,
            content: {
              galleries: galleries,
              friends: friends,
              essays: essays,
              treks: treks,
            },
            journey_id: wp.journey_id,
            driftmap_id: journey.driftmap_id,
            coverphoto: wp.coverphoto,
            date: {
              year:  wp.date.year,
              month: wp.date.month,
              day:   wp.date.day 
            } 
          })
=end
        end

        Rails.logger.debug " >>>> wps: #{wps}" 

        response.push({ 
          journey: journey, 
          waypoints: wps 
        })
      end

      return response
    end
end