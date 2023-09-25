import UIKit

var greeting = "Hello, playground"


func warnSheep(herd: [String]) -> String {
    let wolf = "wolf"
    
    if let wolfIndex = herd.firstIndex(of: wolf) {
        let sheepIndex = herd.count - 1 - wolfIndex
        
        if wolfIndex == herd.count - 1 {
            return "Pls go away and stop eating my sheep."
        } else {
            return "Oi sheep number \(sheepIndex), you are about to get eaten by a wolf"
        }
    } else {
        return "No wolf"
    }
}
 warnSheep(herd: ["sheep", "wolf", "sheep", "sheep", "sheep"])

