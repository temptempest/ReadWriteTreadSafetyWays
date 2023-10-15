//
//  SemaphoreService.swift
//  ThreadSafetySwiftUI
//
//  Created by temptempest on 15.10.2023.
//

import Foundation

final class SemaphoreService: UserService {
	private var users: [Int: UserData] = [:]
	private var semaphore = DispatchSemaphore(value: 1)

	func addUser(newUser: UserData) {
			//priority inversion problem
			semaphore.wait()
			users[newUser.id] = newUser
			semaphore.signal()
	}
	func printAll() {
		print(users)
	}
	func getMethodName() -> String { "Semaphore method" }
}
