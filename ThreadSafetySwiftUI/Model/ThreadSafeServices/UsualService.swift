//
//  UsualService.swift
//  ThreadSafetySwiftUI
//
//  Created by temptempest on 15.10.2023.
//

import Foundation
// This is question broken implementation
final class UsualService: UserService {
	private var users: [Int: UserData] = [:]
	func addUser(newUser: UserData) {
		users[newUser.id] = newUser
	}
	func printAll() {
		print(users)
	}
	func getMethodName() -> String { "Usual method (Always Broken)" }
}
