import UIKit

// Координаты

let xCoordinate = 9
let yCoordinate = -12

// Объединение в кортеж

let point = (xCoordinate, yCoordinate)

// Записываю нахождение точки

let location: String

// Условия

switch point {
case (0, 0):
	location = "в середине координатной плоскости"
case let (x, y) where x > 0 && y > 0:
	location = "в части B"
case let (x, y) where x < 0 && y > 0:
	location = "в части A"
case let (x, y) where x < 0 && y < 0:
	location = "в части D"
case let (x, y) where x > 0 && y < 0:
	location = "в части C"
case (_, 0):
	location = "на оси X"
case (0, _):
	location = "на оси Y"
default:
	location = "где-то в пространстве"
}

// Вывод результат

print("Точка с координатой (\(xCoordinate), \(yCoordinate)) расположена \(location)")
