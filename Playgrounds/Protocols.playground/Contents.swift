import UIKit

protocol Persist {
    func save()
}

class Monster: Persist {
    func save() {
        print("Monster save")
    }
}

class Sword: Persist {
    func save() {
        print("Sword save")
    }
}

// two different objects - both objects conform to the Persist protocol
let monster = Monster()
let sword = Sword()

// this is an array of objects that all conform to the Persist protocol. This works even though sword and monster are of different types
let items: [Persist] = [monster, sword]

class GameManager {
    func saveLevel(_ items: [Persist]) {
        for item in items {
            item.save() // item only has the save method because this function only takes in an array of objects that conform to the protocol
        }
    }
}

let gameManager = GameManager()
gameManager.saveLevel(items)
