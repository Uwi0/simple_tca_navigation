import SwiftUI
import ComposableArchitecture

@main
struct SimpleTCANavigationStackApp: App {
	
	static let store = Store(initialState: ContentFeature.State()) {
			  ContentFeature()
		 }

		 var body: some Scene {
			  WindowGroup {
					ContentView(store: SimpleTCANavigationStackApp.store)
			  }
		 }
}
