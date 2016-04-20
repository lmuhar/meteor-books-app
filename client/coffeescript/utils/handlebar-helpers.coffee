
Template.registerHelper 'formatDate', (date) ->
  moment(date).format('Do MMM YY') if moment(date).isValid()