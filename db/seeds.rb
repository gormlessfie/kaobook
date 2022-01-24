# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do |count|
  u = User.create!(username: "jimbo#{count}", email: "jimbo#{count}@jimbo", password: '123123', password_confirmation: '123123', confirmed_at: Time.now)
  u.create_profile

  u.profile.create_detail
  u.profile.detail.create_name(fname: "jimbo#{count}", lname: "bean#{count}")
  u.profile.detail.create_age(dob: Date.today)
  u.profile.detail.create_location(address: "#{count} street", country: 'USA', state: 'California', zip: '94579', city: 'Oakland')
  u.profile.detail.create_contact_information(phone_number: '510-123-4579')
  u.profile.detail.create_gender(gender: 'non-binary')

  3.times do |p_times|
    u.posts.create(body: "This is post # #{p_times + 1}. This is a test post.")
  end
end
