import SwiftUI
import ComposableArchitecture

struct ScreenB: View {
	
	@Bindable var store: StoreOf<ScreenBFeature>
	
	var body: some View {
		VStack(spacing: 16) {
			Text(store.text)
			
			Button("Go to C") {
				store.send(.navigateToCTapped)
			}
		}
	}
}

#Preview {
	ScreenB(store: Store(
		initialState: ScreenBFeature.State(),
		reducer: { ScreenBFeature()})
	)
}
