//
//  main.swift
//  1.12.1_volgin
//
//  Created by Max Volgin on 25.06.2025.
//

import Foundation

// Функция генерации пароля

func generatePassword(length: Int) -> (String?, Bool){
	let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	let digits = "0123456789"
	let symbols = "@#$%*()"
	let allCharacters = Array(letters + digits + symbols)
	
	guard length >= 4 else {
		return (nil, false)
	}
	
	guard let randomLetter = letters.randomElement(),
		  let randomDigit = digits.randomElement(),
		  let randomSymbol = symbols.randomElement() else {
		return (nil, false)
	}
	
	var passwordChars: [Character] = [randomLetter, randomDigit, randomSymbol]
	
	for _ in 0..<(length - passwordChars.count) {
		if let randomChar = allCharacters.randomElement() {
			passwordChars.append(randomChar)
		}
	}
	
	passwordChars.shuffle()
	
	return (String(passwordChars), true)
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
		
		let (password, success) = generatePassword(length: length)
		
		if success, let password = password {
			print("✅ Ваш пароль: \(password)")
		} else {
			print("❌ Не удалось создать пароль.")
		}
		
		break
	}
	print("Программа завершена.")
}
main()
