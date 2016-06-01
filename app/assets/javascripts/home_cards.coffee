# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

home_cards = angular.module('home_cards',[
	'templates',
	'ngRoute',
  'ngResource',
	'controllers',
])

home_cards.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'HomeCardsController'
      )
])