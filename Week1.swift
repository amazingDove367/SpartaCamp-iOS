
import UIKit

struct Movie {
    // stored property
    var name: String
    var director: String
    
    // computed property
    var description: String {
        return "\(name) is \(director)'s best movie ever."
    }
}

// 1
var movie = Movie(name: "탑건", director: "")
print(movie.name)

movie.name = "탑건:메버릭"
print(movie.name)

// 2
var movie2 = Movie(name: "인셉션", director: "놀란")
print(movie2.description)


// *** didSet : 값이 세팅 됐을때, 호출된다
struct Task {
    var name: String
    var progress: Int {
        didSet {
      
            // sol.1
            // 바로 찍기
            /*
            var star = progress / 10
            for i in 1...star {
                print("*", terminator: "")
            }
            for i in 1...(10-star) {
                print("-", terminator: "")
            }
            print()
            */
            
            // sol.2
            // 저장해서 찍기
            var str = ""
            for i in 1...10 {
                if progress >= i * 10 {
                    str += "*"
                } else {
                    str += "-"
                }
            }
//            print(str)
            
            print("Current Progress : \(str)")
        }
    }
    
    var isDone: Bool {
        return progress == 100
    }
}

var task = Task(name: "Very Important Task", progress: 0)

task.progress = 30
task.progress = 50
task.progress = 90
task.progress = 100



// struct 에서, method에서 stored property값을 변경하는 경우, method 앞에 'mutating'을 붙여야함
struct Student {
    let name: String
    var major: String
    var knowledge: Double
    
    func didFinalTest() -> Int {
        let howMuchIdontKnow = (1 - knowledge) * 100
        let score = 100 - Int(howMuchIdontKnow)
        return score
    }
    
    mutating func didStudy() { // 공부할때마다 +0.1
        if knowledge >= 1 {
            knowledge = 1
        } else {
            knowledge += 0.1
        }
    }
}

var student = Student(name: "hakyung", major: "cs", knowledge: 0.5)
print(student.didFinalTest())

student.didStudy()
student.didStudy()

print(student.didFinalTest())


let str: String = "Hello Swift"

print(str.count)
print(str.sorted())
print(str.split(separator: " "))
print(str.uppercased())
print(str.lowercased())
print(str.hasPrefix("He ")) // hi 로 시작하는 문자열인가


// struct init
struct iPhone {
    var model: String
}

var iPhone15 = iPhone(model: "iPhone 15")
print("iPhone15.model: \(iPhone15.model)")

struct iPhone2 {
    var model: String
    
    init(model: String = "iphone 15 2") {
        self.model = model
    }
}

var iPhone152 = iPhone2()
print("iPhone152.model: \(iPhone152.model)")




struct Transactions {
    init() {
        print("********History Loading...***********")
    }
}

struct SecondHandItem {
    var name: String
    
    lazy var history: Transactions = Transactions()
    // var history: Transactions = Transactions()
    
    init(name: String) {
        self.name = name
    }
}

var usedMacbook = SecondHandItem(name: "M1 Macbook")
print(usedMacbook.name)
usedMacbook.history




// 타입 프로퍼티 (해당 객체 타입 자체에 종속된 property)
struct FCLecture {
    static var academyName: String = "Fast Campus"
    var name: String
}

var iOSLecture = FCLecture(name: "iOS 강의")
var backendLecture = FCLecture(name: "백엔드 강의")

print(iOSLecture.name)
print(backendLecture.name)
print(FCLecture.academyName)



class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
    func bark() {
        print("bow wow")
    }
}

class Collie: Dog {
    init(name: String) {
        super.init(name: name, breed: "Collie")
    }
    
    override func bark() {
        print("wal wal")
    }
}

let milk = Dog(name: "milk", breed: "Collie")

print("milk.name: \(milk.name)")
print("milk.breed: \(milk.breed)")

let testCollie = Collie(name: "testCollie")

print("testCollie.name: \(testCollie.name)")
print("testCollie.breed \(testCollie.breed)")

milk.bark()
testCollie.bark()




class Human {
    var name: String
    
    init(name: String) {
        self.name = name
        print("***initialize instance***")
    }
    
    deinit {
        print("***deinitialize instance: \(name)")
    }
    
    func printName() {
        print("my name: \(name)")
    }
}

func createJohn() {
    let john = Human(name: "John")
    john.printName()
}

createJohn()



/// protocol

protocol ClassPresident { // 학급반장
    var name: String { get }
    var className: String { get }
    
    func sayHello()
    func checkClassMember()
}

struct UnivPresidentStudent: ClassPresident {
    
    var name: String
    var className: String

    func sayHello() {
        print("대학생: 교수님 안녕하세용")
    }

    func checkClassMember() {
        print("대학생: 너희 성인이니, 알아서 하자!")
    }
}

struct HighSchoolPresidentStudent: ClassPresident {
    
    var name: String
    var className: String

    func sayHello() {
        print("고등학생: 담임선생님 안녕하세요!")
    }

    func checkClassMember() {
        print("고등학생: 애들아 왔지?")
    }
}

let jason = UnivPresidentStudent(name: "Jason", className: "공대")
let jake = HighSchoolPresidentStudent(name: "Jake", className: "이과")

jason.sayHello()
jason.checkClassMember()

jake.sayHello()
jake.checkClassMember()




// protocol 상속
protocol Payable {
    func calculateWages() -> Int
}

protocol Trainable {
    func train()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

extension Payable {
    func calculateWages() -> Int {
        return 10_000_000
    }
}

extension Trainable {
    func train() {
        print("(extension) study hard!")
    }
}

extension HasVacation {
    func takeVacation(days: Int) {
        print("(extension) take \(days) days off")
    }
}

protocol Employee: Payable, Trainable, HasVacation {}

struct DeveloperEmployee: Employee {
    var name: String
}

let choi = DeveloperEmployee(name: "Choi")
print(choi.calculateWages())
choi.train()
choi.takeVacation(days: 3)

struct DesignerEmployee: Employee {
    var name: String
}

let jade = DesignerEmployee(name: "Jade")
print(jade.calculateWages())
jade.train()
jade.takeVacation(days: 5)



// extension
// 기존 타입에 기능 추가
extension Int {
    func squared() -> Int {
        return self * self
    }
}

let number = 8
print(number.squared())

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}
print(number.isEven)


// protocol - purchaseable
protocol Purchaseable {
    var name: String { get set }
}

func buy(_ item: Purchaseable) {
    print("I bought \(item.name)") // Purchaseable name에 대한 get
}

struct Book: Purchaseable {
    var name: String
    var author: String
}

struct Movie2: Purchaseable {
    var name: String
    var actors: [String]
}

struct Car: Purchaseable {
    var name: String
    var manufacturer: String
}

struct Coffee: Purchaseable {
    var name: String
    var strength: Int
}

let harryPotter = Book(name: "HarryPotter", author: "J.K.Rowling")
let topgun = Movie2(name: "Top Gun", actors: ["Tom cruise"])
let modelX = Car(name: "modelX", manufacturer: "Tesla")
let americano = Coffee(name: "AhAh", strength: 5)

buy(harryPotter)
buy(topgun)
buy(modelX)
buy(americano)

extension Collection {
    func summerize() {
        print("there are \(count) memebers")
    }
}

let strArr = ["aa", "bb", "cc"]
let intArr = [4, 5, 6, 7]
let numSet = Set([1, 2, 3, 4, 5])

strArr.summerize()
intArr.summerize()
numSet.summerize()





// tuple
var apartment = (building: "107", floor: "2", home: "202")
print(apartment.0)
print(apartment.building)
print(apartment.1)
print(apartment.2)




// enum
enum MasterLevel: Int {
    case beginner
    case intermediate
    case professional
}

var beginner: MasterLevel = .beginner
print(beginner.rawValue)

let pro = MasterLevel(rawValue: 5)
print(pro)

enum Direction: String {
    case up
    case down = "ddd"
}

var dir: Direction = .down
print(dir.rawValue)

let up = Direction(rawValue: "down")
print(up) // nil







// collections
// array / dictionary / set
let yoo = "유재석"
let ji = "지석진"
let ha = "하하"

let runningMen = [yoo, ji, ha]

print(runningMen[0])

var emptyArr: [Int] = []
emptyArr = [Int]()


// Dictionary [key:value]
let languageCode = [
    "한국" : "ko",
    "미국" : "en",
    "일본" : "jp",
]

print(languageCode["한국"])
print(languageCode["베트남"])


// dictionary declaration
var empyDic: [String:Int] = [:]
empyDic = [String:Int]()

// set
var primes: Set<Int> = [2,3,5,7] // set 타입 설정해놓고는, []array와 같이 표현할 수 있음
var evens = Set<Int>([2,4,6,8,2,4]) // type annotation 안하는 경우는 이렇게 길게 표현
print(evens)
var emptySet: Set<Int> = []
emptySet = Set<Int>() // 여기까지 하면 빈 깡통


// optional unwrapping
// if let
var age: Int? = nil
print(age)

age = 12
print(age)

if let unwrapped = age {
    print("age: \(unwrapped)")
} else {
    print("age is missing")
}


// guard let : optional 검사
func printAge(age: Int?) {
    guard let unwrapped = age else {
        print("age is missing")
        return
    }
    print("age: \(unwrapped)")
}

printAge(age: nil)


// nil coalecsing
age = nil
let currentAge = age ?? 20 // age가 nil일 경우, 20
print("age:: \(currentAge)")

// optional chaining
struct Developer {
    var name: String
}
var jason2: Developer? = Developer(name: "Jason")// Developer옵셔널 타입. Developer라는 객체가 있을수도 없을수도 있다.
print(jason2?.name)


// Typecasting
// 부모 -> 자식 type으로 변형 가능한지 확인할때
// as? 사용
class Animal {}
class Dog2: Animal {
    func bark() {
        print("wal wal2")
    }
}
class Cat: Animal {}

let pets: [Animal] = [Cat(), Dog2(), Cat(), Dog2()]
for pet in pets {
    if let dog = pet as? Dog2 {
        dog.bark()
    }
}
