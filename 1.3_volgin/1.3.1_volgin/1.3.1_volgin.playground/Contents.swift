import UIKit

// Резюме

let firstName = "Максим"
let lastName = "Волгин"
let age = 32
let hobby = "Кодить на Swift, Вело прогулки, Малая частная авиация"
var salaryExpectation = "120 000"
salaryExpectation.append(" рублей \u{1F4B8}")

let resume = """
Имя: \(firstName)
Фамилия: \(lastName)
Возраст: \(age)
Хобби: \(hobby)
Ожидаемая зарплата: \(salaryExpectation)
"""
print(resume)
