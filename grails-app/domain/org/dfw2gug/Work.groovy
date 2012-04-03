package org.dfw2gug

class Work {

    String title
    Integer price
    Date created = new Date()

    static belongsTo = [artist: Artist]

    def String toString() {
        "($id: $title)"
    }

    static constraints = {
        title blank: false
        price min: 0
    }
}
