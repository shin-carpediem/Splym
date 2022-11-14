/// TCA ( The  Composable Architecture ) の最小単位で構成されたテンプレート
/// 詳しくは https://github.com/pointfreeco/swift-composable-architecture

import ComposableArchitecture
import SwiftUI

struct TCATemplate: ReducerProtocol {
    // ViewModelに相当
    struct State: Equatable {
        /// ID
        let id: Int
        
        /// 完了か
        var isComplete = false
        
        /// 説明文
        var description = ""
    }
    
    // Presentationプロトコルに相当
    enum Action: Equatable {
        /// チェックボックスをタップした
        case didTapCheckBox
        
        /// description を変更した
        case didEditDescription(String)
    }
    
    // Presentation層に相当
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .didTapCheckBox:
            state.isComplete.toggle()
            return .none
            
        case let .didEditDescription(description):
            state.description = description
            return .none
        }
    }
}
