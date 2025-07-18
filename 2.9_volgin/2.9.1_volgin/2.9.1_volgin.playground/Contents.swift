import UIKit

extension Array where Element: Equatable {
	func unique() -> [Element] {
		var result: [Element] = []
		for item in self {
			if !result.contains(item) {
				result.append(item)
			}
		}
		
		return result
	}
}

let numbers = [1, 2, 2, 3, 4, 4, 5]
let uniqueNumbers = numbers.unique()
print("Уникальные числа: \(uniqueNumbers)")

let strings = ["apple", "banana", "apple", "orange", "banana"]
let uniqueStrings = strings.unique()
print("Уникальные строки: \(uniqueStrings)")
