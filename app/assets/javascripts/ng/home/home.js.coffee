# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

angular.module('RoomTemp').controller 'HomeCtrl',  ($scope, Page, User)->
  Page.setTitle(() ->
    if User.loggedIn()
      "Home for #{User.user().name}!"
    else
      'Home'
  )
  $scope.options = [
     { label: 'test', href: '/'}
  ]

  $scope.asUnknown = () -> User.asUser(0)
  $scope.asBob = () -> User.asUser(1)
  $scope.asMary = () -> User.asUser(2)

