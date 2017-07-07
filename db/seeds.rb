require 'open-uri'

ethan = User.create(
  first_name: 'ethan',
  last_name: 'ozelius',
  email:    'e.ozelius@gmail.com',
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf',
  activated: true,
  activated_at: Time.zone.now,
  admin: true,
  from: 'concord new hampshire',
  gps: 'queens new york',
  profile_pic: File.open( "#{Rails.root}/ethans_manifest/profile.JPG" )
)

ethan.save

# Create driftmap for ethan
ethans_driftmap = ethan.driftmap = Driftmap.create(
  title:  "adventures of a Drifting Gonzo Nomad",
  body:   "just a computer hacker trying to get some more sunshine.",
  init_x: 0.924206230200376,
  init_y: -34.2400771379471,
  init_zoom: 2,
)

ethans_driftmap.save


sa = ethan.driftmap.journeys.create!(
  title: 'South America',
  description: 'Buy the ticket, take the ride.',
  coverphoto: File.open("#{Rails.root}/ethans_manifest/south_america/journey_coverphoto.jpg"),
  x: 4.6077624,
  y: -74.0745113
)
sa.save!

colombia_1 = sa.waypoints.create!(
  title: 'Colombia',
  body: 'We arrived late in Bogota.  I wasn\'t sure what to expect.',
  x: 4.6077624,
  y: -74.0745113,
  date: DateTime.new(2014, 5, 27),
  coverphoto: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/colombia/waypoint_coverphoto.jpg")
)
colombia_1.save!

colombia_1_gallery = colombia_1.galleries.create!(
  title: 'Colombia',
  description: 'Compilation of photos I took while in Colombia',
  coverphoto: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/colombia/galleries/gallery_1/gallery_coverphoto.jpg"),
  x: 4.6077624,
  y: -74.0745113
)
colombia_1_gallery.save!

colombia_1_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/colombia/galleries/gallery_1/gallery_1.jpg"))
colombia_1_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/colombia/galleries/gallery_1/gallery_2.jpg"))
colombia_1_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/colombia/galleries/gallery_1/gallery_3.jpg"))
colombia_1_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/colombia/galleries/gallery_1/gallery_4.jpg"))
colombia_1_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/colombia/galleries/gallery_1/gallery_5.jpg"))
colombia_1_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/colombia/galleries/gallery_1/gallery_6.jpeg"))
colombia_1_gallery.save!

colombia_1_essay_1 = colombia_1.essays.create!(
  title: 'Buy the ticket, take the ride',
  body: 'The year was 2013, I was an overeager and intoxicated dweeb and new-comer to new york city.  Trying to piece together an existence at Queens College, flipping coffee at a coffeeshop, and an extremely stunted understanding of the female gender.  <br>  I\'m sure the idea arose one night while Ricardo and I were downing trashy beer, and passing a joint.  The plan was to somehow land in Rio de Janeiro for the upcoming world cup of soccer.  America\'s spectacle of posh men falling for no reason, and the world\'s single united pastime.  In those days, Ricardo and I were living on around $1500 a month, and money was always tight especially since neither of us would consider reducing our beer and marijuana budgets.  So we opted for Bogota Colombia, instead, and would travel around the northwestern region of South America, visiting also Ecuador, Peru and Panama.',
  x: 4.6077624,
  y: -74.0745113,
  coverphoto: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/colombia/essays/essay_1/essay_coverphoto.jpg")
)
colombia_1_essay_1.save!

colombia_1_essay_2 = colombia_1.essays.create!(
  title: 'Learning Spanish in 24 Hours.',
  body: 'The night before we left, as any intelligent virgin traveler would, I thought it was about time to start picking up Spanish.  I asked Ricardo, who is very decent at Spanish, how to order a few tacos and a jarrito from a truck near sutphin blvd in Jamaica Queens.  That would be close to the extent of my Spanish speaking abilities until I would return to Colombia alone a year later. <br>  We arrived late in Bogota, and took a taxi to our hostel.  From the taxi window, I took it the nighttime Bogota scenery, which is sometimes vibrant, sometimes frightening.  As I listened with intent confusion as Ricardo chatted with the taxi driver, I was nervous, although probably not as much as I should have been, at the scrappy ongoings outside the cab.  It is not uncommon to see stray dogs, and bums rummaging through trash near Candelaria at night.  From the hostel we trekked a few block downhill toward the main street running through la Candelaria, where to the delight of a storeowner and jeering geezers, I ordered some empanadas and water in my stunted Spanish.  On this night and throughout most of the trip, I didn\'t bother with questions of why I was there or what there was to be learned.  At times I felt like a conquistador, invading a country and flashing wealth to people with none, but for the most part I just was away from home for a few weeks and trying to enjoy myself.  La Candelaria is the old town in Bogota, and not a good representation of the lives of normal Colombians.  The streets are made of brick, the buildings are Spanish style adobe painted vibrantly, and large graffiti murals are common.  We would spend almost all our time in Colombia in this neighborhood, while there is plenty of entertainment and happenings in La Candelaria, we stayed mostly to ourselves and our tourist colleagues.',
  x: 4.6077624,
  y: -74.0745113,
  coverphoto: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/colombia/essays/essay_2/essay_coverphoto.jpg")
)
colombia_1_essay_2.save!

colombia_1_essay_3 = colombia_1.essays.create!(
  title: 'Zipaquira',
  body: 'One day while in Bogota, we took a day trip to a pueblo an hour outside Bogota called Zipaquira, which is a common destination, and time capsule of a slower Spanish pueblo.  A place best spent lazily spending an afternoon, sitting in the shade of a cafe on the main plaza, watching malditos chase birds, or families strutting in their Sunday\'s best.  Zipaquira\'s main attraction is a cathedral that was built many years ago in an underground salt mine.  Elaborately and extravagantly lit, it is surely a pleasure to learn how it was constructed, or how important Catholicism is to the Colombian People.  However, Ricardo and I were ignorant and preferred to spend our pesos on aguardiente, so we balked at a 35,000 peso (10-15 dollar) admittance fee.  We didn\'t waste the whole afternoon fortunately, as we wandered around a quiet town, eating ice cream making friends with stray dogs, and playing in a small maze built for children.  Not my most sensical, or culturally responsible moment.  We had lunch and took photos of the ancient looking buildings and people, inevitably coming to the center plaza where we spent the afternoon watching children harass well-to-do animals, and merchants peddle ice cream and sweets.  On the way back to Bogota we got caught in a terrible rain storm and it\'s frankly a miracle we found our bus.',
  x: 4.6077624,
  y: -74.0745113,
  coverphoto: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/colombia/essays/essay_3/essay_coverphoto.jpg")
)
colombia_1_essay_3.save!

colombia_1_friend_1 = colombia_1.friends.create!(
  first_name: 'Ricardo',
  last_name: 'Alberto',
  description: 'I remember vividly sitting with Ricardo at whoever\'s house Ricardo was squatting at, at the time.  World cup 2014 was in Brazil, and we were searching for flights to South America.  We immediately realized that $1500 was well beyond the means of two broke students and part-time baristas.  In the end we settled on Colombia, Bogota as a starting for our South American adventures.  Eventually visiting Ecuador, Peru, Machu Picchu, and Panama.  We were determined to drum up our own world cup.',
  x: 4.6077624,
  y: -74.0745113,
  photo: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/colombia/friends/friend_1/friend_coverphoto.jpg")
)
colombia_1_friend_1.save!

=begin
colombia = ethan.driftmap.journeys.create!(
  title: '2015 - Colombia',
  description: 'A Digital Nomad trek, laced with Gonzo adventure into the heart and cities of Colombia.',
  coverphoto: File.open("#{Rails.root}/ethans_photos/2015_colombia/coverphoto.jpg"),
  x: 4.6077624,
  y: -74.0745113
)

bogota = colombia.waypoints.create!(
  title: 'bogota',
  body: 'The Capital and largest city in Colombia, Bogota is home to more than 9 million.  The majority of my time I spent in Chapinero, a neighborhood to the north of the old town, tucked in the foot of the massive mountains that overlook the city, and give Bogota it\'s rainy climate.  My days in Bogota were sometimes energetic, sometimes dreary but always informative.  As the first city I would visit, I dove and stumbled headfirst into the language and culture of Colombians.  Bogota was my introduction into the lives, dance, and struggle everyday Colombians; ground zero for my nomadic travels, where I learned the fundamentals of Spanish and the only logical place to start my journey'.html_safe,
  x: 4.6077624, 
  y: -74.0745113,
  date: DateTime.new(2015, 9, 7),
  coverphoto: File.open("#{Rails.root}/ethans_photos/2015_colombia/bogota_coverphoto.jpg")
)
bogota.save

bogota_gallery = bogota.galleries.create!(
  title: 'bogota gallery',
  description: 'bogota gallery',
  coverphoto: File.open("#{Rails.root}/ethans_photos/2015_colombia/bogota_gallery_coverphoto.jpg"),
  x: 4.6077624, 
  y: -74.0745113
)

bogota_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_photos/2015_colombia/gallery_1.jpg"))
bogota_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_photos/2015_colombia/gallery_2.jpg"))
bogota_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_photos/2015_colombia/gallery_3.jpg"))
bogota_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_photos/2015_colombia/gallery_4.jpg"))
bogota_gallery.save!

philip = bogota.friends.create!(
  first_name: 'Philip',
  last_name: '',
  email: '',
  photo: open('https://scontent.fbed1-1.fna.fbcdn.net/v/t31.0-8/13235210_1264222140273340_3589384723710979906_o.jpg?oh=4f4904b6f87a7322d410c80cc63ea1cc&oe=59D7E23C'),
  x: 4.6077624,
  y: -74.0745113,
  member: false,
  visible: true,
  description: 'Resilience is imperative for any drifting traveler, whether mental physical or humerous the road winds and can up end you at a moments notice.  Towards the end of my virgin expedition outside of the US and separted from my friends, I felt discouraged and found myself brooding as much as sweating poolside at a hostel.  That\'s where I met a amiable German man named Philip, who immediately lifted me back up, mentally and physically.  We wandered around a sticky downtown panama city, shielding our eyes from decadence, and lowered them from poverty.  Eventually we ventured into the Hard Rock Cafe Hotel, one of the tallest building overlooking the city.  We somehow skirted security and found our way to a floor well above our paygrade, and crept up the final 20 flights of stairs to a vacant rooftop restaurant.  We owned the roof and city, indulging in photos and jokes, taking our time to peruse all the views from the top floor.  We never were captured, much less given a questioning eye.  '.html_safe,
)
philip.save

couch_surfing = bogota.essays.create!(
  title: 'A Couch Surfing life',
  body: 'Couch Surfing and the people I have met via surfing or hosting, will always have a special place in my heart.  Couchsurfing.com embodies the idea of realworld benefits only possible via an online community, on a greater scale than (in my opinion) any other website.  The community is at the same time so vast and far-flung, small and tight-knit, with diversity and common ground.  Some of my greatest friends, and most of my greatest experiences, I owe to couchsurfing.com.  My first experience surfing, came at the home of a Bogotano friend that I had hosted in my own home only a couple months before.  When I arrived at his home, where he lived with his parents, cat and dog, I was greeted (in solely Spanish of course) warmly and given all the amenitites a humble traveler could ask for.  I also arrived with less than 50 spanish words in my vocabulary, and no idea what I was supposed to do next.  Thankfully, my hosts aided me in spanish lessons, advice on the best that Colombia has to offer, and several portions the infamous Aguardiente.  In the mornings, I would have breakfast with the family, where the my friend Harold\'s mother would explain grammatical oddities of spanish, in spanish.  It was this immersion that quashed any final fears of speaking spanish, if I wanted breakfast, I asked for desayuno, when I needed to go to the embassy, I told informed family \"Tengo que ir a la embajada\!"  I am extremely thankful to my Colombian family who guided me in the first few days of my Gonzo adventure, and all the friends I have made from couchsurfing.com will always have a place to crash in my home.'.html_safe,
  x:  4.6077624,
  y: -74.0745113,
  coverphoto: open('https://www.worldwideinsure.com/travel-blog/wp-content/uploads/2013/05/couchsurfing_logo.png'),
)

couch_surfing.save
colombia.save
=end

=begin
require 'open-uri'

e = User.find_by(email: 'e.ozelius@gmail.com')

e.destroy unless e.nil?

ethan = User.create( 
  first_name: 'ethan',
  last_name: 'ozelius',
  email:    'e.ozelius@gmail.com',
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf',
  activated: true,
  activated_at: Time.zone.now,
  admin: true,
  from: 'concord new hampshire',
  gps: 'queens new york',
  profile_pic: File.open( "#{Rails.root}/ethans_photos/2015_colombia/profile.JPG" )
)

ethan.save

# Create driftmap for ethan
ethans_driftmap = ethan.driftmap = Driftmap.create(
  title:  "adventures of a Drifting Gonzo Nomad",
  body:   "just a computer hacker trying to get some more sunshine.",
  init_x: 0.924206230200376,
  init_y: -34.2400771379471,
  init_zoom: 2,
)

ethans_driftmap.save

colombia = ethan.driftmap.journeys.create!(
  title: '2015 - Colombia',
  description: 'A Digital Nomad trek, laced with Gonzo adventure into the heart and cities of Colombia.',
  coverphoto: File.open("#{Rails.root}/ethans_photos/2015_colombia/coverphoto.jpg"),
  x: 4.6077624,
  y: -74.0745113
)

bogota = colombia.waypoints.create!(
  title: 'bogota',
  body: 'The Capital and largest city in Colombia, Bogota is home to more than 9 million.  The majority of my time I spent in Chapinero, a neighborhood to the north of the old town, tucked in the foot of the massive mountains that overlook the city, and give Bogota it\'s rainy climate.  My days in Bogota were sometimes energetic, sometimes dreary but always informative.  As the first city I would visit, I dove and stumbled headfirst into the language and culture of Colombians.  Bogota was my introduction into the lives, dance, and struggle everyday Colombians; ground zero for my nomadic travels, where I learned the fundamentals of Spanish and the only logical place to start my journey'.html_safe,
  x: 4.6077624, 
  y: -74.0745113,
  date: DateTime.new(2015, 9, 7),
  coverphoto: File.open("#{Rails.root}/ethans_photos/2015_colombia/bogota_coverphoto.jpg")
)
bogota.save

bogota_gallery = bogota.galleries.create!(
  title: 'bogota gallery',
  description: 'bogota gallery',
  coverphoto: File.open("#{Rails.root}/ethans_photos/2015_colombia/bogota_gallery_coverphoto.jpg"),
  x: 4.6077624, 
  y: -74.0745113
)

bogota_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_photos/2015_colombia/gallery_1.jpg"))
bogota_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_photos/2015_colombia/gallery_2.jpg"))
bogota_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_photos/2015_colombia/gallery_3.jpg"))
bogota_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_photos/2015_colombia/gallery_4.jpg"))
bogota_gallery.save!

philip = bogota.friends.create!(
  first_name: 'Philip',
  last_name: '',
  email: '',
  photo: open('https://scontent.fbed1-1.fna.fbcdn.net/v/t31.0-8/13235210_1264222140273340_3589384723710979906_o.jpg?oh=4f4904b6f87a7322d410c80cc63ea1cc&oe=59D7E23C'),
  x: 4.6077624,
  y: -74.0745113,
  member: false,
  visible: true,
  description: 'Resilience is imperative for any drifting traveler, whether mental physical or humerous the road winds and can up end you at a moments notice.  Towards the end of my virgin expedition outside of the US and separted from my friends, I felt discouraged and found myself brooding as much as sweating poolside at a hostel.  That\'s where I met a amiable German man named Philip, who immediately lifted me back up, mentally and physically.  We wandered around a sticky downtown panama city, shielding our eyes from decadence, and lowered them from poverty.  Eventually we ventured into the Hard Rock Cafe Hotel, one of the tallest building overlooking the city.  We somehow skirted security and found our way to a floor well above our paygrade, and crept up the final 20 flights of stairs to a vacant rooftop restaurant.  We owned the roof and city, indulging in photos and jokes, taking our time to peruse all the views from the top floor.  We never were captured, much less given a questioning eye.  '.html_safe,
)
philip.save

couch_surfing = bogota.essays.create!(
  title: 'A Couch Surfing life',
  body: 'Couch Surfing and the people I have met via surfing or hosting, will always have a special place in my heart.  Couchsurfing.com embodies the idea of realworld benefits only possible via an online community, on a greater scale than (in my opinion) any other website.  The community is at the same time so vast and far-flung, small and tight-knit, with diversity and common ground.  Some of my greatest friends, and most of my greatest experiences, I owe to couchsurfing.com.  My first experience surfing, came at the home of a Bogotano friend that I had hosted in my own home only a couple months before.  When I arrived at his home, where he lived with his parents, cat and dog, I was greeted (in solely Spanish of course) warmly and given all the amenitites a humble traveler could ask for.  I also arrived with less than 50 spanish words in my vocabulary, and no idea what I was supposed to do next.  Thankfully, my hosts aided me in spanish lessons, advice on the best that Colombia has to offer, and several portions the infamous Aguardiente.  In the mornings, I would have breakfast with the family, where the my friend Harold\'s mother would explain grammatical oddities of spanish, in spanish.  It was this immersion that quashed any final fears of speaking spanish, if I wanted breakfast, I asked for desayuno, when I needed to go to the embassy, I told informed family \"Tengo que ir a la embajada\!"  I am extremely thankful to my Colombian family who guided me in the first few days of my Gonzo adventure, and all the friends I have made from couchsurfing.com will always have a place to crash in my home.'.html_safe,
  x:  4.6077624,
  y: -74.0745113,
  coverphoto: open('https://www.worldwideinsure.com/travel-blog/wp-content/uploads/2013/05/couchsurfing_logo.png'),
)

couch_surfing.save
colombia.save
=end



