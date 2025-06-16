//
//  main.swift
//  1.5.2_volgin
//
//  Created by Max Volgin on 13.06.2025.
//

import Foundation

// Функция - приветствие

func main () {
print("Добро пожаловать в калькулятор") // Приветствие
print("Для выхода введите 'exit'") // Инструкция по выходу из программы
print(String(repeating: "-", count: 50)) //Разделительная линия
	
// Бесконечный цикл - программа работает пока пользователь не введет exit
	
while true {

// Ввод первого числа

var firstNumber: Int? = nil // Переменная для первого числа
while firstNumber == nil { // Пока не введено правильное число — спрашиваем
print("Введите первое целое число:")
if let input = readLine() { // Получаем строку от пользователя
if input.lowercased() == "exit" { // Проверка: если ввёл exit — выходим
print("Выход из программы")
return
}
if let number = Int(input) { // Пытаемся преобразовать ввод в целое число
firstNumber = number // Если получилось — сохраняем
} else {
print("Ошибка: Введено не целое число. Попробуйте снова") // Если не получилось — сообщаем об ошибке
}
}
}

// Ввод второго числа

var secondNumber: Int? = nil // Переменная для второго числа
while secondNumber == nil { // Пока не введено правильное число — спрашиваем
print("Введите второе целое число:")
if let input = readLine() { // Получаем строку от пользователя
if input.lowercased() == "exit" { // Проверка: если ввёл exit — выходим
print("Выход из программы")
return
}
if let number = Int(input) { // Пытаемся преобразовать ввод в целое число
secondNumber = number // Если получилось — сохраняем
} else {
print("Ошибка: Введено не целое число. Попробуйте снова") // Если не получилось — сообщаем об ошибке
}
}
}

// Ввод операции

var operation: String? = nil // Переменная для оперции
while operation == nil { // Пока не введена операция — спрашиваем
print("Введите операцию (+, -, *, /):")
if let input = readLine () { // Получаем строку от пользователя
if input.lowercased() == "exit" { // Проверка: если ввёл exit — выходим
print("Выход из программы")
return
}
	
// Проверка на правильность операции

if ["+", "-", "/", "*"].contains(input) {
operation = input
} else {
print("Ошибка: Введите одну из операций: +, -, *, /.")
}
}
}
	
// Проверка деления на ноль
	
if operation == "/" && secondNumber == 0 {
print("Ошибка: На 0 делить нельзя") // // Запрещаем деление на 0
print(String(repeating: "-", count: 50))
continue // Возвращаемся в начало цикла
}

// Выполняю операцию

var result: Int = 0 // Переменная для результата
switch operation { // Выбираем операцию
case "+":
result = firstNumber! + secondNumber!
case "-":
result = firstNumber! - secondNumber!
case "/":
result = firstNumber! / secondNumber!
case "*":
result = firstNumber! * secondNumber!
default:
break
}
	
// Вывод результата

print("Результат \(result)")
print(String(repeating: "-", count: 50))
}
}
// Запуск программы
main()
