/// TCA ( The  Composable Architecture ) の最小単位で構成されたテンプレート
/// 詳しくは https://github.com/pointfreeco/swift-composable-architecture

import ComposableArchitecture
import SwiftUI

// MARK: - ReducerProtocol

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

// MARK: - View

// View層に相当
struct TCATemplateView: View {
    let store: StoreOf<TCATemplate>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            HStack {
                Button {
                    viewStore.send(.didTapCheckBox)
                } label: {
                    Image(systemName: viewStore.isComplete ? "checkmark.square" : "square")
                }
                .buttonStyle(.plain)
                
                // View → ViewStore へのアクセス: get
                // ViewStore → View へのアクセス: send
                TextField(
                    "Untitled",
                    text: viewStore.binding(get: \.description, send: TCATemplate.Action.didEditDescription)
                )
            }
            .padding()
        }
    }
}

// MARK: - Preview

struct TCATemplateView_Previews: PreviewProvider {
    static let dummy1 = TCATemplate.State(id: 0)
    
    static var previews: some View {
        TCATemplateView(
            store: Store(
                initialState: dummy1,
                reducer: TCATemplate()
            )
        )
    }
}
