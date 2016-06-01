describe "HomeCardsController", ->
  scope        = null
  ctrl         = null
  location     = null
  routeParams  = null
  resource     = null

  # access injected service later
  httpBackend  = null

  setupController =(keywords,results)->
    inject(($location, $routeParams, $rootScope, $resource, $httpBackend, $controller)->
      scope       = $rootScope.$new()
      location    = $location
      resource    = $resource
      routeParams = $routeParams
      routeParams.keywords = keywords

      # capture the injected service
      httpBackend = $httpBackend

      if results
        request = new RegExp("\/home_cards.*keywords=#{keywords}")
        httpBackend.expectGET(request).respond(results)

      ctrl        = $controller('HomeCardsController',
                                $scope: scope
                                $location: location)
    )

  beforeEach(module("home_cards"))
  beforeEach(setupController())

  afterEach ->
    httpBackend.verifyNoOutstandingExpectation()
    httpBackend.verifyNoOutstandingRequest()

  it 'defaults to no cards', ->
    expect(scope.cards).toEqualData([])


  describe 'controller initialization', ->
    describe 'when no keywords present', ->
      beforeEach(setupController())

      it 'defaults to no cards', ->
        expect(scope.cards).toEqualData([])



  describe 'with keywords', ->
      keywords = 'foo'
      cards = [
        {
          id: 2
          name: 'Baked Potatoes'
        },
        {
          id: 4
          name: 'Potatoes Au Gratin'
        }
      ]
      beforeEach ->
        setupController(keywords,cards)
        httpBackend.flush()

      it 'calls the back-end', ->
        expect(scope.cards).toEqualData(cards)


  describe 'search()', ->
    beforeEach ->
      setupController()

    it 'redirects to itself with a keyword param', ->
      keywords = 'foo'
      scope.search(keywords)
      expect(location.path()).toBe('/')
      expect(location.search()).toEqualData({keywords: keywords})