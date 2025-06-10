import Foundation
import ComposableArchitecture

@Reducer
struct ScreenAFeature {
	
	@ObservableState
	struct State: Equatable {
		var message: String = "welcome to screen A"
	}
	
	enum Action {
		case navigateToBButtonTapped
	}
	
	var body: some ReducerOf<Self> {
		Reduce { state, action in
			switch action {
			case .navigateToBButtonTapped:
				return .none
			}
		}
	}
}
