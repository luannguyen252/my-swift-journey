//
//  CameraAppView.swift
//  SimpleCameraApp
//
//  Created by RyoNishimura on 2020/09/05.
//  Copyright © 2020 RyoNishimura. All rights reserved.
//

import SwiftUI

extension CALayer: ObservableObject {}

// アプリの大本となる画面
struct CameraAppView: View {
    @ObservedObject
    var controller: CameraAppController
    var body: some View {
        /*
         ZStackを.edgesIgnoringSafeArea(.all)にすることで、SafeAreaを無視した全画面表示にする。
         CALyerView（CALayerを加えたViewController）をZStackに追加
         */
        ZStack {
            CALayerView(caLayer: controller.previewLayer)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            self.controller.apply(inputs: .onAppear)
        }
        .onDisappear {
            self.controller.apply(inputs: .onDisappear)
        }
        .sheet(isPresented: $controller.showSheet) {
            VStack {
                Image(uiImage: self.controller.photoImage)
                .resizable()
                .frame(width: 200, height: 200)
                Button(action: {
                    self.controller.apply(inputs: .tappedCloseButton)
                }) {
                    Text("Close")
                }
            }
        }
    }
}

struct CameraAppView_Previews: PreviewProvider {
    static var previews: some View {
        CameraAppView(controller: CameraAppController())
    }
}

/*
 AVFundationはカメラからの映像をキャプチャするのん"AVCaptureVideoPreviewLayer"という型が用意されている。
 "AVCaptureVideoPreviewLayer"は"CALayer"(描画コンテンツをモデルオブジェクトとして管理する)のサブクラスで、これを通してカメラの映像をViewに表示できる。
 CALayerは、UIKitに含まれるサブクラスのため、SwiftUIでCALayerをSwiftUIで表示するため、UIViewControllerRepresentableに準拠したCALayerView（Viewの1つ）を作成する。
 */

struct CALayerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    var caLayer: CALayer

    // ViewControllerを作成してCALyerを追加
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        viewController.view.layer.addSublayer(caLayer)
        caLayer.frame = viewController.view.layer.frame // calayerのframeはviewのlayerに合わせる
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        caLayer.frame = uiViewController.view.layer.frame
    }
}
