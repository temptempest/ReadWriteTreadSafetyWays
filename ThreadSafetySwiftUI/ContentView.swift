//
//  ContentView.swift
//  ThreadSafetySwiftUI
//
//  Created by temptempest on 15.10.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		NavigationView{
			VStack {
				NavigationLink(destination: ExampleView(viewModel: ExampleViewModel(service: UsualService()))) {
					Text("Usual way (Broken) - its Question Problem")
				}
				.customStyle()
				NavigationLink(destination: ExampleView(viewModel: ExampleViewModel(service: MutexService()))) {
					Text("Mutex way")
				}
				.customStyle()
				NavigationLink(destination: ExampleView(viewModel: ExampleViewModel(service: LockService()))) {
					Text("Lock way")
				}
				.customStyle()
				NavigationLink(destination: ExampleView(viewModel: ExampleViewModel(service: SpinLockService()))) {
					Text("Spin Lock way")
				}
				.customStyle()
				NavigationLink(destination: ExampleView(viewModel: ExampleViewModel(service: UnfairLockService()))) {
					Text("Unfair Lock way")
				}
				.customStyle()
				NavigationLink(destination: ExampleView(viewModel: ExampleViewModel(service: SemaphoreService ()))) {
					Text("Semaphore way")
				}
				.customStyle()
				NavigationLink(destination: ExampleView(viewModel: ExampleViewModel(service: SerialQueueService  ()))) {
					Text("Serial Queue way")
				}
				.customStyle()
				NavigationLink(destination: ExampleView(viewModel: ExampleViewModel(service: ConcurrentQueueService()))) {
					Text("Concurrent Queue way")
				}
				.customStyle()
				NavigationLink(destination: ExampleView(viewModel: ExampleViewModel(service: ActorService()))) {
					Text("Actor way (Simpliest)")
				}
				.customStyle()
			}
		}
    }
}

extension View {
	func customStyle() -> some View {
		modifier(MyModifier())
	}
}

struct MyModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.padding(16)
			.font(Font.system(size: 17, weight: .semibold, design: .monospaced))
			.frame(width: 300)
			.background(.gray.opacity(0.12))
			.clipShape(RoundedRectangle(cornerRadius: 15))
	}
}

#Preview {
    ContentView()
}
