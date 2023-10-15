//
//  ConcurrentQueueService.swift
//  ThreadSafetySwiftUI
//
//  Created by temptempest on 15.10.2023.
//

import Foundation

final class ConcurrentQueueService: UserService {
	private var users: [Int: UserData] = [:]
	private var queue = DispatchQueue(label: "ConcurrentQueue_Service_Queue", attributes: .concurrent)

	func addUser(newUser: UserData) {
		queue.async(flags: .barrier) {
			self.users[newUser.id] = newUser
		}
	}
	func printAll() {
		print(users)
	}
	func getMethodName() -> String { "Concurrent Queue method" }
}
