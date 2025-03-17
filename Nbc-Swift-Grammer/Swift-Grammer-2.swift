// Swift Grammer Day 2

// 1. Enum
// - 특정 주제/종류에 따라 묶을 수 있는 값들을 그룹화 -> 데이터 타입으로 사용 가능
// - 타입 안정성 보장
// - 의도 명확히 파악 가능

// 1.1 Enum Associated Value
enum DeliverySataus {
    case ordered
    case shipping(trakingNumber: String) // associated value
    case deliverCompleted(date: String) // associated value
}

let status = DeliverySataus.shipping(trakingNumber: "8001-12234")

switch status {
case .ordered:
    print("주문완료!")
case .shipping(let trackingNumber):
    print("배송중! 송장번호: \(trackingNumber)")
case .deliverCompleted(let date):
    print("배송완료! 배송일: \(date)")
}


// 1.2 Enum Raw Value
// (1) String
enum Season: String {
    case spring = "봄 입니다"
    case summer // raw value: "summer"
    case autum
    case winter
}

let season: Season = .spring
print(season) // spring
print(season.rawValue) // 봄 입니다

let season2 = Season.summer
print(season2.rawValue) // summer

var newSeason = Season(rawValue: "autum") // rawValue에는, Season enum 에 실제 존재하는 case의 rawValue을 넣어야 한다.
print(newSeason) // tional(Page_Contents.Season.autum)

newSeason = Season(rawValue: "autuuum") // enum Season에 autuuum 이라는 case X
print(newSeason) // nil


// (2) 숫자형
// rawValue 를 하나만 정해줄 경우, 아래로 순서에 따라 +1만큼 rawValue값이 올라간다.
enum Month: Int {
    case january = 1 // 1을 주지 않았다면, 자동 0으로 할당됨
    case februray
    case march
    case april = 10
    case may // 11
    case june // 12
    case july // 13
    case august // 14
    case september // 15
    case october // ...
    case november
    case december
}

print(Month.februray.rawValue) // 2
print(Month.june.rawValue) // 12

print(Month(rawValue: 15)) // Optional(Page_Contents.Month.september)




// 1.3 Enum Function
enum SeasonFunction: String {
    case spring
    case summer
    case autum
    case winter
    
    func weather() -> String {
        switch self {
        case .spring:
            return "따뜻해요"
        case .summer:
            return "더워요"
        case .autum:
            return "쌀쌀해요"
        case .winter:
            return "추워요"
        }
    }
}

// 🔴 사용 🔴
let seasonFunc = SeasonFunction.spring
print(seasonFunc.weather()) // 따뜻해요




// [Enum 실습]
// 1. enum 선언 & 사용
enum Direction {
    case north
    case east
    case south
    case west
    
    func toString() -> String {
        switch self {
        case .east:
            return "동"
        case .west:
            return "서"
        case .north:
            return "북"
        case .south:
            return "남"
        }
    }
}

let direction = Direction.east
print(direction)

if direction == .east {
    print("동쪽입니다.")
}

print(direction.toString())


// 2. enum rawValue 선언 & 사용
enum Rainbow: Int {
    case red = 0
    case orange
    case yellow
    case green
    case blue
    case navy
    case purple
}

let rainbow: Rainbow
rainbow = .yellow
print(rainbow.rawValue)

let rainbow2 = Rainbow(rawValue: 6)
print(rainbow2)


// 3. enum Associated 선언 & 사용
enum Beverage {
    case coffee(coffeeName: String, size: Int)
    case tea(teaName: String, isIced: Bool)
    case juice(juiceName: String)
}

var myDrink = Beverage.coffee(coffeeName: "아이스아메리카노", size: 100)
myDrink = Beverage.tea(teaName: "루이보스", isIced: false)
myDrink = Beverage.juice(juiceName: "포도")

switch myDrink {
case .coffee(let coffeeName, let size):
    print("[결제내용] 커피: \(coffeeName), 사이즈: \(size)")
case .tea(let teaName, let isIced):
    print("[결제내용] 티: \(teaName), 얼음은 \(isIced ? "있습" : "없습")니다.")
case .juice(let juiceName):
    print("[결제내용] 주스: \(juiceName)")
}



// Class
// convinience init
class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    convenience init(name: String) {
        self.init(name: name, age: 0)
    }
}

let person = Person(name: "Hakyung")
print(person.age) // 0


// deinit
// 사용 종료된 instance 가 메모리에서 해제될때, 자동 호출됨!
// 직접 호출 불가!

// Class 실습
class Animal {
    var feetCount: Int = 2
    let eyeCount: Int
    var name: String
    
    init(eyeCount: Int, name: String) {
        self.eyeCount = eyeCount
        self.name = name
    }
    
    func introduce() -> String {
        return "\(name)의 다리는 \(feetCount)개 이고요, 눈의 갯수는 \(eyeCount)개 입니다."
    }
}

var personA = Animal(eyeCount: 2, name: "수강생")
print(personA.introduce())











