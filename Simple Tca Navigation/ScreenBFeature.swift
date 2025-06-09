import Foundation
import ComposableArchitecture

@Reducer
struct ScreenBFeature {
	@ObservableState
	struct State: Equatable, Identifiable {
		let id: UUID = UUID()
		var text: String = "welcome to Screen B"
	}
	
	enum Action: Equatable {
		case navigateToCTapped
	}
	
	var body: some ReducerOf<Self> {
		Reduce { state, action in
			switch action {
			case .navigateToCTapped:
				return .none
			}
		}
	}
}
