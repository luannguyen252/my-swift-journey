//
//  PreferencesView.swift
//  PropertyWrappersDemo
//
//  Created by Alfian Losari on 10/11/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import SwiftUI

struct PreferencesView: View {
    
    @ObservedObject var form = PreferencesForm()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User Defaults property Wrapper to persists user data using UserDefaults API")) {
                    HStack {
                        Text("nickname")
                        Spacer()
                        TextField("Nickname", text: $form.nickname)
                    }
                }
                
                Section {
                    HStack {
                        Stepper("Highest Score", value: $form.highestScore)
                        Text(String(form.highestScore))
                    }
                    HStack {
                        Stepper("Gameplay Speed", value: $form.gamePlaySpeed)
                        Text("\(String(form.gamePlaySpeed))Xs")
                    }
                }
                
                Section {
                    Toggle(isOn: $form.isCheatEnabled) {
                        Text("Enable Cheat")
                    }
                    Toggle(isOn: $form.isNoRandomBattleEnabled) {
                        Text("No Random Battle")
                    }
                    Toggle(isOn: $form.isGodModeEnabled) {
                        Text("Enable God mode")
                    }
                    Toggle(isOn: $form.isSephirothEnabledInParty) {
                        Text("Enable Sephiroth in party")
                    }
                }
            }
            .navigationBarTitle("Preferences Wrapper")
        }
    }
}
