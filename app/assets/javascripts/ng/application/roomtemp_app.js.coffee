roomTempApp = angular.module 'RoomTemp', ["ui.bootstrap"]


roomTempApp.factory('Page', ()->
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

roomTempApp.factory('User', ()->
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


roomTempApp.factory('Alert', ()->
  alerts = [
    { type: 'danger', msg: 'Oh snap! Change a few things up and try submitting again.' },
    { type: 'success', msg: 'Well done! You successfully read this important alert message.' }
  ]
  {
    addAlert: (message, type = 'warning') ->
      alerts.push  {type: type, msg: message}
      alerts.shift() if alerts.length > 3
    closeAlert: (index) -> alerts.splice(index, 1)
    alerts: () -> alerts
  }
)

roomTempApp.controller 'LayoutCtrl',  ($scope, Page, User, Alert)->
  $scope.Page = Page
  $scope.User = User
  $scope.Alert = Alert
  true

