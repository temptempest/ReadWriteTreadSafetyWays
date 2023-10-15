//
//  ActorService.swift
//  ThreadSafetySwiftUI
//
//  Created by temptempest on 15.10.2023.
//

import Foundation

final class ActorService: UserService {
	private var users: [Int: UserData] = [:]
	private var actor = AddUserActor()
	 func addUser(newUser: UserData) {
		Task {
			do {
				self.users = await actor.addUser(newUser: newUser)
			}
		}
	}
	func printAll() {
		print(users)
	}
	func getMethodName() -> String { "Actor method" }
}

private actor AddUserActor {
	private var users: [Int: UserData] = [:]
	func addUser(newUser: UserData) -> [Int: UserData] {
		users[newUser.id] = newUser
		return users
	}
}
