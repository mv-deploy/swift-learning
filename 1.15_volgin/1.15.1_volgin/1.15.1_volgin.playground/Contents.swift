import UIKit

func customFilter(_ array: [Int], using condition: (Int) -> Bool) -> [Int] {
	var result: [Int] = []
	
	for element in array {
		if condition(element) {
			result.append(element)
		}
	}
	
	return result
}

let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// только чётные
let evenNumbers = customFilter(numbers) { number in
	return number % 2 == 0
}
print("Чётные: \(evenNumbers)")

// больше 5
let greaterThanFive = customFilter(numbers) { number in
	number > 5
}
print("Больше 5: \(greaterThanFive)")
