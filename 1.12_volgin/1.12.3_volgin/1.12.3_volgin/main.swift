//
//  main.swift
//  1.12.3_volgin
//
//  Created by Max Volgin on 25.06.2025.
//

import Foundation

func findMinAndMax(numbers: [Int]) -> (min: Int, max: Int)? {
	if numbers.isEmpty {
		return nil
	}
	
	var minValue = numbers[0]
	var maxValue = numbers[0]
	
	for number in numbers {
		if number < minValue {
			minValue = number
		}
		
		if number > maxValue {
			maxValue = number
		}
	}
	return (min: minValue, max: maxValue)
}

func main() {
	print("Введите числа через запятую:")
	
	if let input = readLine() {
		let parts = input.split(separator: ",")
		var numbers: [Int] = []
		
		for part in parts {
			let trimmed = part.trimmingCharacters(in: .whitespaces)
			if let number = Int(trimmed) {
				numbers.append(number)
			}
		}
		
		if numbers.isEmpty {
			print("Вы не ввели ни одного корректного числа.")
		} else if let result = findMinAndMax(numbers: numbers) {
			print("Минимум: \(result.min)")
			print("Максимум: \(result.max)")
		} else {
			print("Ошибка при вычислении.")
		}
	} else {
		print("Ошибка ввода.")
	}
}

main()
