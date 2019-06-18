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

User.create(
  email: 'tristanviney@gmail.com',
  encrypted_password: '9riYfzTwg2nFWVeiXkV@TMdj@hm@.hQvBt',
  admin: true
)

puts 'Seeds successfully created!'
