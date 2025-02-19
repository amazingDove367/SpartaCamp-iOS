//: [Previous](@previous)

import Foundation

struct Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    mutating func changeName() {
        name = "10"
    }
}
//: [Next](@next)

var hakyung = Person(name: "hakyung")
print(hakyung.name)

hakyung.changeName()
print(hakyung.name)
