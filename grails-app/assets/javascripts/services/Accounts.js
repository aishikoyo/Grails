app.factory('Accounts', function($resource) {
    return $resource('/auction/api/accounts/:id', {}, {
            'update':{method: 'PUT'}
        }
    )
})