# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Topic.destroy_all
Comment.destroy_all
Like.destroy_all
Vote.destroy_all

user1 = User.create({
  name: 'Dana', 
  username: 'DanaMC18', 
  password: 'password123',
  profile_pic: 'https://s-media-cache-ak0.pinimg.com/236x/ac/27/0a/ac270a6e86b61cbfb4ade530875ec7a6.jpg'
})


topic1 = Topic.create({
  title: 'Welcome', 
  content: 'Welcome to Fantastic Peeps and Where to Find Them! (hint...its here...)  
  This forum was built to bring the fantastic fans of Harry Potter together into a community of conversation, debate, and mutual interest.
  It is still a work in progress so please, be kind/gentle. And feel free to reach out with any suggestions or discovered glitches (there should be none) 
  
  -- Dana',
  user: user1
})

topic2 = Topic.create({
  title: 'About',
  content: 'This forum is a full-stack web application built by me, Dana Czinsky.  
  HTML, CSS, JavaScript/JQuery, Ruby, Sinatra, SQL/ActiveRecord were utilized in the making of this forum. 
  All text on this forum is Markdown (https://en.wikipedia.org/wiki/Markdown#Example) compatible',
  user: user1
})


comment1 = Comment.create({
  content: 'Thanks for making this sweet site, Dana!',
  user: user1,
  topic: topic1
})

comment2 = Comment.create({
  content: 'Yeah! This forum is the bee\'s knees!',
  created_at: DateTime.now,
  user: user1,
  topic: topic2
})


like1 = Like.create({
  user: user1,
  comment: comment1
})

like2 = Like.create({
  user: user1,
  comment: comment2
})


vote1 = Vote.create({
  user: user1,
  topic: topic1
})







