//
//  SerialQueueService.swift
//  ThreadSafetySwiftUI
//
//  Created by temptempest on 15.10.2023.
//

import Foundation

final class SerialQueueService: UserService {
	private var users: [Int: UserData] = [:]
	private var queue = DispatchQueue(label: "SerialQueue_Service_Queue")

	func addUser(newUser: UserData) {
		queue.async {
			self.users[newUser.id] = newUser
		}
	}
	func printAll() {
		print(users)
	}
	func getMethodName() -> String { "Serial Queue method" }
}
