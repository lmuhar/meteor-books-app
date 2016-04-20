Meteor.users.allow
# A user can update their own record
  update: (userId, doc) ->
    return userId == this.userId