import SwiftUI
import ComposableArchitecture

struct ScreenA: View {
	
	@Bindable var store: StoreOf<ScreenAFeature>
	
	var body: some View {
		NavigationStackStore(self.store.scope(state: \.path, action: \.path)) {
			VStack(spacing: 16) {
				Text(store.message)
				Button("Click to navigate to Screen B") {
					store.send(.navigateToScreenBTapped)
				}
			}
		} destination: { store in
			ScreenB(store: store)
		}
		
	}
}

#Preview {
	ScreenA(store: Store(initialState: ScreenAFeature.State(), reducer: { ScreenAFeature()}))
}
