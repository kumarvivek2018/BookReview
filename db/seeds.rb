# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Reviewer.destroy_all
Book.destroy_all
Note.destroy_all

books_data = [
    {name: "Eloquent Ruby", author: "Russ Olsen"},
    {name: "Beginning Ruby", author: "Peter Cooper"},
    {name: "Metaprogramming Ruby 2", author: "Paolo Perrotta"},
    {name: "Design Patterns in Ruby", author: "Russ Olsen"},
    {name: "The Ruby Programming Language", author: "Daving Flanagan"}
  ]

100.times{|index| books_data << {name: "Book #{index}", author: "Author #{index}"}}

notes_data = [
    {title: "Wow", note: "Great book to learn Ruby"},
    {title: "Funny", note: "Doesn't put you to sleep"}
  ]

25.times {|index| notes_data << {title: "Title #{index}", note: "Note #{index} content"}}

reviewers = Reviewer.create!([
    {name: 'Vivek', username: 'vivek', password: 'viv123'},
    {name: 'Sandy', username: 'sandy', password: 'san123'}
  ])

books_data.each do |book_data|
  reviewer = reviewers.sample
  book = reviewer.books.create!(book_data);
  book.notes.create!(notes_data)
end
