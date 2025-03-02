User.destroy_all
Book.destroy_all
Comment.destroy_all

user = User.create!(
  email: 'siviglialucas@gmail.com',
  password: '123456',
)

user1 = User.create!(
  email: 'joe@gmail.com',
  password: '123456',
)

Book.create!(
  title: 'The Great Gatsby',
  body: 'The Great Gatsby is a 1925 novel by American writer F. Scott Fitzgerald. Set in the Jazz Age on Long Island, near New York City, the novel depicts first-person narrator Nick Carraway\'s interactions with mysterious millionaire Jay Gatsby and Gatsby\'s obsession to reunite with his former lover, Daisy Buchanan.',
  user_id: user.id
)

Book.create!(
  title: 'To Kill a Mockingbird',
  body: 'To Kill a Mockingbird is a novel by Harper Lee published in 1960. Instantly successful, widely read in high schools and middle schools in the United States, it has become a classic of modern American literature, winning the Pulitzer Prize.',
  user_id: user1.id
)

Comment.create!(
  reviews: 'This is a great book',
  user_id: user.id,
  book_id: Book.first.id
)
