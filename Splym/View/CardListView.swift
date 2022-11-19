import ComposableArchitecture
import SwiftUI

struct CardListView: View {
    let store: StoreOf<CardList>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ScrollView {
                HStack {
                    Text("members in Room ID:")
                        .font(.headline)
                        .padding()
                    
                    Button {
                        // Action
                    } label: {
                        Text("Leave")
                            .foregroundColor(.blue)
                    }
                }
                
                Spacer()
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 176))]) {
//                    ForEach() { card in
//                        CardView(store: )
//                    }
                }
                .padding()
            }
        }
    }
}

// MARK: - Preview

struct CardListView_Previews: PreviewProvider {
    static let dummy1 = CardList.State(themeColor: .purple)
    
    static var previews: some View {
        CardListView(
            store: Store(
                initialState: dummy1,
                reducer: CardList()
            )
        )
    }
}
