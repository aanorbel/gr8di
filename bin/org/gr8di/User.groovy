package org.gr8di

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes = 'username')
@ToString(includes = 'username', includeNames = true, includePackage = false)
class User implements Serializable {

    private static final long serialVersionUID = 1

    String firstName
    String lastName
    String email
    String username
    String password
    String city
    String country
    boolean helper
    String helpKind
    boolean isAdult
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    Set<Role> getAuthorities() {
        (UserRole.findAllByUser(this) as List<UserRole>)*.role as Set<Role>
    }

    static constraints = {
        password nullable: false, blank: false, password: true
        username nullable: false, blank: false, unique: true
        firstName nullable: false, blank: false
        lastName nullable: false, blank: false
        email nullable: false, blank: false, email: true
        city nullable: true
        country nullable: true
        helpKind nullable: true
        isAdult nullable: false, blank: false, inList: [true]
    }

    static mapping = {
        password column: '`password`'
    }
    static transients = ['confirmPassword']
}
