import UIKit
import Foundation


let name = "Steve"

var midleName: String? = "Jobs"

print("Meu nome é \(name) \(midleName ?? "Wozniak")")

if let midle = midleName {
    print("Meu nome é \(name) \(midle)")
} 
