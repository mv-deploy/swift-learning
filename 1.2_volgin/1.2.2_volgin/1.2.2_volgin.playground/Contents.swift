import UIKit

//Планировщик прогулки с собакой

let temperature: Double = 18.0 // Температура в градусах
let isRaining: Bool = false // Идет ли дождь
let isSunny: Bool = true // Светит ли солнце
let currentTime: Int = 15 // Текущее время в часах (24 часовой формат)
let availableTime: Int = 45 // Сколько времени нужно на прогулку в минутах

// 1 - Можно идти на прогулку ?
// Условия: температура от 5 до 30 градусов, достаточно времени (больше 30 минут), светло (с 6 утра до 22 вечера)

let isTemperatureCorrect = temperature >= 5 && temperature <= 30
let isTimeEnough = availableTime > 30
let isDayLight = currentTime >= 6 && currentTime <= 22
let canGoForWalk = isTemperatureCorrect && isTimeEnough && isDayLight
print("Можно идти на прогулку: \(canGoForWalk)")

// 2 — Нужен зонт ?
// Условия: зонт нужен, если идет дождь или температура ниже 15 и нет солнца

let isNeedUmbrella = isRaining || (temperature < 15 && !isSunny)
print("Нужен зонт: \(isNeedUmbrella)")

// 3 — Проверяем, нужна ли теплая одежда
// Условия: теплая одежда нужна, если температура ниже 10 или температура ниже 20 и идет дождь

let isNeedWarmClothes = temperature < 10 || (temperature < 20 && isRaining)
print("Нужна теплая одежда: \(isNeedWarmClothes)")

// 4 — Нужно ли сходить в домашний туалет? (зима или поздно)
// Условия: температура ниже 0 или за окном ночь (до 6 утра или после 22 вечера)

let isBetterToStayHome = temperature < 0 || currentTime < 6 || currentTime > 22
print("Лучше сходить в домашний туалет: \(isBetterToStayHome)")
