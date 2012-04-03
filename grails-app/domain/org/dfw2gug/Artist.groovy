package org.dfw2gug

class Artist {


    String name
    Date birthDate
    String home
    String style

    static hasMany = [works: Work]

    def String toString() {
        "($id: $name)"
    }

    static constraints = {
        name blank: false
        birthDate nullable: true
        home blank:  false
        style inList: ['Modern','Classic','Abstract']
    }
}
