import ComposableArchitecture
import SwiftUI

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
