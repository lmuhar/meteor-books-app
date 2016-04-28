Books = new Mongo.Collection("books")

# Publish the collection to the client
Meteor.publish "books", () ->
  return Books.find()

# Set permissions on this collection
Books.deny
# Records can't be deleted
  remove: (userId, doc) ->
    return false
Books.allow
# Client can add records
  insert: (userId, doc) ->
    return true
  update: (userId, doc) ->
    return true

# What to do when the server first starts up
Meteor.startup () ->
# Fill the collection with some initial data if it's empty
  if Books.find().count() == 0
    console.log "no data"