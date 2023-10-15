//
//  UserService.swift
//  ThreadSafetySwiftUI
//
//  Created by temptempest on 15.10.2023.
//

import Foundation

protocol UserService {
	func addUser(newUser: UserData)
	func printAll()
	func getMethodName() -> String
}
