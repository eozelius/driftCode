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
ethan.driftmap = Driftmap.create(
  title:  "./driftmap",
  body:   "just a computer hacker trying to get some more sunshine.",
  init_x: 0.924206230200376,
  init_y: -34.2400771379471,
  init_zoom: 2,
)

colombia = ethan.driftmap.journeys.create!(
  title: '2015 - Colombia',
  description: 'A Digital Nomad trek, laced with Gonzo adventure into the heart and cities of Colombia.'
)

bogota = colombia.waypoints.create!(
  title: 'bogota',
  body: 'The Capital and largest city in Colombia, Bogota is home to more than 9 million.  The majority of my time I spent in Chapinero, a neighborhood to the north of the old town, tucked in the foot of the massive mountains that overlook the city, and give Bogota it\'s rainy climate.  My days in Bogota were sometimes energetic, sometimes dreary but always informative.  As the first city I would visit, I dove and stumbled headfirst into the language and culture of Colombians.  Bogota was my introduction into the lives, dance, and struggle everyday Colombians; ground zero for my nomadic travels, where I learned the fundamentals of Spanish and the only logical place to start my journey'.html_safe,
  x: 4.6077624, 
  y: -74.0745113,
  date: DateTime.new(2015, 9, 7)
)

bogota.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/64/20150912_152042.jpg")) # monserate
bogota.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/65/20150926_121453.jpg")) # plaza
bogota.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/66/20150926_113646.jpg"))
bogota.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/67/20150926_143238.jpg"))
bogota.save!

medellin = colombia.waypoints.create!(
  title: 'medellin',
  body: "A majority of my time in Colombia was spent in Medellin, the city of eternal spring is renowned for it\'s beautiful weather and mujeres latinas.  A common destination for vacationers, partiers and drifters like myself, Medellin offered paradise to all.  A theory of mine, is that all the greatest cities in the world require you to climb over some garbage to get to the best parts, while this city of Paisas, like every city is not without rough sectors.  Yet almost every single trip, subway ride and party was secure and appealing.  It is unforunate that Medellin has yet again portrayed as a home of the narcos, when in reality, this city is an exemplary example of innovation in the wake of disaster.  Not only has this city become safe for citizens and travelers, it is clean, friendly and damn good fun if you can dance a little.  Without a question, Paisas, (the inhabitants of Medellin) are the friendliest people I've come across in all my travels.  In Christmas this wonderland takes on a purple tint, and the entire city lights up as every home dons lights.  Built in the bottom of a valley, every view is spectacular, the city runs up from the river into the walls of the valley that is not to be missed.".html_safe,
  x: 6.2807872, 
  y: -75.5511055,
  date: DateTime.new(2015, 11, 29)
)

medellin.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/70/DSCF6360.JPG"));
medellin.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/72/DSCF6082.JPG"));
medellin.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/74/DSCF5895.JPG"));
medellin.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/68/DSCF6097.JPG"));
medellin.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/69/DSCF6110.JPG"));
medellin.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/73/DSCF5947.JPG"));
medellin.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/71/DSCF6184.JPG"));
medellin.save!

laureles = colombia.waypoints.create!(
  title: 'las laureles',
  body: 'Laureles is one of the wealthier neighborhoods in medellin and a common destination for backpackers and students looking to avoid the gringo central of the poblado neighborhood.',
  x: 6.2450411,
  y: -75.5926666,
  date: DateTime.new(2015, 12, 5)
)

laureles.waypoint_images.create!(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/92/160127-115556.jpg"))
laureles.waypoint_images.create!(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/41/5.JPG"))
laureles.waypoint_images.create!(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/44/8.JPG"))
laureles.waypoint_images.create!(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/37/1.JPG"))
laureles.waypoint_images.create!(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/39/3.JPG"))

estrella = colombia.waypoints.create!(
  title: 'la estrella',
  body: 'Estrella is a more rural pueblo on the southern outskirts of Medellin where I escaped the party of downtown Medellin for a moment.  It becomes evident how quickly Colombia can transform from a busy city into a rich jungle, alive with wildlife and the most vivid vegetation imaginable.',
  x: 6.16069422425591,
  y: -75.6432723999023,
  date: DateTime.new(2016, 1, 3)
)

estrella.waypoint_images.create!(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/93/DSCF6197.JPG'))
estrella.waypoint_images.create!(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/94/DSCF6376.JPG'))
estrella.waypoint_images.create!(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/96/DSCF6207.JPG'))
estrella.waypoint_images.create!(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/98/DSCF6162.JPG'))

estrella.save!

manizales = colombia.waypoints.create!(
  title: 'manizales',
  body: 'I packed my bag in a hurry to head south to Manizales for the city Feria.  The night I arrived I instantly made friends with a dude from manizales at a salsa concert.'.html_safe,
  x: 5.1073584, 
  y: -75.5126810,
  date: DateTime.new(2016, 2, 18)
)

manizales.waypoint_images.create!(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/79/DSCF6410.JPG"))
manizales.waypoint_images.create!(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/80/DSCF6394.JPG"))
manizales.waypoint_images.create!(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/78/DSCF6386.JPG"))
manizales.save!

pereira = colombia.waypoints.create!(
  title: 'pereira',
  body: 'In Pereira, the lower points of the digital nomal lifestyle took a bit of a toll. Work was excessive and friends were few and far between. As in, I was literally the only guest at my residency.',
  x: 4.81560176379169,
  y: -75.6971740722656,
  date: DateTime.new(2016, 2, 10)
)

pereira.waypoint_images.create!(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/83/DSCF6415.JPG'))
pereira.waypoint_images.create!(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/82/DSCF6458.JPG'))
pereira.waypoint_images.create!(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/81/DSCF6434.JPG'))

salento = colombia.waypoints.create!(
  title: 'salento',
  body: 'Finally, what Colombia is famous for, the delicious coffee.  If pereira was the place where the digital nomad lifestyle left me feeling like I got hit by a car, in Salento my lack of planning left me feeling like I fell into a Volcano.  Colombias coffee zone is one of the most beautiful places I have ever visited, and staying only an afternoon is an absolute travesty.  In spite of my procrastination, I rented a bicycle and ventured into the hills above the town and it was one of the greatest rides I have ever undertaken.'.html_safe,
  x: 4.6671150, 
  y: -75.5951801,
  date: DateTime.new(2016, 2, 27)
)

salento.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/87/DSCF6491.JPG"))
salento.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/91/DSCF6466.JPG"))
salento.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/89/DSCF6475.JPG"))
salento.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/88/DSCF6480.JPG"))
salento.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/90/DSCF6470.JPG"))
salento.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/84/DSCF6520.JPG"))
salento.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/85/DSCF6487.JPG"))
salento.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/blip_image/image/86/DSCF6500.JPG"))

salento.save!

cali = colombia.waypoints.create!(
  title: 'cali',
  body: 'tierra de salsa The weather is blazing hot',
  x: 3.434259218098,
  y: -76.5115356445312,
  date: DateTime.new(2016, 3, 15)
)

cali.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/162/20160120_154421.jpg'))
cali.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/160/20160123_192435.jpg'))
cali.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/161/20160123_182401.jpg'))
cali.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/163/20160120_154244.jpg'))
cali.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/164/20160119_195106.jpg'))
cali.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/165/20160119_181640.jpg'))

cali.save!
colombia.save!

europe = ethan.driftmap.journeys.create!(
  title: '2016 - Europe',
  description: 'Backpacking across the pond'
)

copenhagen = europe.waypoints.create!(
  title: 'copenhagen, denmark', 
  body: 'I was much less anxious or nervous for this adventure, as compared to my Colombian journey. Something about being about to not only speak but Understand the language is a game-changer. Although that unforgettable jumpy, fidgety feeling that all drifters exist for never fails to accompany you as you board and exit the plane. There is a lot of beauty in travelling solo. At this moment in the first hour of my journey it is a constant ebb and flow of excitement and anxiety in regards to meeting new faces from all over, like the first day of school walking into the cafeteria, all eyes watching all the other eyes. The Danish people remind me vaguely of the Canadians, their accent is a little funny, but overall good people.'.html_safe, 
  x: 55.6895847, 
  y: 12.5706253,
  date: DateTime.new(2016, 10, 2)
)

copenhagen.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/103/DSCF6591.JPG'))
copenhagen.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/104/DSCF6580.JPG'))
copenhagen.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/102/DSCF6592.JPG'))
copenhagen.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/105/DSCF6562.JPG'))
copenhagen.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/99/two.jpg'))
copenhagen.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/101/DSCF6598.JPG'))

copenhagen.save!
europe.save!

berlin = europe.waypoints.create!(
  title: 'berlin, germany',
  body: 'Berlin, was one of my favorite cities that I had the privledge of visiting, I also almost died while going to a club one night.  I never was a huge history buff, bit seeing not only the relics proud and somber, and talking with berliners gives a new twist on this rich city.'.html_safe,
  x: 52.5479659177324,
  y: 13.359375,
  date: DateTime.new(2016, 10, 7)
)

berlin.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/121/14709436_1182611415147266_4934580762092503040_n.jpg'))
berlin.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/121/14709436_1182611415147266_4934580762092503040_n.jpg'))
berlin.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/149/DSCF6724.JPG'))
berlin.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/150/DSCF6730.JPG'))
berlin.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/122/14723593_1708975159428584_2170602026730258432_n.jpg'))
berlin.save!

amsterdam = europe.waypoints.create!(
  title: 'amsterdam, netherlands',
  body: 'amsterdam',
  x: 52.1065051907563,
  y: 5.625,
  date: DateTime.new(2016, 10, 11)
)

amsterdam.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/157/20161016_165732.jpg'))
amsterdam.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/118/14714435_307114913002993_4977066067483426816_n.jpg'))
amsterdam.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/119/DSCF6774.JPG'))
amsterdam.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/152/20161015_122117.jpg'))
amsterdam.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/151/20161015_134858.jpg'))
amsterdam.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/120/DSCF6775.JPG'))
amsterdam.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/153/20161015_142449.jpg'))
amsterdam.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/154/20161015_163734.jpg'))
amsterdam.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/156/20161016_152845.jpg'))

paris = europe.waypoints.create!(
  title: 'paris, france',
  body: 'Absinthe is one heck of a concoction.'.html_safe,
  x: 48.8827795934513,
  y: 2.2906494140625,
  date: DateTime.new(2016, 10, 15)
)

paris.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/124/paris4.jpg'))
paris.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/131/paris1.jpg'))
paris.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/127/paris10.JPG'))
paris.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/126/paris9.JPG'))
paris.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/125/paris5.jpg'))
paris.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/128/paris8.JPG'))
paris.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/129/paris7.jpg'))
paris.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/130/paris6.jpg'))
paris.save!

switzerland = europe.waypoints.create!(
  title: 'park ela, Switzerland',
  body: 'This could be the greatest place I\'ve been in the entire world. Before I embarked on this trip, I had just one thing that I knew I had to do in Europe, the rest I knew I could figure out on the way. If for whatever reason I missed out on driving a really fast (really slow in reality) car through the Swiss Alps, my journey would have been a failure. The greatest driving roads in the world are in the Alps between here and the Italian border. The hiking and other outdoors stuff is very decent as well'.html_safe,
  x: 46.2548972628291,
  y: 12.117919921875,
  date: DateTime.new(2016, 10, 22)
)

switzerland.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/133/switzerland6.JPG'))
switzerland.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/135/switzerland11.JPG'))
switzerland.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/141/switzerland1.JPG'))
switzerland.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/134/switzerland12.JPG'))
switzerland.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/136/switzerland10.JPG'))
switzerland.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/137/switzerland9.JPG'))
switzerland.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/138/switzerland8.JPG'))
switzerland.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/139/switzerland7.JPG'))
switzerland.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/blip_image/image/140/switzerland3.JPG'))
switzerland.save!