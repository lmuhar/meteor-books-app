@App = {}

@Books = new Mongo.Collection("books")

Meteor.subscribe("books")

Meteor.users.getActiveEmail = () ->
  email = ""
  if Meteor.userId()?
    if Meteor.user()?
      if Meteor.user().emails?
        if Meteor.user().emails[0]?
          if Meteor.user().emails[0].address?
            email = Meteor.user().emails[0].address

  return email

Meteor.startup () ->
  $ ->
# Create the backbone router
    App.router = new Router()
    Backbone.history.start({pushState: true})
