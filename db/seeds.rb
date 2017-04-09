# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create(name: "Administrador",
            email: "admin@admin.com",
            password: "admin",
            password_confirmation: "admin")


User.create(name: "Vicente Fuenzalida",
            email: "vjfuenzalida@uc.cl",
            password: "123123",
            password_confirmation: "123123")

User.create(name: "Diego Passi",
            email: "djpassi@uc.cl",
            password: "123123",
            password_confirmation: "123123")

User.create(name: "David Galemiri",
            email: "dagalemiri@uc.cl",
            password: "123123",
            password_confirmation: "123123")


Topic.create(name: "Trump",
            votes: "124",
            user_id: 1,
            description: "U.S. New President",
            lat: 42.7364892,
            lon: -78.0525167,weight:1)

Topic.create(name: "AFP",
            votes: "4413",
            user_id: 2,
            description: "Chilean Pension System not working as expected",
            lat: -33.4442,
            lon: -70.9100213,weight:1)

Topic.create(name: "Piscola",
            votes: "1000",
            user_id: 3,
            description: "Not that good when prepared with Diet Coke",
            lat: -34.6155729,
            lon: -58.5033605,weight:1)

Vote.create(user_id: 1, topic_id: 0)
Vote.create(user_id: 0, topic_id: 2)
Vote.create(user_id: 2, topic_id: 1)
