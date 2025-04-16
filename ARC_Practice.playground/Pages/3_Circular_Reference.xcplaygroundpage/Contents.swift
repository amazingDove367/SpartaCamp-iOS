import Foundation

// 순환 참조

class Person {
    var pet: Dog?
    init() {
        print("Class init")
    }
    deinit {
        print("Class deinit")
    }
}

class Dog {
    var owner: Person?
    init() {
        print("Dog init")
    }
    deinit {
        print("Dog deinit")
    }
}

// person rc = 1
var person: Person? = Person()

// dog rc = 1
var dog: Dog? = Dog()

// dog rc = 2
person?.pet = dog

// percon rc = 2
dog?.owner = person

person = nil
dog = nil
