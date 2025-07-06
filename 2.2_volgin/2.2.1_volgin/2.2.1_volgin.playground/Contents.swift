import UIKit

// Структура
struct CamperStruct {
	var name: String
}

var camper1 = CamperStruct(name: "Max")
var camper2 = camper1

camper2.name = "Anna"

print("""
--- Структура ---
camper1.name: \(camper1.name)
camper2.name: \(camper2.name)
""")

// Класс
class CamperClass {
	var name: String
	
	init(name: String) {
		self.name = name
	}
}

var camper3 = CamperClass(name: "Max")
var camper4 = camper3 // копируется ссылка на тот же объект

camper4.name = "Anna"

print("""
\n--- Класс ---
camper3.name: \(camper3.name)
camper4.name: \(camper4.name)
""")
