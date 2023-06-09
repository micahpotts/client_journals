# README

Database and model design with queries
We want to model providers (e.g. dietitians), their clients, and journal entries.

* Both providers and clients have a name and an email address.
* Providers have many clients
* Clients usually have one Provider but can have more than one.
* Clients have a plan that they paid for, signified by the string "basic" or "premium". For each provider that a client is signed up with, they have 1 plan.
* Clients post journal entries. These consist of freeform text.
 

We want to be able to do these queries:

* Find all clients for a particular provider
* Find all providers for a particular client
* Find all of a particular client's journal entries, sorted by date posted
* Find all of the journal entries of all of the clients of a particular provider, sorted by date posted


Database creation:

* Create, migrate, and seed the database

  ```bin/rails db:create db:migrate db:seed```
 
Run the application:

  ```bin/rails server```

Postman tests:

Postman collection is located at test/ClientJournals.postman_collection.json

Once the database is created/seeded, the collection can be imported to Postman and run successfully.

Run tests:

There is a *very* small amount of testing for the controllers. This needs to be remedided and is marked in the code as TODO

  ```bin/rails test```
  
Available Routes:
```
  GET /providers    (get all providers)
  GET /providers/:id    (get provider by id)
  GET /providers/:id/clients    (get clients by provider id) 
  GET /providers/:id/journal_entries    (get all journal entries for all clients served by provider by id)
  POST /providers (create provider WITH option to add client associateions)
  PATCH /providers/:id/clients    (change clients associated with providers)
  
  GET /clients    (get all clients)
  GET /clients/:id    (get client by id)
  GET /clients/:id/providers    (get all providers by client id)
  GET /clients/:id/journal_entries    (get all of a client's journal entries)
  POST /clients   (create client WITHOUT option to add provider association)
  PATCH /clients/:id/providers    (change providers associated with clients)

  GET /journal_entries    (get all journal entries sorted by date posted)
  POST /journal_entries   (create journal entry)
```
  
IMPORTANT NOTE
This is an *API only* application and does not include Views. All responses are in json format.

RAW QUERIES
```
* Find all clients for a particular provider
   SELECT "clients".* FROM "clients" INNER JOIN "provider_assignments" ON "clients"."id" = "provider_assignments"."client_id" WHERE "provider_assignments"."provider_id" = ((provider.id))
   
* Find all providers for a particular client
   SELECT "providers".* FROM "providers" INNER JOIN "provider_assignments" ON "providers"."id" = "provider_assignments"."provider_id" WHERE "provider_assignments"."client_id" = ((client.id))

* Find all of a particular client's journal entries, sorted by date posted
   SELECT "journal_entries".* FROM "journal_entries" WHERE "journal_entries"."client_id" = ((client.id))

* Find all of the journal entries of all of the clients of a particular provider, sorted by date posted
   SELECT "journal_entries".* FROM "journal_entries"
