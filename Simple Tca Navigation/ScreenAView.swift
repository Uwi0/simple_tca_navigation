import SwiftUI
import ComposableArchitecture

struct ScreenAView: View {
	
	@Bindable var store: StoreOf<ScreenAFeature>
	
	var body: some View {
		VStack(spacing: 16) {
			Text(store.message)
			Button("navigate to Screen B") {
				store.send(.navigateToBButtonTapped)
			}
		}
	}
}

#Preview {
	ScreenAView(store: Store(initialState: ScreenAFeature.State(), reducer: { ScreenAFeature()}))
}
