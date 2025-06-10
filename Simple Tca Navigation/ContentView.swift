import SwiftUI
import ComposableArchitecture

struct ContentView: View {
	
	@Bindable var store: StoreOf<ContentFeature>
	
	var body: some View {
		NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
			ScreenAView(store: store.scope(state: \.featureA, action: \.featureA))
		} destination: { state in
			switch state.case {
			case .screenB(let store):
				ScreenBView(store: store)
			case .screenC(let store):
				ScreenCView(store: store)
			case .screenD(let store):
				ScreenDView(store: store)
			}
		}
	}
}
