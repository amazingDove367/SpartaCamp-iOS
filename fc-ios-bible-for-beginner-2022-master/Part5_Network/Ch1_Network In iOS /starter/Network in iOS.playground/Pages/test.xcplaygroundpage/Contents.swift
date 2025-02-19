//: [Previous](@previous)

import Foundation

struct Person {
    private(set) var name: String
    var major: String
    
    mutating func setName(to name: String) {
        self.name = name
    }
    
    mutating func setMajor(to major: String) {
        self.major = major
    }
}

var marry = Person(name: "human", major: "default")
print(marry.name) // human
marry.setName(to: "marry S")
print(marry.name) // marry S

marry.name = "s.marry" // ⭐️Error!!!!
