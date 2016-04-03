User.create username: "kacie", password: "12345678", image_url: "http://www.lovemarks.com/wp-content/uploads/profile-avatars/default-avatar-bad-werewolf.png"

# Seed the users
30.times do
user = User.create username: Faker::Internet.user_name, image_url: "http://www.lovemarks.com/wp-content/uploads/profile-avatars/default-avatar-bad-werewolf.png", password: "password", password_confirmation: "password"
end


# Seed the posts 'manoises'
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

  #Seed the followers?
  #
  # users = User.all
  # user  = users.first
  # following = users[2..50]
  # followers = users[3..40]
  # following.each { |followed| user.follow(followed) }
  # followers.each { |follower| follower.follow(user) }

#   all_users = User.all
#   all_users.each do |usr_follower|
#   all_users.each do |usr_followed|
#   if Number.random(1,10) < 3
#   user_follower acts_as_follower user_follower
#   end
#  end
# end
