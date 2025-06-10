import Foundation
import ComposableArchitecture

@Reducer
struct ContentFeature {
	@ObservableState
	struct State: Equatable {
		var path = StackState<Path.State>()
		var featureA = ScreenAFeature.State()
	}
	
	enum Action {
		case path(StackAction<Path.State, Path.Action>)
		case featureA(ScreenAFeature.Action)
	}
	
	@Reducer(state: .equatable)
	enum Path {
		case screenB(ScreenBFeature)
		case screenC(ScreenCFeature)
		case screenD(ScreenDFeature)
	}
	
	var body: some ReducerOf<Self> {
		Scope(state: \.featureA, action: \.featureA) {
			ScreenAFeature()
		}
		
		Reduce { state, action in
			switch action {
			case .featureA(.navigateToBButtonTapped):
				state.path.append(.screenB(ScreenBFeature.State()))
				return .none
				
			case .path(.element(id: _, action: .screenB(.navigateToCButtonTapped))):
				state.path.append(.screenC(ScreenCFeature.State(ags: "Dummy args")))
				return .none
				
			case .path(.element(id: _, action: .screenB(.navigateToDButtonTapped))):
				state.path.append(.screenD(ScreenDFeature.State()))
				return .none
				
			case .path(.element(id: _, action: .screenC(.navigateToAButtonTapped))):
				state.path = StackState()
				return .none
				
			case .path(.element(id: _, action: .screenC(.navigateToBButtonTapped(let message)))):
				_ = state.path.popLast()
				if let lastId = state.path.ids.last {
					return .send(.path(.element(id: lastId, action: .screenB(.receivedMessageFromC(message)))))
				}
				return .none
				
			case .path(.element(id: _, action: .screenD(.navigateToAButtonTapped))):
				state.path = StackState()
				return .none
				
			case .path:
				return .none
			}
		}
		.forEach(\.path, action: \.path)
	}
}
