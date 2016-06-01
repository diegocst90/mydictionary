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

cards = [
  {
    id: 1
    name: 'Baked Potato w/ Cheese'
  },
  {
    id: 2
    name: 'Garlic Mashed Potatoes',
  },
  {
    id: 3
    name: 'Potatoes Au Gratin',
  },
  {
    id: 4
    name: 'Baked Brussel Sprouts',
  },
]

controllers = angular.module('controllers',[])
controllers.controller("HomeCardsController", [ '$scope', '$routeParams', '$location', '$resource',
  ($scope,$routeParams,$location,$resource)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)

    if $routeParams.keywords
      $scope.keywords = $routeParams.keywords.toLowerCase()
      $scope.cards = cards.filter (card)-> card.name.toLowerCase().indexOf($scope.keywords) != -1
    else
      $scope.cards = []
])

