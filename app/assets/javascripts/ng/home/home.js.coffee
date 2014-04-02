# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

angular.module('RoomTemp').controller 'HomeCtrl',  ($scope, Page, User, Alert)->
  Page.setTitle(() ->
    if User.loggedIn()
      "Home for #{User.user().name}!"
    else
      'Home'
  )
  $scope.options = [
     { label: 'test', href: '/'}
  ]

  $scope.asUnknown = () ->
    u = User.asUser(0)
    Alert.addAlert('Logged Out') unless u

  $scope.asBob = () ->
    User.asUser(1)
    Alert.addAlert('Logged in as ' + User.user().name + "!", "success")

  $scope.asMary = () ->
    User.asUser(2)
    Alert.addAlert('Logged in as ' + User.user().name + "!", "success")

  $scope.alertToAdd = {
    msg:null
    type:'success'
  }
  $scope.postNewAlert = (alertToAdd) ->
    if (Alert.addAlert(alertToAdd.msg, alertToAdd.type))
     alertToAdd.msg=null
