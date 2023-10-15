//
//  UnfairLockService.swift
//  ThreadSafetySwiftUI
//
//  Created by temptempest on 15.10.2023.
//

import Foundation

final class UnfairLockService: UserService {
	private var users: [Int: UserData] = [:]
	private var mutex = os_unfair_lock()

	func addUser(newUser: UserData) {
		os_unfair_lock_lock(&mutex)
		users[newUser.id] = newUser
		os_unfair_lock_unlock(&mutex)
	}
	func printAll() {
		print(users)
	}
	func getMethodName() -> String { "Unfair Lock method" }
}
