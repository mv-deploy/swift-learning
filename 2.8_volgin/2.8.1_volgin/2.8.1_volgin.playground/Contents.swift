import UIKit

protocol ShapeProtocol {
	var area: Double { get }
	var name: String { get }
}

struct Rectangle: ShapeProtocol {
	let width: Double
	let height: Double
	
	var area: Double {
		width * height
	}
	
	var name: String {
		"Прямоугольник"
	}
}

struct Circle: ShapeProtocol {
	let radius: Double
	
	var area: Double {
		Double.pi * pow(radius, 2)
	}
	
	var name: String {
		"Круг"
	}
}

struct Trapezoid: ShapeProtocol {
	let base1: Double
	let base2: Double
	let height: Double
	
	var area: Double {
		0.5 * (base1 + base2) * height
	}
	
	var name: String {
		"Трапеция"
	}
}

func printShapeInfo(_ shape: ShapeProtocol) {
	print("Это \(shape.name) - площадь \(Int(shape.area))")
}

let figures: [ShapeProtocol] = [
	Rectangle(width: 5, height: 20),
	Circle(radius: 5),
	Trapezoid(base1: 4, base2: 6, height: 5)
]

for figure in figures {
	printShapeInfo(figure)
}
