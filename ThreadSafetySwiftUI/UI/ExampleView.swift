//
//  ExampleView.swift
//  ThreadSafetySwiftUI
//
//  Created by temptempest on 15.10.2023.
//

import SwiftUI

struct ExampleView: View {
	@StateObject var viewModel: ExampleViewModel
	var body: some View {
		VStack {
			Text(viewModel.getMethodName())
				.padding()
				.font(.title)
				.monospaced()
			Button(action: {
				viewModel.printResult()
			}, label: {
				Text("Print Results")
					.font(.title3)
					.monospaced()
			})
			.onAppear() {
				viewModel.startTest()
			}
		}
	}
}

#Preview {
	ExampleView(viewModel: ExampleViewModel(service: ActorService()))
}
