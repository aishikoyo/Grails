app.controller("AccountController", function($scope, Accounts, Auth, $location) {
    var account = {}

    //get current login account info
    var refresh = function() {
        if (Auth.account != null && Auth.account != undefined) {
            Accounts.get({
                id: Auth.account.id
            }, function(data) {
                account = data
                $scope.username = account.username
                $scope.email = account.email
                $scope.password = account.password
                $scope.address = account.address
            })
        } else {
            $(".my-alerts").html($("<div />")
                .html("account: please login first")
                .addClass("alert alert-danger login-fail")
            );
        }
    }
    $scope.getAccount = function() {
        return account
    }

    $scope.editAccount = function() {
        if (Auth.account != null && Auth.account != undefined) {
            var newAccount = {
                'username': $scope.username,
                'email': $scope.email,
                'password': $scope.password,
                'address': $scope.address
            }
            $id = Auth.account.id
            Accounts.update({
                id: $id
            }, newAccount, function() {
                refresh()
                $location.path('accounts')
            })
        } else {
            $(".my-alerts").html($("<div />")
                .html("editaccount: please login first")
                .addClass("alert alert-danger login-fail")
            );
        }
    }

    $scope.createAccount = function() {
        var newAccount = {
            'username': $scope.create_username,
            'email': $scope.create_email,
            'password': $scope.create_password,
            'address': $scope.create_address
        }
        Accounts.save(newAccount, function() {
            delete newAccount
            $(".my-alerts").html($("<div />")
                .html("Account successfully created.")
                .addClass("alert alert-success signup-success")
            );
            $location.path('home')
        })
    }
    refresh()
});
