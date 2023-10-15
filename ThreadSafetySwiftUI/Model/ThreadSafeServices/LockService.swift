//
//  LockService.swift
//  ThreadSafetySwiftUI
//
//  Created by temptempest on 15.10.2023.
//

import Foundation

final class LockService: UserService {
	private var users: [Int: UserData] = [:]
	private var lock = NSLock()

	func addUser(newUser: UserData) {
		lock.lock()
		users[newUser.id] = newUser
		lock.unlock()
	}
	func printAll() {
		print(users)
	}
	func getMethodName() -> String { "Lock method" }
}
