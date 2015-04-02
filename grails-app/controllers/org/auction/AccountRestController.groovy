package org.auction

import grails.plugin.springsecurity.annotation.Secured
import grails.rest.RestfulController

class AccountRestController extends RestfulController<Account> {

    @SuppressWarnings("GroovyUnusedDeclaration")
    static responseFormats = ['json', 'xml']
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    AccountRestController() {
        super(Account)
    }

    @Secured(['permitAll'])
    def show() {
        super.show()
    }

    @Secured(["IS_AUTHENTICATED_FULLY"])
    @Override
    def update() {
        def user=springSecurityService.currentUser
        def account=Account.findByUsername(user.username)
        int aid=account.id as int

        if(handleReadOnly()) {
            return
        }
        Account instance = Account.findById(params.id)
        if(!instance){
            return
        }
        instance.properties=request

        if (instance.hasErrors()) {
            respond instance.errors
            return
        }
        def id = instance.id as int
        if(aid!=id){
            return
        }
        instance.save flush:true
        redirect instance
    }
}
