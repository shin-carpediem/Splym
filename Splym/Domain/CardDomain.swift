import ComposableArchitecture
import SwiftUI

struct Card: ReducerProtocol {
    struct State: Equatable {
        /// ID
        let id: String = UUID().uuidString
        
        /// 見積もりポイント
        let point: Int
        
        /// 背景画像
        let backgroundImage: Image?
    }
    
    enum Action: Equatable {
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
    }
}
