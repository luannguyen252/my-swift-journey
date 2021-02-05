//
//  CameraAppController.swift
//  SimpleCameraApp
//
//  Created by RyoNishimura on 2020/09/05.
//  Copyright © 2020 RyoNishimura. All rights reserved.
//

import Foundation  // String型にstring(contentsOfFile:)/writeToFile(path:.atomically:,encoding:)などのテキストファイルに関する操作機能が追加
import AVKit // メディアコンテンツを有効化
import Combine // イベントの発行と購読を有効化

// Viewからのイベントを受けて、Interactorにデータ作成を依頼し、作られたデータをViewに通知する

final class CameraAppController: ObservableObject {
    enum Inputs {
        case onAppear
        case tappedCameraButton
        case tappedCloseButton
        case onDisappear
    }

    init() {
        model.setupAVCaptureSession()
        bind()
    }

    deinit {
        canseables.forEach { (cancellable) in
            cancellable.cancel() // タスクを停止させる
        }
    }

    var previewLayer: CALayer {
        return model.previewLayer!
    }

    @Published var photoImage: UIImage = UIImage()
    @Published var showSheet: Bool = false

    func apply(inputs: Inputs) {
        switch inputs {
            case .onAppear: // Viewが表示された時に実行するアクション
                model.startSettion()
            break
            case .tappedCameraButton:
                model.takePhoto()
            case .tappedCloseButton:
                showSheet = false
            case .onDisappear:
              model.stopSettion()
        }
    }

    // MARK: Privates
    private let model = CameraAppModel()
    private var canseables: [Cancellable] = []

    private func bind() {
        let photoImageObserver = model.$photoImage.sink { (image) in  // .sink:イベントを”引数”として購読することができる
            if let image = image {
                self.photoImage = image
            }
        }
        canseables.append(photoImageObserver)

        let showPhotoObserver = model.$showPhoto.assign(to: \.showSheet, on: self) // .assign:イベントを"別の変数として代入"して購読する
        canseables.append(showPhotoObserver)
    }
}

