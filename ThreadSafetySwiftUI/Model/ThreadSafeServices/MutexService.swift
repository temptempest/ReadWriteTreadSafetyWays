//
//  MutexService.swift
//  ThreadSafetySwiftUI
//
//  Created by temptempest on 15.10.2023.
//

import Foundation

final class MutexService: UserService {
	private var users: [Int: UserData] = [:]
	private var mutex = pthread_mutex_t()
	
	init() {
		pthread_mutex_init(&mutex, nil)
	}
	
	func addUser(newUser: UserData) {
		pthread_mutex_lock(&mutex)
		users[newUser.id] = newUser
		pthread_mutex_unlock(&mutex)
	}
	func printAll() {
		print(users)
	}
	func getMethodName() -> String { "Mutex method" }
}
