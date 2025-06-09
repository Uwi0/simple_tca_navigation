import Foundation
import ComposableArchitecture

@Reducer
struct ContentFeature {
	@ObservableState
	struct State {
		var screenA = ScreenAFeature.State()
	}
	
	
	@Reducer(state: .equatable)
	enum Path {
		case b(ScreenBFeature)
	}
}
