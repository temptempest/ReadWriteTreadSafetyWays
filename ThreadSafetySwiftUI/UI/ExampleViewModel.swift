//
//  ExampleViewModel.swift
//  ThreadSafetySwiftUI
//
//  Created by temptempest on 15.10.2023.
//

import Foundation

class ExampleViewModel: ObservableObject {
	private var service: UserService
	
	init(service: UserService) {
		self.service = service
	}
	
	
	func startTest() {
		DispatchQueue.concurrentPerform(iterations: 10) { index in
			self.addUserIndex(index: index)
		}
	}
	
	func printResult() {
		service.printAll()
	}
	
	func getMethodName() -> String {
		service.getMethodName()
	}
	
}

extension ExampleViewModel {
	func addUserIndex(index: Int) {
		let user = UserData(id: index, name: "user \(index)")
		service.addUser(newUser: user)
	}
}
