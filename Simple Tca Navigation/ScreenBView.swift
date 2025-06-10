import SwiftUI
import ComposableArchitecture

struct ScreenBView: View {
	
	@Bindable var store: StoreOf<ScreenBFeature>
	
	var body: some View {
		VStack(spacing: 16) {
			Text(store.text)
			
			Button("Go to C") {
				store.send(.navigateToCButtonTapped)
			}
			
			Button("Go to D") {
				store.send(.navigateToDButtonTapped)
			}
		}
	}
}

#Preview {
	ScreenBView(store: Store(
		initialState: ScreenBFeature.State(),
		reducer: { ScreenBFeature()})
	)
}
