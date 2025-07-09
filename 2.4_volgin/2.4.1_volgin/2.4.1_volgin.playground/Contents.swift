import UIKit

// Базовый класс
class Device {
	var brand: String
	var model: String
	var year: Int
	
	// Инициализатор designated
	init(brand: String, model: String, year: Int) {
		self.brand = brand
		self.model = model
		self.year = year
	}
	
	// Опциональный инициализатор — если год меньше 2000, устройство не создается
	init?(brand: String, model: String, year: Int?) {
		guard let year = year, year >= 2000 else {
			return nil
		}
		self.brand = brand
		self.model = model
		self.year = year
	}
	
	// Convenience — позволяет создать с текущим годом
	convenience init(brand: String, model: String) {
		self.init(brand: brand, model: model, year: Calendar.current.component(.year, from: Date()))
	}
	
	// Required инициализатор — все подклассы обязаны его реализовать
	required init(brand: String) {
		self.brand = brand
		self.model = "Unknown"
		self.year = 2025
	}
}

// Подкласс смартфон
class Smartphone: Device {
	var os: String
	
	// Переопределяем required init
	required init(brand: String) {
		self.os = "iOS"
		super.init(brand: brand)
	}
	
	// Переопределяем designated init
	override init(brand: String, model: String, year: Int) {
		self.os = "iOS"
		super.init(brand: brand, model: model, year: year)
	}
}

// Примеры использования:

// Основной init
let device1 = Device(brand: "Apple", model: "iMac", year: 2023)

// Convenience init
let device2 = Device(brand: "Samsung", model: "Galaxy Tab")

// Опциональный init — не сработает, если год меньше 2000
let device3 = Device(brand: "Nokia", model: "3310", year: 1999)
let device4 = Device(brand: "Nokia", model: "3310", year: 2001)

// Required init из базового класса
let phone1 = Smartphone(brand: "Apple")

// Подкласс с полным init
let phone2 = Smartphone(brand: "Google", model: "Pixel", year: 2024)


// init(...) основной (designated) - задаёт все свойства
// init?(...) опциональный - может вернуть nil (например, при некорректных данных)
// convenience init(...) вспомогательный - вызывает другой init в том же классе
// required init(...) обязателен в каждом подклассе
// override init(...) переопределение designated init в подклассе
// required override init(...) и обязательный и переопределённый
