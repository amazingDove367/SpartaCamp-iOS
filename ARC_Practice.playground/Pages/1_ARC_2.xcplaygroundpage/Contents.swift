import Foundation

var x = 1

let refClosure = { print("ref:", x) }
let varClosure = { [x] in print("val:", x) }

x = 5

refClosure()
varClosure()
