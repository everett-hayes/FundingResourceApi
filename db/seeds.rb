# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: 'ev@grinnell.edu', password: 'asdfasdf', password_confirmation: 'asdfasdf', is_admin: true)
User.create!(email: 'bainwala@grinnell.edu', password: 'asdfasdf', password_confirmation: 'asdfasdf', is_admin: false)

Resource.create!(source: 'everett',
    funding_name: 'any',
    description: 'any',
    amount: 'any',
    contact_person: 'any',
    web: 'any',
    eligible: 'any',
    deadline: 'any',
    is_approved: true)

    Resource.create!(source: 'himanshu',
    funding_name: 'any',
    description: 'any',
    amount: 'any',
    contact_person: 'any',
    web: 'any',
    eligible: 'any',
    deadline: 'any',
    is_approved: false)