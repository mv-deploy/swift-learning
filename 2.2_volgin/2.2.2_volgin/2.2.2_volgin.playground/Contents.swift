import Foundation

// Данные пользователя
let user: [String: Any] = [
	"name": "George G.",
	"weight": 75.7,
	"height": 175.3
]

// Массив дат
let dates = ["28.01.2020", "29.01.2020", "30.01.2020", "29.01.2020"]

// Массив шагов и времени
let stepsData: [(steps: Int, minutes: Int)] = [
	(steps: 1246, minutes: 34),
	(steps: 3378, minutes: 126),
	(steps: 9937, minutes: 98),
	(steps: 3361, minutes: 24),
	(steps: 12456, minutes: 136) // лишний, будет отброшен
]

// Структура дня активности
struct FitnessDay {
	let date: String
	let steps: Int
	let minutes: Int
	var weight: Double
	var height: Double
	
	func getSpeed() -> Double {
		let distance = Double(steps) * 0.0008
		let hours = Double(minutes) / 60.0
		if hours == 0 { return 0.0 }
		let speed = distance / hours
		return (speed * 10).rounded() / 10
	}
	
	func getCalories() -> Int {
		let speed = getSpeed()
		let caloriesPerMinute = (0.035 * weight) + (pow(speed, 2) / height) * (0.029 * weight)
		let totalCalories = caloriesPerMinute * Double(minutes)
		return Int(totalCalories)
	}
}

// Извлекаю вес и рост (если не извлекать, то прописать отдельно - по другому не придумал)
if let weight = user["weight"] as? Double,
   let height = user["height"] as? Double {
	
	// Словарь для объединения по датам
	var fitnessByDate: [String: (steps: Int, minutes: Int)] = [:]
	
	for index in 0..<dates.count {
		let date = dates[index]
		let stepEntry = index < stepsData.count ? stepsData[index] : (steps: 0, minutes: 0)
		
		if let existing = fitnessByDate[date] {
			fitnessByDate[date] = (
				steps: existing.steps + stepEntry.steps,
				minutes: existing.minutes + stepEntry.minutes
			)
		} else {
			fitnessByDate[date] = stepEntry
		}
	}
	
	// Формируем итоговый массив
	var result: [FitnessDay] = []
	
	for (date, data) in fitnessByDate {
		let day = FitnessDay(
			date: date,
			steps: data.steps,
			minutes: data.minutes,
			weight: weight,
			height: height
		)
		result.append(day)
	}
	
	// Выводим результаты
	for day in result.sorted(by: { $0.date < $1.date }) {
		print("Дата: \(day.date), шаги: \(day.steps), калории: \(day.getCalories()), скорость: \(day.getSpeed()) км/ч")
	}
	
} else {
	print("Ошибка: не удалось извлечь вес и рост из данных пользователя")
}
