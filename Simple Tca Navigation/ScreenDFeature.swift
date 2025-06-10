import Foundation
import ComposableArchitecture

@Reducer
struct ScreenDFeature {
	@ObservableState
	struct State: Equatable {
		var text: String = "hello from D screen"
	}
	
	enum Action {
		case navigateToAButtonTapped
	}
	
	var body: some ReducerOf<Self> {
		Reduce { state, action in
			switch action {
			case .navigateToAButtonTapped:
				return .none
			}
		}
	}
}
