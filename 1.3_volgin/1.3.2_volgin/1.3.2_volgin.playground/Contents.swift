import UIKit

// Исходные данные

let originalText = "Хочу ли я поехать в путешествие ? Хочу ли я остаться дома ?"
let textToReplace = "Хочу ли я"
let newText = "Готов ли я"

// Замена текста

let modifiedText = originalText.replacingOccurrences(of: textToReplace, with: newText)

// Вывод результата

let output = """
Исходный текст: \(originalText)
Текст для замены: \(textToReplace)
Меняем "\(textToReplace)" на: \(newText)
Результат выполнения программы: \(modifiedText)
"""
print(output)
