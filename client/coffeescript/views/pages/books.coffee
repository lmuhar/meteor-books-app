
Meteor.startup ->
  # counter starts at 0

  Session.setDefault('counter', 0)

  newBookTemplate = 'add-new-book'

  Template[newBookTemplate].onRendered ->
    $('#date-started').datepicker({autoclose: true})
    $('#date-finished').datepicker({autoclose: true})

  Template[newBookTemplate].events
    submit: (e) ->
      e.preventDefault()

      title = e.target.title.value
      author = e.target.author.value
      pages = e.target.pages.value
      dateStarted = e.target.dateStarted.value
      dateFinished = e.target.dateFinished.value

      if dateFinished
        days = moment(dateStarted).twix(dateFinished).length("days") + 2 #plus 2 to include the days on either side
        avgPages = Math.round(pages / days)
      else
        days = ""
        avgPages = ""

      if @_id
        Books.update({_id: @_id},{
          $set: {
            title: title,
            author: author,
            pages: pages,
            dateStarted: dateStarted,
            dateFinished: dateFinished,
            days: days,
            avgPages: avgPages
          }
        })
      else
        Books.insert
          title: title,
          author: author,
          pages: pages,
          dateStarted: dateStarted,
          dateFinished: dateFinished,
          days: days,
          avgPages: avgPages
      Modal.hide()

  Template.books.helpers
    books: ->
      return Books.find({})

  Template.books.events

    "click .edit": ->
      Modal.show newBookTemplate, @

    "click .delete": ->
      Books.remove(@_id)

    "click .add": ->
      debugger
      Modal.show(newBookTemplate)

