app.controller("ListingController", function($scope, Listings, Auth, $routeParams, $rootScope, $location) {
    var listing = {}
    var sellerAccount
        //get detail listing
    var refresh = function() {
        Listings.get({
            id: $routeParams.id
        }, function(data) {
            listing = data
            sellerAccount = listing.sellerAccount.id
            $scope.listingName = listing.name
            $scope.description = listing.description
            $scope.startPrice = listing.startPrice
            $scope.listingDays = listing.listingDays
            $scope.option = listing.deliverOption.id
            $rootScope.$broadcast("readOptionName", {
                currentOption: $scope.option
            })
        })
    }
    $scope.getListing = function() {
        return listing
    }
    $scope.setOption = function(id) {
        $scope.option = id;
    }
    $scope.getListingID = function() {
        return $routeParams.id
    }
    $scope.editListing = function() {
        if (Auth.account != null && Auth.account != undefined) {
            if (Auth.account.id == sellerAccount) {
                var newListing = {
                    'name': $scope.listingName,
                    'description': $scope.description,
                    'startPrice': parseInt($scope.startPrice),
                    'listingDays': parseInt($scope.listingDays),
                    'startDate': '2015-05-12T07:30:00Z', //change!
                    'sellerAccount': parseInt(Auth.account.id),
                    'deliverOption': parseInt($scope.option)
                }
                $id = $routeParams.id
                Listings.update({
                    id: $id
                }, newListing, function() {
                    refresh()
                    $location.path('listings/' + $routeParams.id)
                })
            } else {
                alert("Must be the creater of the listing to perform this action")
            }
        } else {
            alert("editlisting: please login first")
        }
    }
    refresh()
})
