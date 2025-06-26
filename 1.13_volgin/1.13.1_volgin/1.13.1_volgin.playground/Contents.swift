import UIKit

enum Grade: String {
	case junior
	case middle
	case senior
}

enum Developer {
	case iOS(grade: Grade)
	case android(grade: Grade)
	
	func description() -> String {
		switch self {
		case .iOS(let grade):
			return "🍏 \(grade.rawValue) iOS-developer"
		case .android(let grade):
			return "🤖 \(grade.rawValue) Android-developer"
		}
	}
}

let developers: [Developer] = [
	.iOS(grade: .junior),
	.android(grade: .senior),
]

for dev in developers {
	print (dev.description())
}
