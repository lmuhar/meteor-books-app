Books = new Mongo.Collection("books")

if (Meteor.isClient)
  # counter starts at 0
  Session.setDefault('counter', 0)

  newBookTemplate = 'add-new-book'

  Template[newBookTemplate].events
    submit: (e) ->
      e.preventDefault()

      title = e.target.title.value
      author = e.target.author.value
      pages = e.target.pages.value
      dateStarted = e.target.dateStarted.value
      dateFinished = e.target.dateFinished.value

      days = moment(dateStarted).twix(dateFinished).length("days") + 1

      Books.insert({
        title: title,
        author: author,
        pages: pages,
        dateStarted: dateStarted,
        dateFinished: dateFinished,
        days: days
      })
      Modal.hide()

  Template.body.helpers
    books: ->
      return Books.find({})

  Template.body.events

    "click .delete": ->
      Books.remove(@_id)

    "click .add": ->
      Modal.show(newBookTemplate)

if (Meteor.isServer)
  Meteor.startup
    # code to run on server at startup
