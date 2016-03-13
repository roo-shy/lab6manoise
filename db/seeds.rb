User.create username: "kacie", password: "12345678"

30.times do
user = User.create username: Faker::Internet.user_name, password: "password", password_confirmation: "password"
end

20.times do
  user = User.all.sample
  created_at = [*1..30].sample.days.ago
  Manoise.create user: user, content: Faker::Hacker.say_something_smart, created_at: created_at, updated_at: created_at
end
