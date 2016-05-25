# Create Pansy Accounts
if Rails.env.production?
  u = User.create!( name:     'ethan',
                email:    'e.ozelius@gmail.com',
                password: 'password',
                password_confirmation: 'password',
                activated: true,
                activated_at: Time.zone.now,
                admin: true )

  p = Post.create(
    title:  "cout << driftmap",
    body:   "Another computer hacker trying to get some sunshine",
    init_x: -73,
    init_y: 42,
    init_zoom: 13
  )

  u.post = p
end

if Rails.env.development? || Rails.env.test?
  # Create Dummy Users
  76.times do |n|
    name  = "Simon Heizen-#{n+1}"
    email = "SHeizen-#{n+1}@gubenheimen.org"
    password = "japan123"
    new_user = User.create!(name:  name,
                            email: email,
                            password:              password,
                            password_confirmation: password,
                            activated: true,
                            activated_at: Time.zone.now)

    p = Post.create(title:  "Title #{n+1}",
                    body:   "Body #{n+1}",
                    init_x: -73,
                    init_y: 42,
                    init_zoom: 13 )

    new_user.post = p
  end

  # Create Admin user for Production
  ethan = User.create!( name:     'ethan',
                        email:    'e.ozelius@gmail.com',
                        password: 'password',
                        password_confirmation: 'password',
                        activated: true,
                        activated_at: Time.zone.now,
                        admin: true )

  p = Post.create(title: 'medellin, Colombia',
                  body:  'home of paisas',
                  init_x: 6.24004981715641,
                  init_y: -75.5632781982422,
                  init_zoom: 13 )
  ethan.post = p
end
