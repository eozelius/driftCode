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
  gps: 'Sunnyside ny'
)

# Create driftmap for ethan
ethan.post = Post.create(
  title:  "./driftmap",
  body:   "just a computer hacker trying to get some fresh air",
  init_x: 26.549222577692,
  init_y: -83.0126953125,
  init_zoom: 4
)

# Build my 4 Posts to be site default
queens = ethan.post.blips.create!(
  title: 'Sunnyside Queens',
  body: '7 train',
  x: 40.743,
  y: -73.922
)

concord = ethan.post.blips.create!(
  x: 43.206,
  y: -71.547,
  title: 'Concord NH',
  body: 'born and raised.',
)

medellin = ethan.post.blips.create!(
  title: 'Medellin Colombia',
  body: 'asdf',
  x: 6.242,
  y: -75.59,
)

# Bogota
bogota = ethan.post.blips.create!(
  title: 'Bogota Colombia',
  body: 'fdsa',
  x: 4.642,
  y: -74.082
)

bogota_blip_image = BlipImage.new
bogota_blip_image.image = File.open("#{Rails.root}/app/assets/images/blip_images/bogota.jpg")
bogota_blip_image.blip_id = bogota.id
bogota_blip_image.save!

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