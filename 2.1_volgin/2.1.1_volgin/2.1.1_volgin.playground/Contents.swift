import UIKit

// -----------------------
// НАСЛЕДОВАНИЕ
// -----------------------
// Пример 1 - Устройства умного дома

// Родительский класс — общее устройство умного дома
class SmartDevice {
	var isOn = false
	
	func turnOn() {
		isOn = true
		print("Устройство включено")
	}
	
	func turnOff() {
		isOn = false
		print("Устройство выключено")
	}
}

// SmartLight наследует свойства и методы SmartDevice
// Это пример наследования: дочерний класс получает функционал родителя
class SmartLight: SmartDevice {
	func setBrightness(_ level: Int) {
		print("Яркость света установлена на \(level)%")
	}
}

// SmartThermostat тоже наследует общий функционал включения/выключения
class SmartThermostat: SmartDevice {
	func setTemperature(_ temp: Double) {
		print("Температура установлена на \(temp)°C")
	}
}

let lamp = SmartLight()
lamp.turnOn() // Метод из SmartDevice (наследование)
lamp.setBrightness(75) // Собственный метод SmartLight

let thermostat = SmartThermostat()
thermostat.turnOn() // Метод из SmartDevice (наследование)
thermostat.setTemperature(22.5) // Собственный метод SmartThermostat
print("\n")

// Пример 2 - Платежные системы

class PaymentMethod {
	func pay(amount: Double) {
		print("Оплата на сумму \(amount) выполнена")
	}
}

// Дочерний класс — оплата кредитной картой, наследует pay и переопределяет его
class CreditCard: PaymentMethod {
	override func pay(amount: Double) {
		print("Оплата кредитной картой на сумму \(amount) выполнена")
	}
}

// Дочерний класс — оплата через PayPal, наследует и меняет поведение pay
class PayPal: PaymentMethod {
	override func pay(amount: Double) {
		print("Оплата через PayPal на сумму \(amount) выполнена")
	}
}

let credit = CreditCard()
credit.pay(amount: 100) // Наследуемый метод с переопределением

let paypal = PayPal()
paypal.pay(amount: 75) // Аналогично
print("\n\n")

// -----------------------
// ПОЛИМОРФИЗМ
// -----------------------

// Пример 1 - Сообщения в мессенджере

// Базовый класс с методом send()
class Message {
	func send () {
		print("Отправляем сообщение")
	}
}

// Текстовое сообщение переопределяет send()
class TextMessage: Message {
	override func send() {
		print("Отправляем текстовое сообщение")
	}
}

// Фото сообщение с собственной реализацией send()
class PhotoMessage: Message {
	override func send() {
		print("Отправляем фото")
	}
}

// Видео сообщение
class VideoMessage: Message {
	override func send() {
		print("Отправляем видео")
	}
}

let messages: [Message] = [TextMessage(), PhotoMessage(), VideoMessage()]
for message in messages {
	message.send() //// Вызов метода send() приводит к разным результатам — это полиморфизм
}
print("\n")

// Пример 2 - Управление транспортом

// Общий класс транспорта с методом move()
class Transport {
	func move() {
		print("Транспорт движется")
	}
}

class Car: Transport {
	override func move() {
		print("Машина едет")
	}
}

class Boat: Transport {
	override func move() {
		print("Лодка плывёт")
	}
}

class Airplane: Transport {
	override func move() {
		print("Самолёт летит")
	}
}

let transports: [Transport] = [Car(), Boat(), Airplane()]
for transport in transports {
	transport.move() // Полиморфизм: один и тот же вызов ведёт себя по-разному
}
print("\n\n")

// -----------------------
// ИНКАПСУЛЯЦИЯ
// -----------------------

// Пример 1 - Аккаунт пользователя в соцсети

class UserAccount {
	private var password: String // Скрытое свойство, нельзя читать и менять напрямую
	
	init(password: String) {
		self.password = password
	}
	
	func changePasswoerd(oldPassword: String, newPassword: String) {
		if oldPassword == password {
			password = newPassword
			print("Пароль успешно изменён")
		} else {
			print("Неверный текущий пароль")
		}
	}
	
	func login(password: String) -> Bool {
		return password == self.password
	}
}

let user = UserAccount(password: "12345")
print(user.login(password: "12345")) // true
user.changePasswoerd(oldPassword: "12345", newPassword: "19823")
print(user.login(password: "19823")) // true
print("\n")

//Инкапсуляция позволяет защитить пароль от прямого доступа и изменять его только через методы, контролируя корректность

// Пример 2 - Кошелёк с криптовалютой

class CryptoWallet {
	// Закрытое (private) свойство balance — защищает данные от прямого доступа извне
	private var balance: Double = 0.0
	
	// Метод для получения денег
	func recive(amount: Double) {
		if amount > 0 {
			balance += amount
			print("Получено \(amount) монет. Баланс: \(balance)")
		}
	}
	
	// Метод для отправки денег с проверкой баланса
	func send(amount: Double) {
		if amount > 0 && amount <= balance {
			balance -= amount
			print("Отправлено \(amount) монет. Баланс: \(balance)")
		} else {
			print("Недостаточно средств для отправки")
		}
	}
	
	// Метод для чтения баланса — прямой доступ к balance невозможен
	func getBalance() -> Double {
		return balance
	}
}

let wallet = CryptoWallet()
wallet.recive(amount: 10)
wallet.send(amount: 3)
print("Баланс кошелька: \(wallet.getBalance())")
