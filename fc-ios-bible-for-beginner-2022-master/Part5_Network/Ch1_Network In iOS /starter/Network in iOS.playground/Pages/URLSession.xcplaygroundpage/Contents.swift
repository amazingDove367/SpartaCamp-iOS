//: [Previous](@previous)

import Foundation

// configuration -> urlsession -> urlsessionTask
let configuration = URLSessionConfiguration.default
let session = URLSession(configuration: configuration)

let url = URL(string: "https://api.github.com/users/hortenssiaa")!

let task = session.dataTask(with: url) { data, response, error in
    guard let httpResponse = response as? HTTPURLResponse,
          (200..<300).contains(httpResponse.statusCode) else {
        print("[response]: \(response)")
        return
    }
    
    // data 는 optional 로 받기 때문에, guard 문
    guard let data = data else { return }
    
    // string으로 encoding
    let result = String(data: data, encoding: .utf8)
    print(result)
}

// task 는 스스로 시작 X >> resume
task.resume()

//: [Next](@next)
