import ComposableArchitecture
import SwiftUI

@main
struct SplymApp: App {
    var body: some Scene {
        WindowGroup {
            CardListView(
                store: Store(
                    initialState: CardList.State(themeColor: .purple),
                    reducer: CardList()._printChanges()
                )
            )
        }
    }
}
