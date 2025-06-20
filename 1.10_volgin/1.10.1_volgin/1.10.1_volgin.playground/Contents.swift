import UIKit

let dates: [String] = ["29.04.2021", "30.04.2021", "02.05.2021", "30.04.2021"]
let steps: [Int] = [9381, 4618, 12373, 3338]

var stepsPerDate: [String: Int] = [:]

let minCount = min(dates.count, steps.count)

for i in 0..<dates.count {
	let date = dates[i]
	let stepCount = i < steps.count ? steps[i] : 0
	
	if let existing = stepsPerDate[date] {
		stepsPerDate[date] = existing + stepCount
	} else {
		stepsPerDate[date] = stepCount
	}
}

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd.MM.yyyy"

let sortedDates = stepsPerDate.keys.sorted {
	guard let d1 = dateFormatter.date(from: $0),
		  let d2 = dateFormatter.date(from: $1) else {
		return false
	}
	return d1 < d2
}

var stringToPrint: [String] = []

for date in sortedDates {
	if let steps = stepsPerDate[date] {
		let line = "(date: \"\(date)\", steps: \(steps))"
		stringToPrint.append(line)
	}
}

let finalOutput = "[\n" + stringToPrint.joined(separator: ",\n") + "\n]"
print(finalOutput)
