roomTempApp = angular.module 'RoomTemp', []

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

roomTempApp.controller 'LayoutCtrl',  ($scope, Page, User)->
  $scope.Page = Page
  $scope.User = User
  true
