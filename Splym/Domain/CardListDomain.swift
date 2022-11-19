import ComposableArchitecture
import SwiftUI

struct CardList: ReducerProtocol {
    struct State: Equatable {
        /// ID
        let id: String = UUID().uuidString
        
        /// テーマカラー
        let themeColor: Color
        
        /// カード一覧
        let cardList: [Card.State] = []
    }
    
    enum Action: Equatable {
        /// カードを選択した
        case didSelectCard
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .didSelectCard:
            return .none
        }
    }
}
