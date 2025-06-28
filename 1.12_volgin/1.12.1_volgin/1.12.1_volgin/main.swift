//
//  main.swift
//  1.12.1_volgin
//
//  Created by Max Volgin on 25.06.2025.
//
import Foundation

// Функция генерации пароля
func generatePassword(length: Int) -> String? {
	let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	let digits = "0123456789"
	let symbols = "@#$%*()"
	let allCharacters = Array(letters + digits + symbols)
	
	guard length >= 4 else {
		return nil
	}
	
	guard let randomLetter = letters.randomElement(),
		  let randomDigit = digits.randomElement(),
		  let randomSymbol = symbols.randomElement() else {
		return nil
	}
	
	var passwordChars: [Character] = [randomLetter, randomDigit, randomSymbol]
	
	for _ in 0..<(length - passwordChars.count) {
		if let randomChar = allCharacters.randomElement() {
			passwordChars.append(randomChar)
		}
	}
	
	passwordChars.shuffle()
	return String(passwordChars)
}

// Функция запроса длины пароля у пользователя
func askForLength() -> Int? {
	print("Введите длину пароля (не меньше 4):", terminator: " ")
	
	guard let input = readLine(),
		  let number = Int(input),
		  number >= 4 else {
		return nil
	}
	
	return number
}

// Главная функция
func main() {
	let title = "Программа PasswordGenerator"
	print("\(title)\n\(String(repeating: "-", count: title.count))")
	
	while true {
		guard let length = askForLength() else {
			print("""
Ошибка: введите число от 4 и выше.
Введите 'заново', чтобы попробовать снова, или любую другую строку для выхода:
""")
			
			if let retry = readLine(), retry.lowercased() == "заново" {
				continue
			} else {
				break
			}
		}
		
		if let password = generatePassword(length: length) {
			print("✅ Ваш пароль: \(password)")
		} else {
			print("❌ Не удалось создать пароль.")
		}
		
		break
	}
	
	print("Программа завершена.")
}

main()
