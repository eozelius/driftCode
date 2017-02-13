# Seeds for all Environments
ethan = User.create( 
  name:     'ethan',
  email:    'e.ozelius@gmail.com',
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf',
  activated: true,
  activated_at: Time.zone.now,
  admin: true,
  from: 'concord new hampshire asdf',
  gps: 'queens new york',
  profile_pic: open('https://driftmap.s3.amazonaws.com/uploads/user/profile_pic/1/IMG_20161029_192428.jpg')
)

# Create driftmap for ethan
ethan.post = Post.create(
  title:  "./driftmap",
  body:   "my adventures and travels as a drifting computer hacker.",
  init_x: 0.924206230200376,
  init_y: -34.2400771379471,
  init_zoom: 2,
)

# Journeys
colombia = ethan.post.journeys.create!(
  title: '2015 - Colombia',
  description: 'A Digital Nomad trek, laced with Gonzo adventure into the heart and cities of Colombia.'
)

# Blips
bogota = colombia.blips.create!(
  title: 'Bogota Colombia',
  body: 'The Capital and largest city in Colombia, Bogota is home to more than 9 million.  The majority of my time I spent in Chapinero, a neighborhood to the north of the old town, tucked in the foot of the massive mountains that overlook the city, and give Bogota it\'s rainy climate.  My days in Bogota were sometimes energetic, sometimes dreary but always informative.  As the first city I would visit, I dove and stumbled headfirst into the language and culture of Colombians.  Bogota was my introduction into the lives, dance, and struggle everyday Colombians; ground zero for my nomadic travels, where I learned the fundamentals of Spanish and the only logical place to start my journey'.html_safe,
  x: 4.6077624, 
  y: -74.0745113,
  date: DateTime.new(2015, 9, 7)
)

bogota.blip_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/64/20150912_152042.jpg")) # monserate
bogota.blip_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/65/20150926_121453.jpg")) # plaza
bogota.blip_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/66/20150926_113646.jpg"))
bogota.blip_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/67/20150926_143238.jpg"))
bogota.save!

medellin = colombia.blips.create!(
  title: 'Medellin - La Ciudad de la Eterna Primavera',
  body: "A majority of my time in Colombia was spent in Medellin, the city of eternal spring is renowned for it\'s beautiful weather and mujeres latinas.  A common destination for vacationers, partiers and drifters like myself, Medellin offered paradise to all.  A theory of mine, is that all the greatest cities in the world require you to climb over some garbage to get to the best parts, while this city of Paisas, like every city is not without rough sectors.  Yet almost every single trip, subway ride and party was secure and appealing.  It is unforunate that Medellin has yet again portrayed as a home of the narcos, when in reality, this city is an exemplary example of innovation in the wake of disaster.  Not only has this city become safe for citizens and travelers, it is clean, friendly and damn good fun if you can dance a little.  Without a question, Paisas, (the inhabitants of Medellin) are the friendliest people I've come across in all my travels.  In Christmas this wonderland takes on a purple tint, and the entire city lights up as every home dons lights.  Built in the bottom of a valley, every view is spectacular, the city runs up from the river into the walls of the valley that is not to be missed.".html_safe,
  x: 6.2807872, 
  y: -75.5511055,
  date: DateTime.new(2015, 11, 29)
)

medellin.blip_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/70/DSCF6360.JPG"));
medellin.blip_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/72/DSCF6082.JPG"));
medellin.blip_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/74/DSCF5895.JPG"));
medellin.blip_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/68/DSCF6097.JPG"));
medellin.blip_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/69/DSCF6110.JPG"));
medellin.blip_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/73/DSCF5947.JPG"));
medellin.blip_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/71/DSCF6184.JPG"));
medellin.save!

manizales = colombia.blips.create!(
  title: 'Manizales Colombia',
  body: 'I packed my bag in a hurry to head south to Manizales for the city Feria.  The night I arrived I instantly made friends with a dude from manizales at a salsa concert.'.html_safe,
  x: 5.1073584, 
  y: -75.5126810,
  date: DateTime.new(2016, 2, 18)
)

manizales.blip_images.create!(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/79/DSCF6410.JPG"))
manizales.blip_images.create!(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/80/DSCF6394.JPG"))
manizales.blip_images.create!(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/78/DSCF6386.JPG"))
manizales.save!

salento = colombia.blips.create!(
  title: 'Salento Colombia',
  body: 'Finally, what Colombia is famous for, the delicious coffee.  If pereira was the place where the digital nomad lifestyle left me feeling like I got hit by a car, in Salento my lack of planning left me feeling like I fell into a Volcano.  Colombias coffee zone is one of the most beautiful places I have ever visited, and staying only an afternoon is an absolute travesty.  In spite of my procrastination, I rented a bicycle and ventured into the hills above the town and it was one of the greatest rides I have ever undertaken.'.html_safe,
  x: 4.6671150, 
  y: -75.5951801,
  date: DateTime.new(2016, 2, 27)
)

salento.blip_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/88/DSCF6480.JPG"))
salento.blip_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/89/DSCF6475.JPG"))
salento.blip_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/91/DSCF6466.JPG"))
salento.blip_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/90/DSCF6470.JPG"))
salento.blip_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/87/DSCF6491.JPG"))
salento.blip_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/84/DSCF6520.JPG"))
salento.blip_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/85/DSCF6487.JPG"))
salento.blip_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/86/DSCF6500.JPG"))

salento.save!
colombia.save!

europe = ethan.post.journeys.create!(
  title: '2016 - Europe',
  description: 'Backpacking across the pond'
)

copenhagen = europe.blips.create!(
  title: 'Copenhagen Denmark', 
  body: 'I was much less anxious or nervous for this adventure, as compared to my Colombian journey. Something about being about to not only speak but Understand the language is a game-changer. Although that unforgettable jumpy, fidgety feeling that all drifters exist for never fails to accompany you as you board and exit the plane. There is a lot of beauty in travelling solo. At this moment in the first hour of my journey it is a constant ebb and flow of excitement and anxiety in regards to meeting new faces from all over, like the first day of school walking into the cafeteria, all eyes watching all the other eyes. The Danish people remind me vaguely of the Canadians, their accent is a little funny, but overall good people.'.html_safe, 
  x: 55.6895847, 
  y: 12.5706253,
  date: DateTime.new(2016, 10, 2)
)

copenhagen.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/103/DSCF6591.JPG'))
copenhagen.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/104/DSCF6580.JPG'))
copenhagen.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/102/DSCF6592.JPG'))
copenhagen.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/105/DSCF6562.JPG'))
copenhagen.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/99/two.jpg'))
copenhagen.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/101/DSCF6598.JPG'))

europe.save!

berlin = europe.blips.create(
  title: 'Berlin Germany',
  body: 'Berlin, was one of my favorite cities that I had the privledge of visiting, I also almost died while going to a club one night.  I never was a huge history buff, bit seeing not only the relics proud and somber, and talking with berliners gives a new twist on this rich city.'.html_safe,
  x: 52.5479659177324,
  y: 13.359375,
  date: DateTime.new(2016, 10, 7)
)

berlin.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/121/14709436_1182611415147266_4934580762092503040_n.jpg'))
berlin.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/121/14709436_1182611415147266_4934580762092503040_n.jpg'))
berlin.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/149/DSCF6724.JPG'))
berlin.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/150/DSCF6730.JPG'))
berlin.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/122/14723593_1708975159428584_2170602026730258432_n.jpg'))

berlin.save!

paris = europe.blips.create!(
  title: 'Paris France',
  body: 'Absinthe is one heck of a concoction.'.html_safe,
  x: 48.8827795934513,
  y: 2.2906494140625,
  date: DateTime.new(2016, 10, 15)
)

paris.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/124/paris4.jpg'))
paris.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/129/paris7.jpg'))
paris.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/130/paris6.jpg'))
paris.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/131/paris1.jpg'))
paris.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/125/paris5.jpg'))

paris.save!

switzerland = europe.blips.create!(
  title: 'Park Ela Switzerland',
  body: 'This could be the greatest place I\'ve been in the entire world. Before I embarked on this trip, I had just one thing that I knew I had to do in Europe, the rest I knew I could figure out on the way. If for whatever reason I missed out on driving a really fast (really slow in reality) car through the Swiss Alps, my journey would have been a failure. The greatest driving roads in the world are in the Alps between here and the Italian border. The hiking and other outdoors stuff is very decent as well'.html_safe,
  x: 46.2548972628291,
  y: 12.117919921875,
  date: DateTime.new(2016, 10, 22)
)

switzerland.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/133/switzerland6.JPG'))
switzerland.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/135/switzerland11.JPG'))
switzerland.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/141/switzerland1.JPG'))
switzerland.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/134/switzerland12.JPG'))
switzerland.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/136/switzerland10.JPG'))
switzerland.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/137/switzerland9.JPG'))
switzerland.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/138/switzerland8.JPG'))
switzerland.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/139/switzerland7.JPG'))
switzerland.blip_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/140/switzerland3.JPG'))

switzerland.save!

=begin
# StandAlone Blips
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

burmuda = ethan.post.blips.create!(
  x: 32.3286273,
  y: -64.7264328,
  title: 'Burmuda',
  body:  'Burmuda might be the best place in the world for a spur of the moment 3 or 4 day escape from the city.  Sometimes golf, beach, and zipping around on scooters, the preferred mode of transportation on the island, is exactly the oceanic vacation you need for 3 days.', 
)

burmuda.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/bermuda/1.jpg"))
burmuda.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/bermuda/2.jpg"))
burmuda.save!

estrella = ethan.post.blips.create!(
  x: 6.1358612,
  y: -75.6441994,
  title: 'Estrella - Antioquia',
  body: 'Estrella is a more rural pueblo on the southern outskirts of medellin where I escaped the party of downtown medellin for a moment.  It becomes evident how quickly colombia can transform from a buslingly city into a rich jungle, alive with wildlife and the most vivid vegitation imaginable.'
)

estrella.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/estrella/1.JPG"))
estrella.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/estrella/2.JPG"))
estrella.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/estrella/3.JPG"))
estrella.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/estrella/4.JPG"))
estrella.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/estrella/5.JPG"))
estrella.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/estrella/6.JPG"))
estrella.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/estrella/7.JPG"))
estrella.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/estrella/8.JPG"))
estrella.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/estrella/9.JPG"))
estrella.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/estrella/10.JPG"))
estrella.save!

laureles = ethan.post.blips.create!(
  x: 6.2450411,
  y: -75.5926666,
  title: 'las laureles - medellin',
  body: 'Laureles is one of the wealthier neighborhoods in medellin and a common destination for backpackers and students looking to avoid the gringo central of the poblado neighborhood.'
)

laureles.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/laureles/1.JPG"))
laureles.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/laureles/2.JPG"))
laureles.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/laureles/3.JPG"))
laureles.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/laureles/4.JPG"))
laureles.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/laureles/5.JPG"))
laureles.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/laureles/6.JPG"))
laureles.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/laureles/7.JPG"))
laureles.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/laureles/8.JPG"))
laureles.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/laureles/9.JPG"))
laureles.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/laureles/10.JPG"))
laureles.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/laureles/11.JPG"))
laureles.blip_images.build(image: File.open("#{Rails.root}/app/assets/images/blip_images/ethan/laureles/12.JPG"))
laureles.save!

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
=end