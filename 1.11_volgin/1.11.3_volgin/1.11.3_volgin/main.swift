//
//  main.swift
//  1.11.3_volgin
//
//  Created by Max Volgin on 22.06.2025.
//

import Foundation

print("Добро пожаловать в игру 'Угадай число!'")
print(String(repeating: "-", count: 40))

var wantsToPlay = true

while wantsToPlay {
	
	var range: (min: Int?, max: Int?) = (nil, nil)
	
	while range.min == nil {
		print("Введите минимальное число:")
		if let input = readLine(), let number = Int(input) {
			range.min = number
		} else {
			print("Ошибка: нужно ввести целое число.")
		}
	}
	
	while range.max == nil {
		if let min = range.min {
			print("Введите максимальное число (больше чем \(min)):")
			if let input = readLine(), let number = Int(input) {
				if number > min {
					range.max = number
				} else {
					print("Ошибка: Максимальное число должно быть больше \(min).")
				}
			} else {
				print("Ошибка: нужно ввести целое число.")
			}
		}
	}
	if let min = range.min, let max = range.max {
		let secretNumber = Int.random(in: min...max)
		var attempts: [Int] = []
		var guessed = false
		
		print("Я загадал число от \(min) до \(max). Угадай какое...")
		
		while !guessed {
			print("Ваш вариант:")
			if let input = readLine(), let guess = Int(input) {
				if guess < min || guess > max {
					print("Число вне диапазона! Диапазон: \(min)...\(max)")
					continue
				}
				
				if attempts.contains(guess) {
					print("Вы уже вводили \(guess). Попробуйте другое.")
					continue
				}
				
				attempts.append(guess)
				
				if guess < secretNumber {
					print("Больше")
				} else if  guess > secretNumber {
					print("Меньше")
				} else {
					print("Угадал! 🎉 Число было \(secretNumber). Вы справились за \(attempts.count) попыток.")
					guessed = true
				}
			} else {
				print("Ошибка: нужно ввести целое число.")
			}
		}
	}
	
	print("Сыграть снова? Введите YES для повтора или NO для выхода:")
	
	let answer = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines).uppercased() ?? ""
	
	switch answer {
	case "YES":
		wantsToPlay = true
	case "NO":
		wantsToPlay = false
		print("Спасибо за игру! 👋")
	default:
		wantsToPlay = false
		print("Неверный ввод, завершаем игру. Спасибо! 👋")
	}
}
