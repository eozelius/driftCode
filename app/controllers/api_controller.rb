class ApiController < ApplicationController
  def home
    journeys = User.find(1).driftmap.journeys
    driftmap = User.find(1).driftmap
    response = responsify journeys
    render json: { driftmap: driftmap, journeys: response }
  end

  def profile_page
    user = User.find(params[:id])
    journeys = user.driftmap.journeys
    response = responsify journeys
    render json: { driftmap: user.driftmap, journeys: response }
  end

  def journey_edit
    journey = Journey.find(params[:id])
    driftmap = Driftmap.find(journey.driftmap_id)
    journeys = [journey]

    response = responsify journeys
    render json: { driftmap: driftmap, journeys: response }
  end

  private
    def responsify(journeys)
      response = []

      journeys.each do |journey|
        waypoints = [] 

        journey.waypoints.order(:date).each do |wp|
          galleries = []
          friends = []
          essays = []
          treks = []
          
          # galleries
          if wp.galleries.any?
            wp.galleries.each do |g|
              galleries.push({
                id: g.id,
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
                id: f.id,
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
                id: e,
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
                id: t.id,
                title: t.title,
                description: t.description,
                coverphoto: t.coverphoto,
                waypoint_id: t.waypoint_id
              })
            end
          end

          waypoints.push({ 
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
        end

        response.push({ 
          journey: journey, 
          waypoints: waypoints
        })
      end

      return response
    end
end