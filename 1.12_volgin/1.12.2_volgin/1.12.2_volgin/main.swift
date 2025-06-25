//
//  main.swift
//  1.12.2_volgin
//
//  Created by Max Volgin on 25.06.2025.
//

import Foundation

// Функция: проверка, является ли строка палиндромом
func isPalindrome(_ text: String) -> Bool {
	let cleaned = text
		.trimmingCharacters(in: .whitespacesAndNewlines)
		.lowercased()
	let onlyLetters = cleaned.filter { $0.isLetter }
	let characters = Array(onlyLetters)

	var left = 0
	var right = characters.count - 1

	while left < right {
		if characters[left] != characters[right] {
			return false
		}
		left += 1
		right -= 1
	}

	return true
}

// Главная функция
func main() {
	let title = "Проверка на палиндром"
	print("\(title)\n\(String(repeating: "-", count: title.count))")

	print("Введите строку:", terminator: " ")

	guard let input = readLine(),
		  !input.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
		print("⚠️ Вы ничего не ввели.")
		return
	}

	if input.contains(where: { $0.isNumber }) {
		print("❌ Ошибка: строка не должна содержать цифры.")
		return
	}

	if isPalindrome(input) {
		print("✅ Это палиндром!")
	} else {
		print("❌ Это не палиндром.")
	}

	print("Программа завершена.")
}

main()
