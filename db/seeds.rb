User.create!(name:  "Simon Heizen",
             email: "SHeizen@gubenheimen.org",
             password:              "japan123",
             password_confirmation: "japan123")

99.times do |n|
  name  = "Simon Heizen"
  email = "SHeizen-#{n+1}@gubenheimen.org"
  password = "japan123"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end