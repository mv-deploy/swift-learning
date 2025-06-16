//
//  main.swift
//  1.8.1_volgin
//
//  Created by Max Volgin on 16.06.2025.
//

import Foundation

// Разрешённые символы для hex-кода
let allowed: Set<Character> = [
	"0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
	"a", "b", "c", "d", "e", "f",
	"A", "B", "C", "D", "E", "F"
]

print("Введите числа через запятую:")

// Считываю строку от пользователя
if let input = readLine() {
	
	// Разбиваем по запятой
	let parts = input.split(separator: ",")
	
	// Пустое множество для результата
	var result: Set<String> = []
	
	// Проходим по каждому цвету
	for part in parts {
		var color = String(part)
		
		// Убираем пробелы
		color = color.replacingOccurrences(of: " ", with: "")
		
		// Если есть # — убираем
		if color.first == "#" {
			color.removeFirst()
		}
		
		// Длина должна быть ровно 6
		if color.count != 6 {
			continue
		}
		
		// Проверяем, все ли символы допустимы
		var isValid = true
		for character in color {
			if !allowed.contains(character) {
				isValid = false
				break
			}
		}
		
		// Если цвет валидный — добавляем в множество (в нижнем регистре)
		if isValid {
			result.insert(color.lowercased())
		}
	}
	
	// Вывод
	if result.isEmpty {
		print("Список пуст, вы не ввели ни одного правильного цвета")
	} else {
		// Превращаем в массив и сортируем
		let sorted = result.sorted()
		// Собираем строку через запятую
		let output = sorted.joined(separator: ",")
		print(output)
	}
}
