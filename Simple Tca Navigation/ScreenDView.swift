import SwiftUI
import ComposableArchitecture

struct ScreenDView: View {
	@Bindable var store: StoreOf<ScreenDFeature>
    var body: some View {
		 VStack(spacing: 16) {
			 Text(store.text)
			 Button("Back to Screen A") {
				 store.send(.navigateToAButtonTapped)
			 }
		 }
    }
}

#Preview {
    ScreenDView(
		store: Store(initialState: ScreenDFeature.State()){
			
		}
	 )
}
