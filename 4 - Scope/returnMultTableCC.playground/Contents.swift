import UIKit

var greeting = "Hello, playground"


func multTable(numberInput: Int) -> String {
    var table = ""
    for num in 1...10 {
        let result = num * numberInput
        table += "\(num) * \(numberInput) = \(result)\n"
    }
    return table
}
print(multTable(numberInput: 8))
