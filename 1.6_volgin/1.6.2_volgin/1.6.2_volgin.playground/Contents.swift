import UIKit

// Начальный массив данных

let stringArray = ["2", "4", "6", "8", "f", "&"]
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

// Считаю произведение всех чисел

var sum = 1
for number in numbers {
	sum *= number
}

// Добавляю произведение в конец массива

numbers.append(sum)

// Вывожу результат

print("Итоговый массив: \(numbers)")
