//
//  CameraAppModel.swift
//  SimpleCameraApp
//
//  Created by RyoNishimura on 2020/09/05.
//  Copyright © 2020 RyoNishimura. All rights reserved.
//

import Foundation
import AVKit

final class CameraAppModel: NSObject, ObservableObject {
    private let captureSession = AVCaptureSession() // 入力デバイスからメディアを出力するデータの流れを管理
    @Published var previewLayer: AVCaptureVideoPreviewLayer? // キャプチャされたビデオを表示するコアアニメーションレイヤー（CALyerのサブクラス）
    private var captureDevice: AVCaptureDevice? // ハードウェア固有のキャプチャ機能を管理する
    @Published var showPhoto: Bool = false
    @Published var photoImage: UIImage?

    // captureSessionの準備
    /// - Tag: CreateCaptureSession
     func setupAVCaptureSession() {
         print(#function) // 「#function」はメソッド名を返すリテラル
         captureSession.sessionPreset = .photo // 画質(高解像度の写真品質出力)の設定
        
        /*
         端末で利用できるデバイス（カメラ）を取得する
         
        　使用可能なキャプチャデバイスを見つけて監視するためのクエリ
        　カメラの種類は”広角カメラ(builtInWideAngleCamera)”、メディアの種類に”描画(video)”
          devices:取得したデバイスのセッションから利用可能なデバイスを取得するメソッド
        */
         if let availableDevice = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .back).devices.first {
             captureDevice = availableDevice
         }

        // 背面の広角カメラ（captureDevice）をAVCaptureSession()のセッションに追加しプログラムの管理下にする
         do {
            // AVCaptureDeviceInput:キャプチャデバイスからキャプチャセッションにメディアを提供するキャプチャ入力
             let captureDeviceInput = try AVCaptureDeviceInput(device: captureDevice!)
             captureSession.addInput(captureDeviceInput) // メディア出力のセッションに追加
         } catch let error {
             print(error.localizedDescription)
         }

        // captureSessionの映像をCALayerとして表示する
         let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
         previewLayer.name = "CameraPreview"
        /*
         videoGravityは、AVCaptureVideoPreviewLayer（キャプチャされたビデオを表するコアアニメーションレイヤー）の表示領域をどう表示するか決める。
         - resizeAspect:アスペクト比をレイヤーないに治るように保持する。デフォルト値。
         - resizeAspectFill:アスペクト比をたもっったままレイヤー短形いっぱいに表示する
         - resize:アスペクト比を無視し、レイヤー短形いっぱいに表示する。
         
        　AVLayerVideoGravity:レイヤーの境界短形内でのビデオの表示方法を定義する
         */
         previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
         previewLayer.backgroundColor = UIColor.black.cgColor
         self.previewLayer = previewLayer

        // AVCaptureVideoDataOutput:ビデオを記録し、処理のためのビデオフレムへのアクセスを提供するキャプチャ出力
         let dataOutput = AVCaptureVideoDataOutput()
        // videoSettings:出力の圧縮設定(32bitBGRAデータを配列にまとめる)
         dataOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String:kCVPixelFormatType_32BGRA]

         if captureSession.canAddOutput(dataOutput) {  // canAddOutput():特定の出力をセッションに追加できるかどうかを示すbool値を返す
             captureSession.addOutput(dataOutput)  // addOutput():指定された出力をセッションに追加する
         }
         captureSession.commitConfiguration() // 変更した構成内容をコミット（保存）する
     }
    

    func startSettion() {
        if captureSession.isRunning { return }  // アニメーョンが実行されているかどうかを返すbool値
        captureSession.startRunning() // startRunning():レシーバー(captureSession)に処理を実行するように命令する
    }

    func stopSettion() {
        if !captureSession.isRunning { return }
        captureSession.stopRunning() // stopRunning():レシーバーに処理を停止するように命令する
    }

    func takePhoto() {
        showPhoto = true
    }

    
    // UIDeviceOrientation:デバイスの物理的な向き
    private func exifOrientationForDeviceOrientation(_ deviceOrientation: UIDeviceOrientation) -> UIImage.Orientation {

        switch deviceOrientation {
        case .portraitUpsideDown: // デバイスは縦向きモードだが、デバイスが直立しており、ホームボタンが上部にある
            return .rightMirrored // 元画像を反時計回りに90度回転

        case .landscapeLeft: // デバイスは横向きモードで、デバイスが直立しており、ホームボタンが右側にある
            return .downMirrored // 元画像を垂直方向に反転

        case .landscapeRight: // デバイスは横向きモードで、デバイスが直立しており、ホームボタンが左側にある
            return .upMirrored // 元画像を水平方向に反転

        default:
            return .leftMirrored // 元画像を時計回りに90度回転、水平に反転
        }
    }
    private func exifOrientationForCurrentDeviceOrientation() -> UIImage.Orientation {
        return exifOrientationForDeviceOrientation(UIDevice.current.orientation)
    }
}

/*
 AVCaptureVideoDataOutputSampleBufferDelegate:ビデオデータ出力からサンプルバッファを受け取り、そのステータスを監視する方法
 AVCaptureOutput:キャプチャセッションで記録されたメディアを出力するオブジェクトの抽象スーパークラス
 CMSampleBuffer:均一なメディアタイプのメディアサンプルを0個以上含むオブジェクト
 AVCaptureConnection:キャプチャセッションでのキャプチャ入力オブジェクトとキャプチャ出力オブジェクトの特定のペア間の接続
 */
extension CameraAppModel: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didDrop sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        if showPhoto {
            showPhoto = false
            if let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) {  // メディアデータのサンプルバッファを返す
                let ciImage = CIImage(cvPixelBuffer: pixelBuffer) //CoreImage(静止画像とビデオ画像を処理するAPI)によって、生成される画像
                let context = CIContext() // 画像処理結果をレンタリング、画像分析を実行するための評価コンテキスト

                let imageRect = CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(pixelBuffer), height: CVPixelBufferGetHeight(pixelBuffer))
                
                // createCGImage():CoreImage画像オブジェクトの領域からQuartz2D画像を生成
                if let image = context.createCGImage(ciImage, from: imageRect) {
                    photoImage = UIImage(cgImage: image, scale: UIScreen.main.scale, orientation: exifOrientationForCurrentDeviceOrientation())
                }
            }
        }
    }
}

