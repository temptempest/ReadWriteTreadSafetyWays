//
//  SpinLockService.swift
//  ThreadSafetySwiftUI
//
//  Created by temptempest on 15.10.2023.
//

import Foundation
//ios 10+ Deprecated
final class SpinLockService: UserService {
	private var users: [Int: UserData] = [:]
	private var mutex = OS_SPINLOCK_INIT

	func addUser(newUser: UserData) {
		OSSpinLockLock(&mutex)
		users[newUser.id] = newUser
		OSSpinLockUnlock(&mutex)
	}
	func printAll() {
		print(users)
	}
	func getMethodName() -> String { "Spin Lock method" }
}
