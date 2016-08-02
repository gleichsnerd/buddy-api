# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u1 = User.create(first_name: "Testy", last_name: "McTesterman", email: "test@test.com", password: "password", password_confirmation: "password")
u2 = User.create(first_name: "Bob", last_name: "Ross", email: "bob@ross.com", password: "password", password_confirmation: "password")

Mailbox.create(mailbox_collection: u1.mailbox_collection)
Mailbox.create(mailbox_collection: u2.mailbox_collection)

u1.save
u2.save