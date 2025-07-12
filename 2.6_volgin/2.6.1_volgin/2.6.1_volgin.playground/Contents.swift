import UIKit

extension String {
	func isEqualCaselnsensitive(with other: String) -> Bool {
		return self.lowercased() == other.lowercased()
	}
}

let result1 = "Hello".isEqualCaselnsensitive(with: "HelLo")
print("Позитивный сценарий: \(result1)") //true

let result2 = "Hello".isEqualCaselnsensitive(with: "woRld")
print("Негативный сценарий: \(result2)") // false
