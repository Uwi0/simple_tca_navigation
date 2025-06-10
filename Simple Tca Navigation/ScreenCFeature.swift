import Foundation
import ComposableArchitecture

@Reducer
struct ScreenCFeature {
	@ObservableState
	struct State: Equatable {
		let ags: String
		var text:String = "Weclome to Screen C"
	}
	
	enum Action {
		case navigateToAButtonTapped
		case navigateToBButtonTapped
	}
	
	var body: some ReducerOf<Self> {
		Reduce { state, action in
			switch action {
			case .navigateToAButtonTapped:
				return .none
			case .navigateToBButtonTapped:
				return .none
			}
		}
	}
}
