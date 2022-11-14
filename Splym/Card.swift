import ComposableArchitecture
import SwiftUI

// MARK: - ReducerProtocol

struct Card: ReducerProtocol {
    struct State: Equatable {
        
    }
    
    enum Action: Equatable {
        
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
            
        }
    }
}

// MARK: - View

struct CardView: View {
    let store: StoreOf<Card>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            
        }
    }
}

// MARK: - Preview

struct CardView_Previews: PreviewProvider {
    static let dummy1 = Card.State()
    
    static var previews: some View {
        CardView(
            store: Store(
                initialState: dummy1,
                reducer: Card()
            )
        )
    }
}
