require 'open-uri'

=begin
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
=end

ethan = User.first
ethan.driftmap.title = 'Just a drifting gonzo hacker, trying to get more sunshine.'
ethan.driftmap.journeys.each { |j| j.destroy! }
ethan.driftmap.save!
ethan.save!

# Create driftmap for ethan
=begin
ethans_driftmap = ethan.driftmap = Driftmap.create(
  title:  'adventures of a Drifting Gonzo Nomad',
  body: 'just a computer hacker trying to get some more sunshine.',
  init_x: 0.924206230200376,
  init_y: -34.2400771379471,
  init_zoom: 2,
)

ethans_driftmap.save

=end


sa = ethan.driftmap.journeys.create!(
  title: 'Buy the ticket, take the ride',
  description: 'My premier journey outside my home country, backpacking through the cities and jungles of Northwestern South America.  <br/><br/>I left an ignorant indignant man, uncomfortable with my human existence. <br/><br/>Along the way I breezed through the wonders of travelling and raged through the lows. I learned about myself and how I fit into this strange Earth.  <br/><br/>In the end I returned the same man, only a little calmer and with a taste for travel.',
  coverphoto: File.open("#{Rails.root}/ethans_manifest/south_america/journey_coverphoto.jpg"),
  x: 4.6077624,
  y: -74.0745113
)
sa.save!

colombia_1 = sa.waypoints.create!(
  title: 'Colombia',
  body: ' Colombia was the best launching pad for this journey, and many others in my world drifting.  Colombia is like traveling in general, in that neither are without their flaws, but if you stick with it, you\'ll be rewarded; and then possibly smashed back into submission.  At times the road can kick you while you\'re down, and you\'ll wonder why the hell you didn\'t just go visit a lake near you\'re home upstate.  <br/><br/> But Bogota is real, the city is a window into the normal and prolific lives of regular Colombians, with their faults and feats, danger and dancing, rainy boring days and majestic outbursts of life.  If you stick with it, Bogota will embrace and accept you, and it can become a home away from home if you allow it.',
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
  body: 'I was an overeager, intoxicated dweeb, with an extremely stunted understanding of the female gender.  The year was 2013, and I had just landed in New York City, attempting to piece together an existence studying, flipping coffee and getting myself into whatever trouble I could find. <br/><br/>  A pastime of mine in those days, was to sit on my roof with my best friend Ricardo while passing a joint and listen to his stories of adventure abroad.  We covered everything from admiring mountain ranges in Thailand, to hallucinogenic Parisian absinthe, to outsmarting police in Germany.  I suppose it was only a matter of time before I would find myself a cog in one of these journeys. <br/><br/>  The plan was to fly to Rio de Janeiro for the upcoming futbol world cup, our Earth’s united pastime, and the United State’s idea of posh men flailing for no reason.  Our plan was flawless, except for a single point of failure that we were both dead broke.  Just a flight to Rio would have costed us a month’s income, and we wouldn’t dream of cutting back on our fiscal beer and marijuana budgets.  We would not be deterred or sobered by this, as opted to begin our journey in Bogota Colombia for a much more reasonable rate, that left plenty of flexibility for Aguardiente and Agile.  After Colombia, we would backpack around the Northwestern region of South America, visiting Ecuador, Peru and a short stay in Panama.  This is the story of all the majest and debauchery of my first voyage outside my home country.',
  x: 4.6077624,
  y: -74.0745113,
  coverphoto: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/colombia/essays/essay_1/essay_coverphoto.jpg")
)
colombia_1_essay_1.save!

colombia_1_essay_2 = colombia_1.essays.create!(
  title: ' Learning Spanish in 20 hours. Or 2 years.',
  body: ' As any intelligent virgin traveler would, I figured it was about time to start honing my Spanish skills, 20 hours before our flight to Bogota.  My wrestling match with the Spanish language began at a taco truck in Jamaica Queens.  The dialogue went something like as follows: <br/><br/> ETHAN:  Hey Ricardo, how do you ask for a chicken taco in Spanish? <br/><br/>  RICARDO: Tell him: \'Yo quiero un taco de pollo\' <br/><br/> ETHAN: (speaking to taco man) Estoy un de taco de pollo. <br/><br/>  TACOMAN: (in english) Yeah sure man, you want red sauce or green sauce? <br/><br/> ETHAN: Verde!  I mean, green! <br/><br/>  TACOMAN: (switches to Spanish) Algo a tomar? (Translation: anything to drink?) <br/><br/> ETHAN: What, huh? <br/><br/> RICARDO: He asked you if you want anything to drink dude! <br/><br/> ETHAN: Yo quiero un Harrito! <br/><br/>  TACOMAN: (slightly more confused than annoyed) You mean a Jarrito? <br/><br/> ETHAN: Yeah that. <br/><br/> TACOMAN: Alright what kind? <br/><br/> ETHAN: Lime!  I mean, Limon.  Lo siento. <br/><br/> My expertise of the Spanish language would remain more or less at a toddler’s level for the entirety of my trip, and would lead to some hilarious and embarrassing encounters for all parties involved.  I remember asked a lot of people what time it was, in Spanish, and then checking the time for myself since I didn\'t understand a single syllable of the response.  I also remember apologizing a lot in Spanish, not sure how much that speaks to a timid character, or how out of place I was. <br/><br/> After many awkward situations and more than a few unintentional insults, I would drastically improve my Spanish to a conversational level.  The trick that finally improved my Spanish, surprisingly was actually trying to learn the language. ',
  x: 4.6077624,
  y: -74.0745113,
  coverphoto: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/colombia/essays/essay_2/essay_coverphoto.jpeg")
)
colombia_1_essay_2.save!

colombia_1_essay_3 = colombia_1.essays.create!(
  title: 'Landing In Bogota',
  body: 'The neighborhood La Candelaria in Bogota is where the city of Bogota humbly began.  It sits in the shadow of the towering Andes mountains, and experiences frequent rain as the mountains to the East impede any clouds and dump any moisture upon the city.  La Candelaria is the old town, cobblestone streets wind and bend without much motor vehicle safety for pedestrians on either sidewalk.  Old Architecture style buildings are painted in beautiful pastel, which almost veil the steel bars over all the windows.  La Candelaria is dense with hostels, museums, restaurants and home to a couple of the most prestigious universities in Colombia, and so Candelaria is protected and a safe neighborhood for all.  The barrios, or neighborhoods surrounding La Candelaria on almost all sides are a different story entirely. <br/><br/>  We arrived late in Bogota, and took a taxi to our hostel.  I listened with intense confusion as Ricardo chatted with the taxi driver, probing for hints of the safety of Bogota, as well as the best way to find the nearest wild party.   I Took in the nighttime scenery as we drove through the city, I was impressed by the fantastic murals and graffiti, as well as taken aback by the scrappy ongoings.  It was a bit overwhelming to see stray dogs, and bums rummaging through trash. <br/><br/>  After checking into our hostel, Ricardo and I trekked a few steep blocks toward the main street running through La Candelaria.  We stopped in a small shop and restaurant, where to the delight of the owner and jeering geezers, I attempted to order some empanadas and water, in my fledgling Spanish.  The owner was more than happy to give me plenty of patience and pointers.  The old drunks chuckled only at my pronunciation, and without malice.  I’m sure it helped that we were paying double for the water, and buying stale pastries that would have been rightfully discarded.',
  x: 4.6077624,
  y: -74.0745113,
  coverphoto: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/colombia/essays/essay_3/essay_coverphoto.jpg")
)
colombia_1_essay_3.save!

colombia_1_essay_4 = colombia_1.essays.create!(
  title: 'Bogota in the daylight & Zipaquira',
  body: 'Our first few expeditions in Bogota were either very positive, or a little harsh, with not much in between.  The restaurants we found were delicious, but ordering in Spanish was a bit of a fiasco, fellow travelers we met were cordial, but others were rude because we were gringos.  Our first day, we wandered the streets and shops in La Candelaria, and admired Bogota from above at Monserate. <br/><br/>  Eventually we decided to take a day trip to a village and common tourist destination outside Bogota called Zipaquira.  Zipaquira is a bit of a time capsule into a previous era of Colombia, a village best enjoyed lazily spending an afternoon, sitting in the shade of a cafe on the main plaza, watching children chase birds, or families strutting in their Sunday\'s best.  Zipaquira\'s main attraction is an cathedral carved into an underground salt mine, many years ago.  Elaborately and extravagantly lit, it is a pleasure to learn how it was constructed, or how important Catholicism is to the Colombian People.  Or at least, I assume it would be, since Ricardo and I ignorantly opted to spend our pesos and braincells on aguardiente, instead of the ten dollar entrance fee. <br/><br/> While it wasn’t my most sensible or culturally responsible moment, we didn\'t waste the whole afternoon fortunately, as we wandered around the quiet town center, eating ice cream, making friends with stray dogs, and playing in a small maze built for children.   We had lunch and took photos, while Ricardo bolstered his Spanish befriending the locals.  We found our way to the village (above ground) Cathedral and main plaza, were we spent the remainder of our short time in Zipaquira, watching children harass well-to-do animals, and merchants peddling ice cream and sweets. <br/><br/> It was in Zipaquira that we experienced our first of many miracles on this trip.  We actually found our bus back to Bogota, and boarded on time.  This is particularly miraculous, given the awful rainstorm that swamped us as we attempted to escape the village. ',
  x: 4.6077624,
  y: -74.0745113,
  coverphoto: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/colombia/essays/essay_4/essay_coverphoto.jpg")
)
colombia_1_essay_4.save!

colombia_1_essay_5 = colombia_1.essays.create!(
  title: 'Tres Carnes & The Swine Brits.',
  body: 'Before I tell this story, I would like to apologize to my parents, and mentors who taught me better.  I would like to ask for forgiveness from the people of Great Britain, who have wronged me only a few times, yet don’t deserve the disdain I hold for them, based on the acts of a few.  And finally, and most importantly to Natalia and Claudia. <br/><br/> It was my final night in Bogota Colombia, where I developed a slight distaste for the Brits, in their own words I found them to be cheeky bastards.  In my experience, parties and especially dancing is extremely important to the people of Colombia, and greater South America.  A phenomenon that had been surprisingly lacking in my time in South America so far.  A few hours earlier that night, I befriended two stunning women my age at my hostel.  The first named Natalia was from Bogota, slender with rich skin and always smiling face, the second, Claudia was Brazilian with a curvy dancing toned body.  I was ecstasy and my mild was running wild, frankly it’s a wonder I didn’t sabotage the entire ordeal with one of my signature blabber mouth comments.  Natalia and Claudia were long time friends, spoke perfect english and seemed to be halfway interested in passing the time with me. <br/><br/> This is an opportune time to reiterate my ineptitude when it comes to women.  Their minds and the patterns that make them tic, are extraterrestrial to me.  Flirtation is more of a foreign language than Spanish to me.  I can’t seem to grasp what impresses woman, and what deflects them.  My small talk and actions that I believe to be admirable and interesting, are often forgettably drab at best and offensive at worst. <br/><br/> Despite my handicap, the three of us got along amiably, all the while replenishing each other’s glasses of aguardiente, and toasting to whatever seemed admirable and within reach.  A hazy number of drinks later, we ventured into the night, along with a group of 10-12 others from our hostel to an infamous bar called tres cranes, for a long night of sugarcane alcohol flavored fun and hysterical dancing.  Tres Carnes is a Charlie and the Chocolate factory like experience.  Partitioned into several halls, dance floors, concerts and restaurants, it is a wonderland of well-mannered adult fun.  The three of us toured the dance halls and bars stopping for cocktails of rum or when our favorite songs played.  Or more accurately, when one of their favorite songs came on, since I could hardly decipher differences in Spanish sentences, much less songs.  Natalia and Claudia were more than happy to show me the most basis dance steps and very patience when I botched each one.  Perhaps it is bravado or blissfully misremembering, but I recall the three of us having a wonderful time dancing sensually. <br/><br/> The night was going stellar, a perfect blend of laughing and dancing, drinking and kissing.  Although I would have been thrilled and utterly clueless to have gone home with either of my new beautiful friends, the hail-mary play of going home with both Natalia and Claudia had been stampeding in my mind for much of the night.  Chalk it up to the rum if you would like, but I suppose the possibilities were endless when one’s mind is swimming in enough music, rum and lust.  <br/><br/> I suppose I should have seen an impending doom a long way off.  I had managed to blow nearly every other similar opportunity in explosive fashion.  Things started deteriorating fast around two-thirty or three in the morning, the details of which are hazy at best.  Natalia, Claudia and I got separated at some point and since I knew we all would have to catch a long bus back to La Candelaria, I searched for the restroom.  I found them a short time later, but to my heartbreaking dismay they were 3 confirmed douchebag flamboyantly dressed circle-jerk British Bastards. <br/><br/> I remembered meeting the swine Brits earlier that night, they were latecomers to our group, keeping mostly to themselves.  They approached me on a friendly search for healthy cocaine.  Of course I friendlily told them to ‘find their own fucking coke’ in so many words and that I had been raised better than indulge in dangerous drugs.  While we didn’t exactly hit it off at first, the three brits and I continued chatting until they began recounting their sexual escapades while in South America.  We parted ways as soon as we all arrived at tres carnes, and I didn’t think about them again until these skunksucking heretic honkies had reappeared and were idiotically parading around Natalia and Claudia.  Their dancing was more masterbation than anything.  They seemed to ignore the music and other signs of life in the clubs except for each other and Natalia and Claudia.  The hopped like frogs twisting their arms backward and dropping down to a knee.  Now I am much more a lover than a fighter, but every fiber of my being was attempting to summon every kung-fu movie I had ever seen, so that I could release a shit-storm of heroic violence and vengeance on these godless Brits, not seen since the days of the terrible Goddess Medusa. <br/><br/> To my dismay, the Brit’s cheap facade was working much more effectively than my nuclear rage.  Blinded by rum and rage, I waited outside the bar like a poacher for Natalia and Claudia.  However, any plans I had at the time evaporated just like my plan of going home with both Natalia and Claudia.  When they left the club, Natalia was being carried honeymoon style by one of the foulest of the dog brits, and Claudia didn’t even notice me.  Even in delirium I knew I had been bested. <br/><br/> On the way back to La Candelaria, one final bottle of rum was being passed from from person to person.  Until it came to me, I drowned my sorrow and rage.  And then drowned the fuckers a few more times.  Natalia, whom I referred to as Benedict Arnold from then on, was now sitting in the lap of one of the Brits who bared a striking resemblance to a 150 pound diseased rodent.  She tried to make peace or console me.  Bitter, wasted and rude, I wasn’t in the mood for either.  I told her to beat it, in terms that could be understood in any language, and managed to string together a few of my best barrages of insults spanning 3 languages to tell the incestuous Brits exactly what I thought of them and their imperialistic miserable excuse for a country. <br/><br/> One of the last things I remember was walking off the bus in La Candelaria, still with the bottle of rum under my arm.  One of the things I don’t remember from that night, that was recounted to me by Ricardo after the fact was that when I returned to my hostel around 4:30 AM, loud and intoxicated, I refused to hold any conversation in any language other than Spanish.  In an effort to sharpen my Spanish skills of course, which surely seemed extremely important at the time.  I caused a massive commotion in the hostel.  Pacing my room and halls damning Brits everywhere while packing for a flight to Quito Ecuador that was set to take off in 5 hours. <br/><br/>',
  x: 4.6077624,
  y: -74.0745113,
  coverphoto: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/colombia/essays/essay_5/essay_coverphoto.jpg")
)
colombia_1_essay_5.save!

colombia_1_friend_1 = colombia_1.friends.create!(
  first_name: 'Ricardo',
  last_name: 'Alberto',
  description: 'I remember vividly sitting with Ricardo at whoever\'s house Ricardo was squatting at, at the time.  World cup 2014 was in Brazil, and we were searching for flights to South America.  We immediately realized that $1500 was well beyond the means of two broke students and part-time baristas.  In the end we settled on Colombia, Bogota as a starting for our South American adventures.  Eventually visiting Ecuador, Peru, Machu Picchu, and Panama.  We were determined to drum up our own world cup.',
  x: 4.6077624,
  y: -74.0745113,
  photo: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/colombia/friends/friend_1/friend_coverphoto.jpg")
)
colombia_1_friend_1.save!
colombia_1.save!
sa.save!

ecuador = sa.waypoints.create!(
  title: 'Ecuador',
  body: 'Quito and the Amazon would prove to be a change of pace to the bustle of downtown Bogota Colombia.',
  x: -0.218009422675834,
  y: -78.51190567016602,
  date: DateTime.new(2014, 6, 3),
  coverphoto: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/ecuador/waypoint_coverphoto.jpg")
)
ecuador.save!

ecuador_gallery = ecuador.galleries.create!(
  title: 'Quito and The Amazon',
  description: 'Compilation of photos I gathered from the city of Quito and the depths of the Amazon forest',
  coverphoto: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/ecuador/galleries/gallery_1/gallery_coverphoto.jpg"),
  x: -0.218009422675834,
  y: -78.51190567016602,
)
ecuador_gallery.save!

ecuador_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/ecuador/galleries/gallery_1/gallery_1.jpg"))
ecuador_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/ecuador/galleries/gallery_1/gallery_2.jpg"))
ecuador_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/ecuador/galleries/gallery_1/gallery_3.jpg"))
ecuador_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/ecuador/galleries/gallery_1/gallery_4.jpg"))
ecuador_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/ecuador/galleries/gallery_1/gallery_5.jpg"))
ecuador_gallery.save!

ecuador_essay_1 = ecuador.essays.create!(
  title: 'Hello Quito',
  body: 'After my debacle with the damned Brits, I flew to Quito Ecuador, which is partitioned into an old and new town.  In the hostel, I met an old man from Scandinavia, who had been a sailor in his day. Newly retired, he was now living in Quito.  He was a bit of a creepy old man that made you wish you had opted for a room with a lock on the door at night, but during the day a very welcoming and amiable soul.  I also met a couple from Guatemala and Miami, who had spent time in NY, we would eventually form a squad and go hiking and biking in the amazon.  And finally a wandering and adventurous soul from somewhere in northwestern Europe, who had come to come to South America to volunteer at a animal hospital and rehabilitation center that specialized in taking care of pumas, panthers and other massive jungle cats.  He told stories of working communally with people and animals, and a kung fu Jedi who could playfully wrestle and joust 300 pound cats until one time a panther became too spirited and bit most of his hand off.',
  coverphoto: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/ecuador/essays/essay_1/essay_coverphoto.jpg"),
  x: -0.218009422675834,
  y: -78.51190567016602
)
ecuador_essay_1.save!

ecuador_essay_2 = ecuador.essays.create!(
  title: 'A Ziplining Debacle and Reconciliation with God',
  body: 'A zipline mishap & reconnecting with God It\'s funny how quickly a brush with your own mortality can make you instantly reconsider your previous conclusions on the afterlife.  In Banos Ricardo and I set out into the mountains on bicycles with the couple from Guatemala and Miami.  We cruised and climbed into the amazon taking in the lush green jungle and mountains, passing 3-4 waterfalls, one that was big enough to hear from a good distance away.  We stopped for directions at one point and were deliberately told incorrect directions despite the fact that 3/4 of us were proficient in Spanish, and had neutral accents.  No matter, we arrived to the destinations we desired eventually.  Finally we reached a point at the top of a mountain range, that looked down upon a valley, and a corresponding range maybe 400-500 meters away, separated by a vast expand and a river.  Since this was Banos after all, the village where Ecuadorian travel agency\'s shoo white dreadlocked travelers who think they want to tap into their spiritual side, there is a zipline.  A zipline that threads from the larger mountain where we stood, 500 meters across an abyss, with a rushing river that seems only an drop of water running down a window from that high up, across to the other mountain.  It was never really a question of whether we would go or not, it just was.  We donned our harnesses and helmets and received our safety briefing in a language I understood 4% of.  All too soon I found myself supporting myself with my hands, secured onto the wire from my back, in a superman position.  At the time of an adventurous and dangerous event such as this, you think that you are scared, but you have no idea how petrified you are about to become when something with this contraption goes horribly wrong.  I heard the woman holding my harness in place, who would release me across mountains and into oblivion chatting rapidly into a radio to the people on the other end of the zipline, all I caught I was "Rapido!" as it started to rain slightly and the wind picked up.  The ride was monumental, screaming across the sky faster than life, the mountains passing below you like dust in the wind.  Around second 40 or 41, of a maybe 50 second trip I became dreadfully aware that my body and entire existence were going much to fast.  The casa on the other end was becoming larger than life way too rapidly.  I reached the end, and I was catapulted forward with incredible force until I was ricocheted and flung the in the direction I had come, back over the abyss of a valley.  I slowed and stopped maybe 70% of the way across the valley and due to the orientation of the harness, and superman position was forced to look all the way down to the bottom of the valley.  I saw the river a couple hundred meters below, and my intended destination limitlessly in front of me.  All my blasphemy and using the lord\'s name in vain began to weigh on me tremendously, the rain picked up even more and I was toyed back and forth on the zipline as the wind streamed through the valley and I was picked up with it.  I am not proud to admit, but I made a reconciliation with God, should the worst come to pass, and a deal if I should be set free for a while longer.  While the event was likely commonplace for the Ecuadorians who built the zipline, for me it was existential.  Starring down 250 meters while helplessly strapped into a harness unable to move or do anything other than contemplate myself and mortality.  I had no reminiscing of childhood, no flashbacks or summation of life experiences and what I would amount to.  I suppose that is evidence to the fact that I was not really that close to perishing, but at the time, I would have believed that this might be the end.  My salvation came in the more of a boy, no older than 11 years old.  He strapped himself into his own harness and pulled himself out to meet me.  He told me to hold on to his harness, which I did gratefully and he pulled me to the other side.  I survived my ziplining mishap, my reconciliation with God didn\'t last much longer than the trip back across the valley.  We hitchhiked back to town in a flatbed truck, already loaded with tired workers headed into town.',
  coverphoto: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/ecuador/essays/essay_2/essay_coverphoto.jpg"),
  x: -0.218009422675834,
  y: -78.51190567016602
)
ecuador_essay_2.save!
ecuador.save!

peru = sa.waypoints.create!(
  title: 'Peru',
  body: 'A Foggy Hike to Machu Picchu',
  x: -13.520257797795576,
  y: -71.9710922241211,
  date: DateTime.new(2014, 6, 15),
  coverphoto: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/peru/waypoint_coverphoto.jpg")
)
peru.save!

peru_gallery = peru.galleries.create!(
  title: 'Cusco and Machu Picchu',
  description: 'Exploring the streets of Cusco & hiking in Aguas Caliente.',
  coverphoto: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/peru/galleries/gallery_1/gallery_coverphoto.jpg"),
  x: -13.520257797795576,
  y: -71.9710922241211
)

peru_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/peru/galleries/gallery_1/gallery_1.jpg"))
peru_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/peru/galleries/gallery_1/gallery_2.jpg"))
peru_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/peru/galleries/gallery_1/gallery_3.jpg"))
peru_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/peru/galleries/gallery_1/gallery_4.jpg"))
peru_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/peru/galleries/gallery_1/gallery_5.jpg"))
peru_gallery.save!
peru.save!

panama = sa.waypoints.create!(
  title: 'Panama',
  body: 'Hot and Muggy, Highrises and Huts',
  coverphoto: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/panama/waypoint_coverphoto.jpg"),
  x: 8.97359290103662,
  y: -79.53329086303711,
  date: DateTime.new(2014, 6, 20)
)
panama.save!

panama_gallery = panama.galleries.create(
  title: 'Breaking & Entering at the Hard Rock Cafe',
  description: 'Wildly Illegal view dozens of floors above panama.',
  coverphoto: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/panama/galleries/gallery_1/gallery_coverphoto.jpg"),
  x: 8.97359290103662,
  y: -79.53329086303711
)
panama_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/panama/galleries/gallery_1/gallery_1.jpg"))
panama_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_manifest/south_america/waypoints/panama/galleries/gallery_1/gallery_coverphoto.jpg"))
panama_gallery.save

philip = panama.friends.create!(
  first_name: 'Philip',
  last_name: '',
  email: '',
  x: 4.6077624,
  y: -74.0745113,
  member: false,
  visible: true,
  description: 'Resilience is imperative for any drifting traveler, whether mental physical or humerous the road winds and can up end you at a moments notice.  Towards the end of my virgin expedition outside of the US and separted from my friends, I felt discouraged and found myself brooding as much as sweating poolside at a hostel.  That\'s where I met a amiable German man named Philip, who immediately lifted me back up, mentally and physically.  We wandered around a sticky downtown panama city, shielding our eyes from decadence, and lowered them from poverty.  Eventually we ventured into the Hard Rock Cafe Hotel, one of the tallest building overlooking the city.  We somehow skirted security and found our way to a floor well above our paygrade, and crept up the final 20 flights of stairs to a vacant rooftop restaurant.  We owned the roof and city, indulging in photos and jokes, taking our time to peruse all the views from the top floor.  We never were captured, much less given a questioning eye.  '.html_safe,
)
philip.save
panama.save!
sa.save!

colombia_journey = ethan.driftmap.journeys.create!(
  title: 'Life and Trials of a Digital Gonzo Nomad',
  description: 'I returned to the United State after my first South American Journey in 2015, still myself, but with a more upbeat outlook on life.  Long story short, I would drop out of Queen College and get a job as a web developer.  After a year working 9-5 in my home of Queens NY, the road began beckoning me back, as it does many drifters.  <br/><br/>I told my boss one day that I wanted to hit the road, but that I believed I still had a lot to offer the company.  I asked if he would allow me to work remotely from Colombia indefinitely, to my surprise he said \'Of course!  Go for it!\'  <br/><br/>This is the story of my 6 months I spent as A Digital Nomad, trekking all over Colombia.  I became a seasoned couch-surfer, discovered the kindness of the Colombian people, weathered countless lonely nights and danced a little along the way.',
  coverphoto: File.open("#{Rails.root}/ethans_manifest/colombia/journey_coverphoto.jpg"),
  x: 4.6077624,
  y: -74.0745113
)

bogota = colombia_journey.waypoints.create!(
  title: 'bogota',
  body: 'The Capital and largest city in Colombia, Bogota is home to more than 9 million.  The majority of my time I spent in Chapinero, a neighborhood to the north of the old town, tucked in the foot of the massive mountains that overlook the city, and give Bogota it\'s rainy climate.  My days in Bogota were sometimes energetic, sometimes dreary but always informative.  As the first city I would visit, I dove and stumbled headfirst into the language and culture of Colombians.  Bogota was my introduction into the lives, dance, and struggle everyday Colombians; ground zero for my nomadic travels, where I learned the fundamentals of Spanish and the only logical place to start my journey'.html_safe,
  x: 4.6077624, 
  y: -74.0745113,
  date: DateTime.new(2015, 9, 7),
  coverphoto: File.open("#{Rails.root}/ethans_manifest/colombia/waypoints/bogota/waypoint_coverphoto.jpg")
)
bogota.save

bogota_gallery = bogota.galleries.create!(
  title: 'bogota gallery',
  description: 'bogota gallery',
  coverphoto: File.open("#{Rails.root}/ethans_manifest/colombia/waypoints/bogota/galleries/gallery_1/gallery_coverphoto.jpg"),
  x: 4.6077624, 
  y: -74.0745113
)

bogota_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_manifest/colombia/waypoints/bogota/galleries/gallery_1/gallery_1.jpg"))
bogota_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_manifest/colombia/waypoints/bogota/galleries/gallery_1/gallery_2.jpg"))
bogota_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_manifest/colombia/waypoints/bogota/galleries/gallery_1/gallery_3.jpg"))
bogota_gallery.waypoint_images.build(image: File.open("#{Rails.root}/ethans_manifest/colombia/waypoints/bogota/galleries/gallery_1/gallery_4.JPG"))
bogota_gallery.save!

couch_surfing = bogota.essays.create!(
  title: 'A Couch Surfing life',
  body: 'Couch Surfing and the people I have met via surfing or hosting, will always have a special place in my heart.  Couchsurfing.com embodies the idea of realworld benefits only possible via an online community, on a greater scale than (in my opinion) any other website.  The community is at the same time so vast and far-flung, small and tight-knit, with diversity and common ground.  Some of my greatest friends, and most of my greatest experiences, I owe to couchsurfing.com.  My first experience surfing, came at the home of a Bogotano friend that I had hosted in my own home only a couple months before.  When I arrived at his home, where he lived with his parents, cat and dog, I was greeted (in solely Spanish of course) warmly and given all the amenitites a humble traveler could ask for.  I also arrived with less than 50 spanish words in my vocabulary, and no idea what I was supposed to do next.  Thankfully, my hosts aided me in spanish lessons, advice on the best that Colombia has to offer, and several portions the infamous Aguardiente.  In the mornings, I would have breakfast with the family, where the my friend Harold\'s mother would explain grammatical oddities of spanish, in spanish.  It was this immersion that quashed any final fears of speaking spanish, if I wanted breakfast, I asked for desayuno, when I needed to go to the embassy, I told informed family \"Tengo que ir a la embajada\!"  I am extremely thankful to my Colombian family who guided me in the first few days of my Gonzo adventure, and all the friends I have made from couchsurfing.com will always have a place to crash in my home.'.html_safe,
  x:  4.6077624,
  y: -74.0745113,
  coverphoto: File.open("#{Rails.root}/ethans_manifest/colombia/waypoints/bogota/essays/essay_1/essay_coverphoto.jpg"),
)

couch_surfing.save
bogota.save!
colombia_journey.save
sa.save!


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



