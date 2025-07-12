import UIKit

extension Bool {
	var rusDescription: String {
		return self ? "Истина" : "Ложь"
	}
}

let isTrue = true
print(isTrue.rusDescription)

let isFalse = false
print(isFalse.rusDescription)
