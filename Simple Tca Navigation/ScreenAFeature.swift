import Foundation
import ComposableArchitecture

@Reducer
struct ScreenAFeature {
	
	@ObservableState
	struct State: Equatable {
		var message: String = "Hello form ScreenA"
		var path = StackState<ScreenBFeature.State>()
	}
	
	enum Action {
		case path(StackActionOf<ScreenBFeature>)
		case navigateToScreenBTapped
	}
	
	var body: some ReducerOf<Self> {
		Reduce { state, action in
			switch action {
			case .path:
				return .none
			case .navigateToScreenBTapped:
				state.path.append(ScreenBFeature.State())
				return .none
			}
		}
		.forEach(\.path, action: \.path) {
			ScreenBFeature()
		}
	}
}
