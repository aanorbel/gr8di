package gr8di

import org.gr8di.Role
import org.gr8di.User
import org.gr8di.UserRole

class BootStrap {

    def init = { servletContext ->

        def userRole = new Role(authority: 'ROLE_USER').save()
        def adminRole = new Role(authority: 'ROLE_ADMIN').save()

        def me = new User(firstName: 'admin',
                lastName: 'admin',
                email: 'me@gr8di.org',
                username: 'admin@gr8di.org',
                password: 'coolgroovy',
                city: 'Buea',
                country: 'Cameroon',
                isAdult: true).save()

        UserRole.create me, userRole
        UserRole.create me, adminRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }
    }
    def destroy = {
    }
}
