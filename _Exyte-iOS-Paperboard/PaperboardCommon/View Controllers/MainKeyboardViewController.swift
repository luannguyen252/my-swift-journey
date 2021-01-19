//
//  MainKeyboardViewController.swift
//  Paperboard
//
//  Created by Dmitry Shipinev on 11.12.2020.
//  Copyright © 2020 Ice Rock. All rights reserved.
//

import UIKit

class MainKeyboardViewController: UIViewController {
    
    @IBOutlet weak var inputCollectionView: UICollectionView!
    @IBOutlet weak var prevButton: KeyboardButton!
    @IBOutlet weak var nextButton: KeyboardButton!
    
    @IBOutlet weak var backspaceButton: KeyboardButton!
    @IBOutlet weak var clearButton: KeyboardButton!
    @IBOutlet weak var capsLockButton: KeyboardButton!
    @IBOutlet weak var talkButton: KeyboardButton!
    
    @IBOutlet var buttonsStackViews: [UIStackView]!
    
    let inputSource = InputCollectionDataSource()
    let inputLayout = InputCollectionLayout()
    let speechProcessor = TextToSpeechProcessor()
    
    var inputCollectionProcessor: InputCollectionProcessor!
    var inputProcessor: InputProcessor! {
        didSet {
            inputSource.inputProcessor = inputProcessor
        }
    }
    
    let settings = Settings()
    let defaultColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
    
    @IBAction private func onSpeechButtonTouched(_ sender: UIButton!) {
        UIDevice.current.playInputClick()
        speechProcessor.speechText(inputProcessor.getText())
    }
    
    @IBAction private func onClearButtonTouched(_ sender: UIButton!) {
        UIDevice.current.playInputClick()
        inputProcessor.clear()
    }
    
    @IBAction func onCapsLocktouched(_ sender: Any) {
        UIDevice.current.playInputClick()
        inputProcessor.capsLock()
        capsLockButton.isPressed = inputProcessor.isCaps()
        inputCollectionView.reloadData()
    }
    
    @IBAction private func onPrevButtonTouched(_ sender: UIButton!) {
        UIDevice.current.playInputClick()
        inputCollectionProcessor.scrollPrev(inputCollectionView)
        allowScrollInteraction(false)
    }
    
    @IBAction private func onNextButtonTouched(_ sender: UIButton!) {
        UIDevice.current.playInputClick()
        inputCollectionProcessor.scrollNext(inputCollectionView)
        allowScrollInteraction(false)
    }
    
    @IBAction private func onBackspaceButtonTouched(_ sender: UIButton!) {
        UIDevice.current.playInputClick()
        inputProcessor.backspace()
    }
    
    @IBAction func onDoneButtonTouched(_ sender: Any) {
        UIDevice.current.playInputClick()
        inputProcessor.done()
    }
    
    @IBAction func onRightButtonTouched(_ sender: Any) {
        UIDevice.current.playInputClick()
        inputProcessor.right()
    }
    
    @IBAction func onLeftButtonTouched(_ sender: Any) {
        UIDevice.current.playInputClick()
        inputProcessor.left()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputSource.numberOfColumns = settings.currentColumns
        inputSource.currentKeyboard = settings.currentKeyboard
        inputSource.setup(forCollection: inputCollectionView)
        inputLayout.inputSource = inputSource
        
        inputCollectionProcessor = InputCollectionProcessor(withSource: inputSource)
        inputCollectionProcessor.onScrollEnded = { [weak self] in
            self?.allowScrollInteraction(true)
            self?.updateButtonsTitles()
        }
        
        inputCollectionProcessor.onScrollEnded = { [weak self] in
            self?.allowScrollInteraction(true)
            self?.updateButtonsTitles()
        }
        
        inputCollectionView.collectionViewLayout = inputLayout
        inputCollectionView.delegate = inputCollectionProcessor
        inputCollectionView.allowsSelection = true
        
        inputSource.onCellSelected = { [weak self] indexPath in
            UIDevice.current.playInputClick()
            guard let source = self?.inputSource,
                  let letter = source.letter(forIndexPath: indexPath) else {
                return
            }
            let toAppend = source.printableVariant(ofLetter:  letter)
            self?.inputProcessor.append(text: toAppend)
        }
        
        settings.onColumnAmountChanged = { [weak self] newColumns in
            guard let `self` = self else {
                return
            }
            self.inputSource.numberOfColumns = newColumns
            self.updateCollection()
        }
        
        settings.onKeyboardChanged = { [weak self] newKeyboard in
            guard let `self` = self else {
                return
            }
            self.inputSource.currentKeyboard = newKeyboard
            self.updateCollection()
        }
        
        prevButton.titleLabel?.textAlignment = .center
        nextButton.titleLabel?.textAlignment = .center
        prevButton.titleLabel?.numberOfLines = 2
        nextButton.titleLabel?.numberOfLines = 2
        
        updateButtonsTitles()
    }
    
    func updateButtonsTitles() {
        let currentSection = Int(roundf(Float(inputCollectionView.contentOffset.x / inputCollectionView.frame.width)))
        let totalSections = inputSource.sections.count
        let nextSection = (currentSection + 1) % totalSections
        let prevSection = (currentSection - 1 + totalSections) % totalSections
        let titleProduce: ((Int) -> String) = { sectionNumber -> String in
            let values = self.inputSource.sections[sectionNumber].values
            if values.count < 5 {
                return values.joined(separator: ",")
            }
            return [values.prefix(2), ["..."], values.suffix(1)].flatMap({ $0 }).joined(separator: ",")
        }
        prevButton.setTitle("⬅️\n" + titleProduce(prevSection).uppercased(), for: .normal)
        nextButton.setTitle("➡️\n" + titleProduce(nextSection).uppercased(), for: .normal)
    }
    
    private func updateCollection() {
        inputLayout.prepare()
        inputCollectionView
            .reloadData()
        inputCollectionView.setCollectionViewLayout(inputLayout, animated: false)
        inputCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: false)
        updateButtonsTitles()
    }
    
    private func allowScrollInteraction(_ allowed: Bool) {
        prevButton.isUserInteractionEnabled = allowed
        nextButton.isUserInteractionEnabled = allowed
    }
    
    func setColorScheme(_ colorScheme: PaperboardColorScheme) {
        let colorScheme = PaperboardColors(colorScheme: colorScheme)
        
        inputSource.colorScheme = colorScheme
        view.backgroundColor = colorScheme.backgroundColor
        inputCollectionView.backgroundColor = colorScheme.backgroundColor
        
        for view in view.subviews {
            if let button = view as? KeyboardButton {
                configure(button: button, colorScheme: colorScheme)
            }
        }
        
        for cell in inputCollectionView.visibleCells {
            if let inputCell = cell as? InputCollectionViewCell {
                configure(button: inputCell.characterButton, colorScheme: colorScheme)
            }
        }
        
        configure(button: clearButton, colorScheme: colorScheme)
        configure(button: backspaceButton, colorScheme: colorScheme)
        configure(button: capsLockButton, colorScheme: colorScheme)
        configure(button: talkButton, colorScheme: colorScheme)
    }
    
    func configure(button: KeyboardButton, colorScheme: PaperboardColors) {
        button.setTitleColor(colorScheme.buttonTextColor, for: [])
        button.tintColor = colorScheme.buttonTextColor
        
        button.defaultBackgroundColor = colorScheme.buttonBackgroundColor
        button.highlightBackgroundColor = colorScheme.buttonHighlightColor
    }
}
