class ApiController < ApplicationController
  def get_driftmap
    driftmap = Driftmap.find(params[:driftmap_id])
    journeys = format_journeys(driftmap.journeys)
    render json: { driftmap: driftmap,
                   journeys: journeys }
  end

  private
    def format_journeys(journeys)
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
            
              gallery_images = []

              if g.waypoint_images.any?
                g.waypoint_images.each do |img|
                  gallery_images.push(img.image)
                end
              end
            


              galleries.push({
                id: g.id,
                title: g.title,
                description: g.description,
                coverphoto: g.coverphoto,
                images: gallery_images,
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

=begin
  JSON FORMAT:

  {
    "driftmap":{
      "id":1,
      "title":"./driftmap",
      "body":"just a computer hacker trying to get some more sunshine.",
      "init_x":0.924206230200376,
      "init_y":-34.2400771379471,
      "init_zoom":2,
      "user_id":1,
      "created_at":"2017-03-17T00:25:53.942Z",
      "updated_at":"2017-03-21T13:01:25.402Z",
      "color_scheme":"default"
    },

    "journeys":[{
      "journey":{
        "id":1,
        "description":"A Digital Nomad trek, laced with Gonzo adventure into the heart and cities of Colombia.",
        "title":"2015 - Colombia",
        "coverphoto":{
          "url":null
        },
        "driftmap_id":1,
        "created_at":"2017-03-17T00:25:53.962Z",
        "updated_at":"2017-03-17T00:25:53.962Z"
      },

      "waypoints":[{
        "id":1,
        "title":"bogota",
        "body":"The Capital and largest city in Colombia..."  

=end