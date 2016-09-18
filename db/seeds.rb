# Seeds for all Environments
ethan = User.create!( 
  name:     'ethan',
  email:    'e.ozelius@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  activated: true,
  activated_at: Time.zone.now,
  admin: true,
  from: 'concord new hampshire',
  gps: 'queens new york',
  profile_pic: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/ethan.jpg")
)

# Create driftmap for ethan
ethan.post = Post.create(
  title:  "./driftmap",
  body:   "just a computer hacker trying to get some fresh air.",
  init_x: 0.924206230200376,
  init_y: -34.2400771379471,
  init_zoom: 2
)

queens = ethan.post.blips.create!(
  title: 'Sunnyside Queens',
  body: 'Queens NY.  From Flushing to Astoria to Jamaica, for centuries the world has landed in Queens to embark on a new life in the United States.  The culture, diversity and unforgettable food has made Queens one of the greatest places in the world to live, and a must-see for US and World citizens alike.'.html_safe,
  x: 40.743,
  y: -73.922
)

queens.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/queens/queens_graffiti.JPG"))
queens.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/queens/queens_mets.jpg"))
queens.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/queens/queens.jpg"))
queens.save!

concord = ethan.post.blips.create!(
  x: 43.206,
  y: -71.547,
  title: 'Concord NH',
  body: 'A subtle, yet fantastic town in the heart of NH.  NH is flat out best at being NH.  And it doens\'t need to be anything else.  NH is a blethera of kind people, scenic nature, and classic New England Culture, and my personal haven when the concrete jungle becomes oppressive.'.html_safe
)

concord.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/concord/concord_castros.jpg"))
concord.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/concord/concord.jpg"))
concord.save!

medellin = ethan.post.blips.create!(
  title: 'Medellin Colombia',
  body: 'Without a question, Paisas, (the inhabitants of Medellin) are the friendliest people I\'ve come across in all my travels.  In Christmas this wonderland takes on a purple tint, and the entire city lights up as every home dons lights.  Built in the bottom of a valley, every view is spectacular, the city runs up from the river into the walls of the valley that is not to be missed.'.html_safe,
  x: 6.242,
  y: -75.59,
)

medellin.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/medellin/medellin_itigui.JPG"));
medellin.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/medellin/medellin_night.JPG"));
medellin.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/medellin/medellin_plane.JPG"));
medellin.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/medellin/medellin.jpg"));
medellin.save!

bogota = ethan.post.blips.create!(
  title: 'Bogota Colombia',
  body: 'The Capital and heart of business in Colombia, Bogoat boasts a massive sprawling population of over 9 million inhabitants.  Bogota is a great window into the lives of everyday Colombians, their joy, dance, activism and struggle.'.html_safe,
  x: 4.642,
  y: -74.082
)

bogota.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/bogota/bogota_monsarate.jpg"))
bogota.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/bogota/bogota_plaza_bolivar.jpg"))
bogota.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/bogota/bogota_candelaria.jpg"))
bogota.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/bogota/bogota_fut.jpg"))
bogota.save!

# Routes
colombia = ethan.post.routes.create!(
  title: '2015 - Colombia',
  description: 'A gonzo style adventure into the heart and fringes of this South American Gem.'
)

colombia.route_points.build( x: 4.6077624, y: -74.0745113, order: 0 )
colombia.route_points.build( x: 6.2807872, y: -75.5511055, order: 1 )
colombia.route_points.build( x: 5.1073584, y: -75.5126810, order: 2 )
colombia.route_points.build( x: 4.8564869, y: -75.6857157, order: 3 )
colombia.route_points.build( x: 4.6671150, y: -75.5951801, order: 4 )
colombia.route_points.build( x: 3.5644319, y: -76.5052577, order: 5 )
colombia.route_points.build( x: 3.7782255, y: -77.1864100, order: 6 )
colombia.route_points.build( x: 4.4904739, y: -74.1196424, order: 7 )
colombia.save!

europe = ethan.post.routes.create!(
  title: '2016 - Europe',
  description: 'Backpacking across the pond'
)

europe.route_points.build( x: 55.6895847, y: 12.5706253, order: 0 )
europe.route_points.build( x: 53.552139, y: 9.9933014, order: 1 )
europe.route_points.build( x: 52.5216526, y: 13.3855019, order: 2 )
europe.route_points.build( x: 52.3786382, y: 4.9043999, order: 3 )
europe.route_points.build( x: 48.8582776, y: 2.3507652, order: 4 )
europe.route_points.build( x: 47.3725471, y: 8.5380592, order: 5 )
europe.route_points.build( x: 46.8667638, y: 8.642395, order: 6 )
europe.route_points.build( x: 46.4548893, y: 11.3274536, order: 7 )
europe.route_points.build( x: 47.4503798, y: 18.9975586, order: 8 )
europe.save!

if Rails.env.development? || Rails.env.test?
  # Create Dummy Users
  10.times do |n|
    name  = "Owen-#{n+1}"
    email = "owen-#{n+1}@coen.org"
    password = "japan123"
    owen = User.create!(
      name:  name,
      email: email,
      password: password,
      password_confirmation: password,
      activated: true,
      activated_at: Time.zone.now
    )

    owen.post = Post.create(
      title:  "hello there, im Owen-#{n+1}",
      body:   "cout driftmap-#{n+1}",
      init_x: 26.549222577692,
      init_y: -83.0126953125,
      init_zoom: 4
    )
  end
end