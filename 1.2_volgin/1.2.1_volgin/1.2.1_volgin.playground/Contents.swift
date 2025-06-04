import UIKit

// Исходные данные
let weight: Double = 75.0 // вес в килограммах
let height: Double = 175.0 // рост в сантиметрах
let dist: Double = 9.75 // дистанция в километрах
let hours: Double = 2.0 // время в часах

// 1 - Считаю скорость (км/ч)
let speed = dist / hours
print("Скорость: \(String(format: "%.1f", speed)) км/ч")

// 2 - Считаю расход каллорий за минуту по формуле
let caloriesOnMinute = (0.035 * weight) + (pow(speed, 2) / height) * (0.029 * weight)
print("Каллорий в минуту: \(String(format: "%.2f", caloriesOnMinute)) ккал")

// 3 - Перевожу часы в минуты
let minutes = hours * 60
print("Общее время: \(minutes) мин")

// 4 Считаю общий расход каллорий
let totalCalories = caloriesOnMinute * minutes
print("Всего сожжено каллорий: \(String(format: "%.2f", totalCalories)) ккал")

/* Было много чисел после запятой и я почитал
 про округления значений*/
