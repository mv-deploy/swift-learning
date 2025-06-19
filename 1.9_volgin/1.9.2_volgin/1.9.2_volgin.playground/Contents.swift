import UIKit

let userOne: [String: Int?] = [
	"Ryan Gosling": 10,
	"Emma Stone": nil,
	"Keanu Reeves": 50,
	"Natalie Portman": 20
]

let userTwo: [String: Int?] = [
	"Ryan Gosling": 35,
	"Emma Stone": 15,
	"Robert Downey": 100,
	"Natalie Portman": nil
]

let allKeys = Array(Set(userOne.keys) .union(userTwo.keys))

var mergedUsers: [String: Int] = [:]

for key in allKeys {
	let balanceOne = userOne[key] ?? nil
	let balanceTwo = userTwo[key] ?? nil
	
	if let balanceOne, let balanceTwo {
		mergedUsers[key] = balanceOne + balanceTwo
	} else if let balanceOne {
		mergedUsers[key] = balanceOne
	} else if let balanceTwo {
		mergedUsers[key] = balanceTwo
	}
}

for userName in mergedUsers.keys.sorted(){
	if let balance = mergedUsers[userName] {
		print("\(userName): \(balance)")
	}
}
