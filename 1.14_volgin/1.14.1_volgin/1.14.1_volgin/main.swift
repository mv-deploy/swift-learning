//
//  main.swift
//  1.14.1_volgin
//
//  Created by Max Volgin on 01.07.2025.
//

import Foundation

// Операции
enum Operation: String, CaseIterable {
	case add = "+"
	case subtract = "-"
	case multiply = "*"
	case divide = "/"
}

// Ошибки
enum CalculatorError: Error, CustomStringConvertible {
	case invalidNumber
	case invalidOperation
	case divisionByZero
	
	var description: String {
		switch self {
		case.invalidNumber:
			return "Ошибка: Введите целое число."
		case.invalidOperation:
			return "Ошибка: Неверная операция. Доступны +, -, *, /."
		case.divisionByZero:
			return "Ошибка: Деление на ноль невозможно."
		}
	}
}

// Ввод числа
func readInt(prompt: String) throws -> Int {
	print(prompt)
	guard let input = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines), !input.isEmpty else {
		throw CalculatorError.invalidNumber
	}
	if input.lowercased() == "exit" {
		exit(0)
	}
	guard let number = Int(input) else {
		throw CalculatorError.invalidNumber
	}
	return number
}

// Ввод операции
func readOperation() throws -> Operation {
	print("Введите операцию (+, -, *, /):")
	guard let input = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines), !input.isEmpty else {
		throw CalculatorError.invalidOperation
	}
	if input.lowercased() == "exit" {
		exit(0)
	}
	guard let op = Operation(rawValue: input) else {
		throw CalculatorError.invalidOperation
	}
	return op
}

// Выполнение расчёта
func calculate(_ a: Int, _ b: Int, _ operation: Operation) throws -> Int {
	switch operation {
	case .add:
		return a + b
	case .subtract:
		return a - b
	case .multiply:
		return a * b
	case .divide:
		if b == 0 {
			throw CalculatorError.divisionByZero
		}
		return a / b
	}
}

// Главная функция
func main() {
	print("Добро пожаловать в калькулятор\nДля выхода введите 'exit'")
	print(String(repeating: "-", count: 50))
	
	while true {
		do {
			let firstNumber = try readInt(prompt: "Введите первое целое число:")
			let secondNumber = try readInt(prompt: "Введите второе целое число:")
			let operation = try readOperation()
			let result = try calculate(firstNumber, secondNumber, operation)
			print("Результат: \(result)")
		} catch let error as CalculatorError {
			print(error.description)
		} catch {
			print("Произошла неизвестная ошибка.")
		}
		
		print(String(repeating: "-", count: 50))
		print("Хотите выполнить ещё одну операцию? (y = да, любая другая клавиша = выход)")
		let answer = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
		if !(answer?.starts(with: "y") ?? false) {
			print("Выход из программы")
			break
		}
	}
}

main()
