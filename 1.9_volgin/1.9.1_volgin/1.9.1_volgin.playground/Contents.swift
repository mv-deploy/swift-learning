import UIKit

var characters: [String: String] = [
	"Нео": "Я избранный.",
	"Тринити": "Доверься мне.",
	"Морфеус": "Красная или синяя ?"
]

characters["Смит"] = "Мистер Андерсон."
characters["Оракул"] = "Будешь леденец ?"

let sortedCharacters = characters.keys.sorted()

for name in sortedCharacters {
	if let phrase = characters[name] {
		print("\(name): \(phrase)")
	}
}
