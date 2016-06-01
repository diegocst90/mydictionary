controllers = angular.module('controllers', [])
controllers.controller("HomeCardsController", [ '$scope', '$routeParams', '$location', '$resource',
  ($scope,$routeParams,$location,$resource)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)
    Card = $resource('/home_cards/:cardId', { cardId: "@id", format: 'json' })

    if $routeParams.keywords
      Card.query(keywords: $routeParams.keywords, (results)-> $scope.cards = results)
    else
      $scope.cards = []
])