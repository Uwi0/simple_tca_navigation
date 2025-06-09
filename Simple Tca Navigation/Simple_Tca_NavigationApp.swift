import SwiftUI
import ComposableArchitecture

@main
struct Simple_Tca_NavigationApp: App {
	
	static let store = Store(initialState: ScreenAFeature.State(), reducer: { ScreenAFeature() })
	
    var body: some Scene {
        WindowGroup {
            ScreenA(store: Simple_Tca_NavigationApp.store)
        }
    }
}
