import SwiftUI
import ComposableArchitecture

struct ScreenCView: View {
	
	@Bindable var store: StoreOf<ScreenCFeature>
	
	var body: some View {
		VStack(spacing: 16) {
			Text(store.text)
			Text("args \(store.ags)")
			Button("Back to Screen B") {
				store.send(.navigateToBButtonTapped)
			}
			Button("Back to Screen A") {
				store.send(.navigateToAButtonTapped)
			}
		}
		
	}
}

#Preview {
	ScreenCView(
		store: Store(
			initialState: ScreenCFeature.State(ags: "hello world"),
			reducer: { ScreenCFeature()})
	)
}
