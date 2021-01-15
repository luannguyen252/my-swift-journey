//
//  Store.swift
//  PokeMaster
//
//  Created by huhsx on 2020/7/31.
//  Copyright © 2020 huhsx. All rights reserved.
//

import Foundation
import Combine

class Store: ObservableObject {
    
    @Published var appState = AppState()
    
    ///Reducer 的唯一职责是计算新的 State
    ///按照我们的原则，UI 不能直接改变 AppState，而需要通过发送 Action 并被 Reducer 处理
    ///首先是用来处理某个 AppAction，并 返回新的 AppState 的 Reducer
    static func reduce(state: AppState, action: AppAction) -> (AppState, AppCommand?) {
        
        var appState = state
        var appCommand: AppCommand?
        
        switch action {
        case .login(email: let email, password: let password):
            // 登录Action
            guard !appState.settings.loginRequesting else { break }
            
            appState.settings.loginRequesting = true
            
            appCommand = LoginAppCommand(email: email, password: password)
            
        case .accountBehaviorDone(result: let result):
            // 登录Action结果
            appState.settings.loginRequesting = false
            
            switch result {
            case .success(let user):
                appState.settings.loginUser = user
            case .failure(let error):
                appState.settings.loginError = error
            }
        }
        
        return (appState, appCommand)
    }
    
    ///打印了接收到的Action，这可以帮助我们在调试的时候监视具体收到了那些 Action
    func dispatch(_ action: AppAction) {
        #if DEBUG
        print("[ACTION]: \(action)")
        #endif
        let result = Store.reduce(state: appState, action: action)
        
        appState = result.0
            
        if let command = result.1 {
            #if DEBUG
            print("[COMMAND]: \(command)")
            #endif
            command.execute(in: self)
        }
    }
}
