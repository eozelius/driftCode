# Seeds for all Environments
ethan = User.create!( 
  name:     'ethan',
  email:    'e.ozelius@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  activated: true,
  activated_at: Time.zone.now,
  admin: true,
  from: 'concord nh',
  gps: 'Sunnyside ny',
  profile_pic: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/ethan.jpg")
)

# Create driftmap for ethan
ethan.post = Post.create(
  title:  "./driftmap",
  body:   "just a computer hacker trying to get some fresh air",
  init_x: 26.549222577692,
  init_y: -83.0126953125,
  init_zoom: 4
)

queens = ethan.post.blips.create!(
  title: 'Sunnyside Queens',
  body: 'Queens NY.  From Flushing to Astoria to Jamaica, for centuries the world has landed in Queens to embark on a new life in the United States.  The culture, diversity and unforgettable food has made Queens one of the greatest places in the world to live, and a must-see for US and World citizens alike.',
  x: 40.743,
  y: -73.922
)

queens.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/queens/queens.jpg"))
queens.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/queens/queens_graffiti.JPG"))
queens.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/queens/queens_mets.jpg"))
queens.save!

concord = ethan.post.blips.create!(
  x: 43.206,
  y: -71.547,
  title: 'Concord NH',
  body: 'A subtle, yet fantastic town in the heart of NH.  NH is flat out best at being NH.  And it doens\'t need to be anything else.  NH is a blethera of kind people, scenic nature, and classic New England Culture, and my personal haven when the concrete jungle becomes oppressive.'
)

concord.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/concord/concord.jpg"))
concord.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/concord/concord_castros.jpg"))
concord.save!

medellin = ethan.post.blips.create!(
  title: 'Medellin Colombia',
  body: 'Without a question, Paisas, (the inhabitants of Medellin) are the friendliest people I\'ve come across in all my travels.  In Christmas this wonderland takes on a purple tint, and the entire city lights up as every home dons lights.  Built in the bottom of a valley, every view is spectacular, the city runs up from the river into the walls of the valley that is not to be missed.',
  x: 6.242,
  y: -75.59,
)

medellin.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/medellin/medellin.jpg"));
medellin.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/medellin/medellin_itigui.JPG"));
medellin.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/medellin/medellin_night.JPG"));
medellin.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/medellin/medellin_plane.JPG"));
medellin.save!

bogota = ethan.post.blips.create!(
  title: 'Bogota Colombia',
  body: 'The Capital and heart of business in Colombia, Bogoat boasts a massive sprawling population of over 9 million inhabitants.  Bogota is a great window into the lives of everyday Colombians, their joy, dance, activism and struggle.',
  x: 4.642,
  y: -74.082
)

bogota.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/bogota/bogota_plaza_bolivar.jpg"))
bogota.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/bogota/bogota_candelaria.jpg"))
bogota.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/bogota/bogota_fut.jpg"))
bogota.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/bogota/bogota_monsarate.jpg"))
bogota.save!

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