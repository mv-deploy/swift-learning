import UIKit

struct SortedArray<T: Comparable> {
	private let originalArray: [T]
	
	init(array: [T]) {
		self.originalArray = array
	}
	
	var ascending: [T] {
		originalArray.sorted()
	}
	
	var descending: [T] {
		originalArray.sorted(by: >)
	}
	
	var origial: [T] {
		originalArray
	}
}

let intArray = SortedArray(array: [5, 2, 8, 1, 3])
print("Int — оригинал: \(intArray.origial)")
print("Int — по возрастанию: \(intArray.ascending)")
print("Int — по убыванию: \(intArray.descending)")

let stringArray = SortedArray(array: ["banana", "apple", "cherry", "pineapple"])
print("String — оригинал: \(stringArray.origial)")
print("String — по возрастанию: \(stringArray.ascending)")
print("String — по убыванию: \(stringArray.descending)")
