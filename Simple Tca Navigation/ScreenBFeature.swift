import Foundation
import ComposableArchitecture

@Reducer
struct ScreenBFeature {
	@ObservableState
	struct State: Equatable {
		var text: String = "welcome to B screen"
		var args: String? = nil
	}
	
	
	enum Action {
		case navigateToCButtonTapped
		case navigateToDButtonTapped
		case receivedMessageFromC(String)
	}
	
	var body: some ReducerOf<Self> {
		Reduce { state, action in
			switch action {
			case .navigateToCButtonTapped:
				state.args = nil
				return .none
			case .navigateToDButtonTapped:
				state.args = nil
				return .none
			case let .receivedMessageFromC(message):
				state.args = message
				return .none
			}
		}
	}
	
}
