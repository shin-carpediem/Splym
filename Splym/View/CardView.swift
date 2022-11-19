import ComposableArchitecture
import SwiftUI

struct CardView: View {
    let store: StoreOf<Card>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Button {
                // Action
            } label: {
                Text(String(viewStore.point))
                    .frame(width: 160, height: 120)
                    .font(.system(size: 40, weight: .bold))
//                    .foregroundColor(<#T##color: Color?##Color?#>)
                    .cornerRadius(20)
            }
        }
    }
}

// MARK: - Preview

struct CardView_Previews: PreviewProvider {
    static let dummy1 = Card.State(point: 1,
                                   backgroundImage: nil)
    
    static var previews: some View {
        CardView(
            store: Store(
                initialState: dummy1,
                reducer: Card()
            )
        )
    }
}
