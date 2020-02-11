# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.destroy_all
Reviewer.destroy_all
Note.destroy_all

Book.create!([
    {name: "Eloquent Ruby", author: "Russ Olsen"},
    {name: "Beginning Ruby", author: "Peter Cooper"},
    {name: "Metaprogramming Ruby 2", author: "Paolo Perrotta"},
    {name: "Design Patterns in Ruby", author: "Russ Olsen"},
    {name: "The Ruby Programming Language", author: "Daving Flanagan"}
  ])

100.times{|index| Book.create(name: "Book #{index}", author: "Author #{index}")}

book = Book.find_by(name: "Eloquent Ruby")
book.notes.create!([
    {title: "Wow", note: "Great book to learn Ruby"},
    {title: "Funny", note: "Doesn't put you to sleep"}
  ])

reviewers = Reviewer.create!([
    {name: 'Vivek', password: 'viv123'},
    {name: 'Sandy', password: 'san123'}
  ])

Book.all.each do |book|
  book.reviewer = reviewers.sample
  book.save!
end
