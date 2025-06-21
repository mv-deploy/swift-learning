//
//  main.swift
//  1.11.1_volgin
//
//  Created by Max Volgin on 21.06.2025.
//

import Foundation

print("Введите количество значений:")

guard let input = readLine(), let count = Int(input), count > 0 else {
	print("Ошибка: это не похоже на число.")
	exit(1)
}

var values: [String] = []
print("\nВведите значения:")

for _ in 1...count {
	if let value = readLine() {
		values.append(value)
	}
}

print("\nРезультат:")
for value in values.reversed() {
	print(value)
}
