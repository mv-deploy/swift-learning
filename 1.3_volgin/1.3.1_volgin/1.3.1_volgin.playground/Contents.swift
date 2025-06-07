import UIKit

// Резюме

// Значения

let firstName = "Максим"
let lastName = "Волгин"
let age = 32
let hobby = "Кодить на Swift, Вело прогулки, Малая частная авиация"
var salaryExpectation = "120 000"

// Добавляю валюту

salaryExpectation.append(" рублей \u{1F4B8}")

// Собираю резюме

let resume = """
Имя: \(firstName)
Фамилия: \(lastName)
Возраст: \(age)
Хобби: \(hobby)
Зарплатные ожидания: \(salaryExpectation)
"""

// Вывожу резюме

print(resume)
