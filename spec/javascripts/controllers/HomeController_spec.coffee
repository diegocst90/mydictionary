describe "HomeCardsController", ->
  scope        = null
  ctrl         = null
  location     = null
  routeParams  = null
  resource     = null

  setupController =(keywords)->
    inject(($location, $routeParams, $rootScope, $resource, $controller)->
      scope       = $rootScope.$new()
      location    = $location
      resource    = $resource
      routeParams = $routeParams
      routeParams.keywords = keywords

      ctrl        = $controller('HomeCardsController',
                                $scope: scope
                                $location: location)
    )

  beforeEach(module("home_cards"))
  beforeEach(setupController())

  it 'defaults to no cards', ->
    expect(scope.cards).toEqualData([])