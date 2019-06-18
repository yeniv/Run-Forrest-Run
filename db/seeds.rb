puts 'Wiping Tweets...'

Tweet.destroy_all

puts 'Wiping Forrest Gumps...'

ForrestGump.destroy_all

puts 'Wiping Users...'

User.destroy_all

puts 'Creating Forrest Gump...'

ForrestGump.create(
  name: 'Forrest Gump',
  distance: 0,
  route: ForrestGump.route
)

puts 'Adding most recent #runforrestrun tweet...'

Tweet.add(Tweet.find_most_recent)

puts 'Creating Tristan Viney super user...'

super_user = User.new(
  email: 'tristanviney@gmail.com',
  password: '9riYfzTwg2nFWVeiXkV@TMdj@hm@.hQvBt',
  admin: true
)

super_user.save!

puts 'Seeds successfully created!'
