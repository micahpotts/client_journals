# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Provider.destroy_all
Client.destroy_all
JournalEntry.destroy_all

doctor1 = Provider.create(name: "Dr. Feelgood", email: "motley@crue.com")
doctor2 = Provider.create(name: "Dr. Who", email: "who@tardis.com")
p "Created #{Provider.count} providers"

client1 = Client.create(name: "Human Person", email: "me@my.email", plan: "basic")
client2 = Client.create(name: "Peter Parker", email: "spidey@sense.com", plan: "premium")
p "Created #{Client.count} clients"

JournalEntry.create(text: "I saw the doctor today and I'm a human", clients_id: client1.id)
JournalEntry.create(text: "I got bitten by a spider and it hurts", clients_id: client2.id)
JournalEntry.create(text: "There's a snake in my boot!", clients_id: client2.id)
p "Created #{JournalEntry.count} journal entries"

doctor1.clients << [client1]
client2.providers << [doctor1, doctor2]
p "Assigned doctors #{client2}"
