//
//  SettingsProcessor.swift
//  Paperboard
//
//  Created by Andrey Tchernov on 17.08.2018.
//  Copyright © 2018 Ice Rock. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class SettingsProcessor: NSObject {
    
    private let settings: Settings
    
    init(settings: Settings) {
        self.settings = settings
    }
    
    func showSettings(onController controller: UIViewController, byBarButton barButton: UIBarButtonItem) {
        let settingsAlert = UIAlertController(
            title: NSLocalizedString("settings.title", comment: ""),
            message: nil,
            preferredStyle: .actionSheet
        )
        settingsAlert.view.tintColor = #colorLiteral(red: 0.9843137255, green: 0.8, blue: 0.1882352941, alpha: 1)
        settingsAlert.addAction(
            UIAlertAction(
                title: NSLocalizedString("settings.dialog.columns", comment: ""),
                style: .default,
                handler: { _ in
                    self.showColumnsSetting(onController: controller)
                })
        )
        settingsAlert.addAction(
            UIAlertAction(
                title: NSLocalizedString("settings.dialog.keyboard", comment: ""),
                style: .default,
                handler: { _ in
                    self.showKeyboardSettings(atBarButton: barButton)
                })
        )
        settingsAlert.addAction(
            UIAlertAction(
                title: NSLocalizedString("settings.dialog.cancel", comment: ""),
                style: .cancel,
                handler: nil
            )
        )
        
        settingsAlert.popoverPresentationController?.barButtonItem = barButton
        controller.present(settingsAlert, animated: true, completion: nil)
    }
    
    private func showKeyboardSettings(atBarButton barButton: UIBarButtonItem) {
        guard !settings.keyboards.isEmpty else {
            return
        }
        var keyboardTitles = settings.keyboards.map({ "\($0.voiceName) - \(NSLocale.current.localizedString(forLanguageCode: $0.locale) ?? "settings.keyboard.unknownLanguage") (\($0.locale))"})
        keyboardTitles.insert("settings.keyboard.default", at: 0)
        
        let index = settings.keyboards.index(where: { $0.voiceId == settings.currentKeyboard?.voiceId }) ?? 0
        let picker = ActionSheetStringPicker(
            title: "settings.keyboard.title",
            rows: keyboardTitles,
            initialSelection: index,
            doneBlock: { (picker, newIndex, newValue) in
                self.settings.currentKeyboard = newIndex == 0 ? nil : self.settings.keyboards[newIndex - 1]
            },
            cancel: { _ in },
            origin: barButton)
        picker?.popoverDisabled = true
        picker?.show()
    }
    
    private func showColumnsSetting(onController controller: UIViewController) {
        let setColumnsVC = SetColumnsViewController.create()
        setColumnsVC.initialValue = settings.currentColumns
        setColumnsVC.onAmountChanges = { newValue in
            self.settings.currentColumns = newValue
        }
        controller.present(setColumnsVC, animated: false, completion: nil)
    }
}
