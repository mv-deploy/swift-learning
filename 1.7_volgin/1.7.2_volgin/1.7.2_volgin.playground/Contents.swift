import UIKit

// Начальный массив данных

let stringArray = ["0", "8", "ё", "п", "3", "&"]
print("Начальный массив \(stringArray)")

// Новый массив только с числами

var numbers: [Int] = []

// Перебор строк и превращем в число

for item in stringArray {
	if let number = Int(item) {
		numbers.append(number)
	} else {
		print("⚠️ '\(item)' — не число. Пропускаем.")
	}
}

print("Числовой массив \(numbers)")

// Считаю количество элементов

let count = numbers.count

// Если массив не пуст — прибавляю количество элементов к первому числу

if !numbers.isEmpty {
	numbers [0] += count
} else {
	print("Массив пуст — нельзя прибавить.")
}

// Считаю произведение всех чисел, но только если массив не пустой

if !numbers.isEmpty {
	var sum = 1
	for number in numbers {
		sum *= number
	}
	
	// Добавляю произведение в конец массива
	
	numbers.append(sum)
} else {
	print("Массив пуст - нечего перемножать")
}

// Вывожу результат

print("Итоговый массив: \(numbers)")
