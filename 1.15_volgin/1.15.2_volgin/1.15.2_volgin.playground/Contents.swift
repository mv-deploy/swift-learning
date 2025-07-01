import UIKit

func bubbleSort(_ array: [Int], by areInIncreasingOrder: (Int, Int) -> Bool) -> [Int] {
	var result = array
	
	for i in 0..<result.count {
		for j in 0..<result.count - i - 1 {
			if !areInIncreasingOrder(result[j], result[j + 1]) {
				result.swapAt(j, j + 1)
			}
		}
	}
	return result
}

let numbers1 = [3, 1, 4, 1, 5, 9, 2]
let numbers2 = [10, 20, 15, 5, 0]

let ascending = bubbleSort(numbers1, by: { $0 < $1 })
print("По возрастанию:", ascending)

let descending = bubbleSort(numbers2, by: { $0 > $1 })
print("По убыванию:", descending)
