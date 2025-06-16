import Foundation

// Функция
func main() { // Функция
	print("Добро пожаловать в программу замены текста!") // Приветствие
	print("Для выхода введите 'exit'.")
	print(String(repeating: "-", count: 50)) // Разделительная линия
	
	// Цикл — будет повторяться бесконечно
	while true {
		
		var originalText = "" // Переменная для исходного текста
		// Пока строка пустая — прошу пользователя ввести текст
		while originalText.isEmpty {
			print("\nВведите исходный текст (например, 'Хочу ли я поехать в путешествие?'):")
			if let input = readLine() { // Читаю ввод от пользователя
				if input.lowercased() == "exit" { // Если пользователь ввёл exit
					print("\nЗавершение работы программы.")
					print(String(repeating: "-", count: 50))
					return // Завершаю выполнение
				}
				originalText = input // Сохраняю введённый текст
			}
			if originalText.isEmpty { // Если всё ещё пусто — просим снова
				print("Ошибка: исходный текст не введен. Пожалуйста, попробуйте снова.")
			}
		}
		
		var textToReplace = "" // Переменная для текста, который нужно заменить
		while textToReplace.isEmpty { // Цикл ввода текста, который будем заменять
			print("Введите текст, который нужно заменить (например, 'Хочу ли я'):")
			if let input = readLine() { // Читаю ввод от пользователя
				if input.lowercased() == "exit" { // Если пользователь ввёл exit
					print("\nЗавершение работы программы.")
					print(String(repeating: "-", count: 50))
					return // Завершаю выполнение
				}
				textToReplace = input // Сохраняю введённый текст
			}
			if textToReplace.isEmpty { // Если всё ещё пусто — просим снова
				print("Ошибка: текст для замены не введен. Пожалуйста, попробуйте снова.")
			}
		}
		
		var newText = "" // Переменная для нового текста
		while newText.isEmpty {
			print("Введите новый текст (например, 'Готов ли я'):")
			if let input = readLine() { // Читаю ввод от пользователя
				if input.lowercased() == "exit" { // Если пользователь ввёл exit
					print("\nЗавершение работы программы.")
					print(String(repeating: "-", count: 50))
					return // Завершаю выполнение
				}
				newText = input // Сохраняю введённый текст
			}
			if newText.isEmpty { // Если всё ещё пусто — просим снова
				print("Ошибка: новый текст не введен. Пожалуйста, попробуйте снова.")
			}
		}
		
		// Здесь происходит замена
		// В оригинальном тексте заменяем textToReplace на newText
		
		let replacedText = originalText.replacingOccurrences(of: textToReplace, with: newText)
		
		// Вывод результата
		print(String(repeating: "-", count: 50)) // Разделительная линия
		print("Исходный текст     : \(originalText)") // Оригинал текста
		print("Текст для замены   : \(textToReplace)") //Что меняем
		print("Новый текст        : \(newText)") // На что меняем
		print("Результат замены   : \(replacedText)") // Готовый результат
		print(String(repeating: "-", count: 50)) // Вывод результата
	}
}

// Запуск функции
main()
