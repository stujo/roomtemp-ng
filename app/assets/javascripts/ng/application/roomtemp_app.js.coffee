roomTempApp = angular.module 'RoomTemp', ["ui.bootstrap"]


roomTempApp.service('Page', ()->
  title = 'Welcome'
  {
    title: ()->
      if typeof(title) == 'function'
        title()
      else
        title
    setTitle: (newTitle) -> title = newTitle
  }
)

roomTempApp.service('User', ()->
  users = [
    {id: 1, name: 'Bob'}
    {id: 2, name: 'Mary'}
  ]

  user = null

  selectUserById = (id) ->
    for user in users
     return user if user.id == id
    null

  loggedIn = () ->
    user != null

  {
    asUser: (id) ->
      user = selectUserById(id)

    user: ()->
      if loggedIn
        user
      else
        null
    loggedIn: loggedIn

  }
)


roomTempApp.service('Alert', ()->
  alerts = [
    { type: 'danger', msg: 'Oh snap! Change a few things up and try submitting again.' },
    { type: 'success', msg: 'Well done! You successfully read this important alert message.' }
  ]
  {
    addAlert: (message, type = 'warning') ->
      if message
        alerts.push  {msg: message, type: type}
        alerts.shift() if alerts.length > 3
        true
      else
        false
    closeAlert: (index) -> alerts.splice(index, 1)
    alerts: () -> alerts
  }
)

roomTempApp.controller 'LayoutCtrl',  ($scope, Page, User, Alert)->
  $scope.Page = Page
  $scope.User = User
  $scope.Alert = Alert
  true

