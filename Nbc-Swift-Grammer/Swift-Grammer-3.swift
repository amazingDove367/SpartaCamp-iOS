
// Week 3

// 1. Optional
// 1.1. 옵셔널 실습.
var str: String? = nil
print(str)
str = "Hi"
print(str)

var int: Int? = nil
print(int)
int = 10004
print(int)
//int += 1 // error

var float: Float? = nil
print(float)
float = 10005.2
print(float)

var bool: Bool? = nil
print(bool)
bool = false
print(bool)

var arr: [Int]? = nil
print(arr)
arr = [1, 2, 3]
print(arr)

var dic: [Int: String]? = nil
print(dic)
dic = [0: ".0", 1: ".1"]
print(dic)



// 1.2. struct 옵셔널 체이닝 실습
struct Dog {
    var toy: String?
}

struct Person {
    var pet: Dog?
}

let person: Person? = Person(pet: Dog(toy: "My Toy"))
print(person?.pet?.toy)



// 1.3. 클로저 옵셔널 체이닝 (할당과 접근)
var closure: (() -> Void)? = {
    print("Fire")
}
closure?() // Fire

var optionalClosure: ((Int) -> Void)? = { value in
    print("The value: \(value)")
}
optionalClosure?(1004) // 1004





// 2. Optional Unwrapping
var str2: String! = "Strrring"
print(str2.count)
print(str2 ?? "Default value")
if let str2 = str2 {
    print(str2)
} else {
    print("str2 is nil")
}

var int2: Int? = 123
if let int2 = int2 {
    print(int2 + 2)
} else {
    print("int2 is nil")
}


let person2: Person? = nil
if let toy = person2?.pet?.toy {
    print(toy, "!!")
}
print(person2?.pet?.toy)

let person3: Person? = Person(pet: Dog(toy: nil))
print(person3?.pet?.toy ?? "default toy3")





// 3. 중첩된 타입 (Nested type)
// 하나의 타입 안에 다른 타입을 정의
struct Car {
    struct Company {
        var name: String
        var phoneNumber: String
        
        func contact() {
            print("\(name) 회사의 A/S 센터 번호는 \(phoneNumber)입니다.")
        }
    }

    enum Model {
        case sedan
        case hatchback
        case suv
    }

    var model: Model
    var company: Company
    var name: String
    var color: String
}

let myCar = Car(model: .sedan, company: Car.Company(name: "sparta", phoneNumber: "010-0000-0000"), name: "붕붕이", color: "Black")

myCar.company.contact()
print(myCar.model)




// 4. 접근제어자 실습
class BankAccount {
    private var balance: Int = 0
    
    func deposit(money: Int) {
        balance += money
    }
    
    func withdraw(money: Int) {
        if money > balance {
            print("오류발생")
        } else {
            balance -= money
        }
    }
    
    func getBalace() -> Int {
        return balance
    }
}

let account = BankAccount()
account.deposit(money: 10000)
print(account.getBalace())


account.withdraw(money: 20000)
print(account.getBalace())




// 5. Protocol
/*
 
 **** protocol에 선언된 property를 구현할 경우, [저장 프로퍼티] / [연산 프로퍼티] 로 구현하든 상관 X ****
 **** 연산 프로퍼티는, 원래 var 선언 ****
 
 1. protocol P1 {
         var property: String { get }
     }

     - [저장 프로퍼티] : let/var 상관 X ('get'으로 수정안되니)
     - [연산 프로퍼티] : protocol 이 get 임에도,
         - get {} 구현 (O)
         - get {} set {} 구현 (O)
    
 2.  protocol P2 {
         var property: String { get set }
     }
     - [저장 프로퍼티] : 반드시 var 선언 (set 으로 수정 가능하니)
     - [연산 프로퍼티] :
             - get {} 만 구현 (X)
             - get {} set {} 모두 필수!!! 구현 (O)
 
 */

protocol Walkable {
    var feetCount: Int { get }
    func walk() -> String
}

protocol Introducable {
    func introduce()
}


class PersonC: Introducable, Walkable {
    var feetCount: Int = 22
//    var feetCount: Int {
//        get {
//            return 22
//        }
//        set { // 저장프로퍼티 사용 불가
//            self.feetCount = newValue
//        }
//    }
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func introduce() {
        print("이름은 \(name)입니다. 발갯수는 \(feetCount)개 입니다.")
    }
    
    func walk() -> String {
        return "사람이 걷습니다."
    }
}

struct Cat: Walkable, Introducable {
    var feetCount: Int = 4 // ⭐️
    var color: String
    
    func walk() -> String {
        return "고양이가 걷습니다"
    }
    
    init(color: String) {
        self.color = color
    }
    
    func introduce() {
        print("고양이 털 색은 \(color)색이고, 발 갯수는 \(feetCount)개 입니다.")
    }
}

var catP = Cat(color: "Yellow")
catP.introduce()
print(catP.walk())
print("cat feetcount: \(catP.feetCount)") // ⭐️
catP.feetCount = 19 // ⭐️
print("cat feetcount: \(catP.feetCount)") // ⭐️

extension PersonC {
    var fullNameWithFeetCount: String {
        return "\(name)_\(feetCount)"
    }
    
    func introduceOnlyName() {
        print("안녕하세요. \(name)입니다.")
    }
}

let personC = PersonC(name: "Dive")
personC.introduce()
print(personC.walk())
print("personC 발 갯수: \(personC.feetCount)")
personC.feetCount = 10 // ⭐️⭐️ protocol property feetCount가 { get } 임에도, set 가능
print("personC 발 갯수: \(personC.feetCount)")
print("fullname&feetcount: \(personC.fullNameWithFeetCount)")
