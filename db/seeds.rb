# Create Pansy Accounts
if Rails.env.production?
  User.create!( name:     'ethan',
              email:    'e.ozelius@gmail.com',
              password: 'password',
              password_confirmation: 'password',
              activated: true,
              activated_at: Time.zone.now,
              admin: true )
end

if Rails.env.development? || Rails.env.test?
  76.times do |n|
    name  = "Simon Heizen-#{n+1}"
    email = "SHeizen-#{n+1}@gubenheimen.org"
    password = "japan123"
    User.create!(name:  name,
                 email: email,
                 password:              password,
                 password_confirmation: password,
                 activated: true,
                 activated_at: Time.zone.now)
  end

  # Create Admin user for Production
  User.create!( name:     'ethan',
                email:    'e.ozelius@gmail.com',
                password: 'password',
                password_confirmation: 'password',
                activated: true,
                activated_at: Time.zone.now,
                admin: true )
end
