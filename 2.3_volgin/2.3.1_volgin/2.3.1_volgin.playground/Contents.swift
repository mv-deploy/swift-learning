import UIKit

struct Size {
	var width: Int
	var height: Int
}

struct Button {
	private var text: String
	private var width: Int
	private var height: Int
	private var action: () -> Void

	// Явный инициализатор
	init(text: String, width: Int, height: Int, action: @escaping () -> Void) {
		self.text = text
		self.width = width
		self.height = height
		self.action = action
	}

	var size: Size {
		Size(width: width, height: height)
	}

	func press() {
		print("Была нажата кнопка \"\(text)\"")
		action()
	}
}

let myButton = Button(
	text: "ОК",
	width: 100,
	height: 40,
	action: {
		print("Button pressed!")
	}
)

myButton.press()

let buttonSize = myButton.size
print("Размер кнопки: \(buttonSize.width) x \(buttonSize.height)")
