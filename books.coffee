Books = new Mongo.Collection("books")

if (Meteor.isClient)
  # counter starts at 0
  Session.setDefault('counter', 0)

  Template.body.helpers
    books: ->
      return Books.find({})

  Template.body.events
    submit: (e)->
      e.preventDefault()

      title = e.target.title.value
      author = e.target.author.value

      Books.insert({
        title: title,
        author: author
      })

      e.target.title.value = ""
      e.target.author.value = ""

    "click .delete": ->
      Books.remove(@_id)

if (Meteor.isServer)
  Meteor.startup
    # code to run on server at startup
