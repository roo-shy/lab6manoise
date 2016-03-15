
User.create username: "kacie", password: "12345678"

30.times do
user = User.create username: Faker::Internet.user_name, password: "password", password_confirmation: "password"
end

100.times do
  user = User.all.sample
  created_at = [*1..30].sample.days.ago

  puts user.id

  m = Manoise.create user_id: user.id, post: Faker::Hacker.say_something_smart, created_at: created_at, updated_at: created_at
  puts "++++++"
  puts m[:user_id]
  puts m[:post]
  puts " ===="

  m.save

end
