


import SwiftUI
import UIKit
import AVFoundation
import os.log


fileprivate let logger = Logger(subsystem: "ContentView", category: "")


fileprivate var captureSession = AVCaptureSession()
fileprivate var photoCaptureOutput = AVCapturePhotoOutput()
fileprivate var photoCaptureDelegate = PhotoCaptureDelegate()



struct ContentView: View {
    
    @State var captureIsRunning: Bool = true
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                // Authorization
                Group {
                    let authorization = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
                    if authorization == .authorized {
                        Text("Authorized")
                    } else if authorization == .denied {
                        Text("Denied")
                    } else if authorization == .notDetermined {
                        Text("Not Determined")
                    } else if authorization == .restricted {
                        Text("Restricted")
                    }
                }
                .font(Font.body.weight(.semibold))
                
                Spacer()
                
                // Start / Stop
                Button(action: {
                    if captureSession.isRunning {
                        captureSession.stopRunning()
                    } else {
                        captureSession.startRunning()
                    }
                    
                    withAnimation(.easeInOut) {
                        captureIsRunning = captureSession.isRunning
                    }
                    
                }, label: {
                    Image(systemName: captureIsRunning ? "face.dashed.fill" : "face.dashed")
                        .resizable()
                        .frame(width: 28.0, height: 28.0)
                        .foregroundColor(captureIsRunning ? Color.red : Color.primary)
                })
                
            }
            .padding()
            
            
            // Camera View
            ZStack {
                
                //CameraView(deviceType: .builtInTrueDepthCamera, cameraPosition: .front)
                CameraView(deviceType: .builtInDualCamera, cameraPosition: .back)
                    .onTapGesture {
                        capturePhoto()
                    }
                    .saturation(captureIsRunning ? 1.0 : 0.0)
                
            }
            
            
        }
        
    }
    
    
    private func capturePhoto() {
        
        logger.debug("Capture Photo")
        
        let settings = AVCapturePhotoSettings()
        settings.isHighResolutionPhotoEnabled = true
        
        photoCaptureOutput.capturePhoto(with: settings, delegate: photoCaptureDelegate)
        
    }
    
    
}



// MARK: - CameraView: UIView

final class CameraUIView: UIView {
    
    var deviceType: AVCaptureDevice.DeviceType
    var cameraPosition: AVCaptureDevice.Position
    var videoGravity: AVLayerVideoGravity = .resizeAspectFill
    
    init(deviceType dt: AVCaptureDevice.DeviceType, cameraPosition cp: AVCaptureDevice.Position) {
        
        self.deviceType = dt
        self.cameraPosition = cp
        
        super.init(frame: .zero)
        
        // Request Access
        var accessAllowed = false
        let blocker = DispatchGroup()
        blocker.enter()
        AVCaptureDevice.requestAccess(for: .video) {
            access in
            accessAllowed = access
            blocker.leave()
        }
        blocker.wait()
        
        guard accessAllowed else {
            logger.debug("No camera access")
            return
        }
        
        // Setup Session
        let session = captureSession
        session.beginConfiguration()
        session.sessionPreset = AVCaptureSession.Preset.photo
        
        // Device
        guard let videoDevice = AVCaptureDevice.default(self.deviceType, for: .video, position: self.cameraPosition) else {
            logger.debug("No video device")
            return
        }
        
        // Input
        guard let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice) else {
            logger.debug("Unable to determine video device input")
            return
        }
        
        guard session.canAddInput(videoDeviceInput) else {
            logger.debug("Unable to add session input")
            return
        }
        session.addInput(videoDeviceInput)
        
        // Output
        if session.canAddOutput(photoCaptureOutput) {
            photoCaptureOutput.isHighResolutionCaptureEnabled = true
            photoCaptureOutput.isLivePhotoCaptureEnabled = photoCaptureOutput.isLivePhotoCaptureSupported
            session.addOutput(photoCaptureOutput)
        } else {
            logger.debug("Unable to add output")
        }
        
        // Finalize
        session.commitConfiguration()
        captureSession = session
        
    }
    
    override class var layerClass: AnyClass {
        AVCaptureVideoPreviewLayer.self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return self.layer as! AVCaptureVideoPreviewLayer
    }
    
    override func didMoveToSuperview() {
        
        super.didMoveToSuperview()
        
        if nil != self.superview {
            self.videoPreviewLayer.session = captureSession
            self.videoPreviewLayer.videoGravity = self.videoGravity
            captureSession.startRunning()
        } else {
            captureSession.stopRunning()
        }
        
    }
}



// MARK: - CameraView: SwiftUI Proxy

struct CameraView: UIViewRepresentable {
    
    typealias UIViewType = CameraUIView
    
    var deviceType: AVCaptureDevice.DeviceType
    var cameraPosition: AVCaptureDevice.Position
    
    func makeUIView(context: UIViewRepresentableContext<CameraView>) -> CameraUIView {
        return CameraUIView(deviceType: self.deviceType, cameraPosition: self.cameraPosition)
    }
    
    func updateUIView(_ uiView: CameraUIView, context: UIViewRepresentableContext<CameraView>) {
    }
    
}


// MARK: - Capture Delegate
class PhotoCaptureDelegate: NSObject, AVCapturePhotoCaptureDelegate {
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        if let error = error {
            logger.error("Error: \(error.localizedDescription)")
            return
        }
        
        guard let data = photo.fileDataRepresentation() else {
            logger.debug("Unable to determine photo data.")
            return
        }
        
        guard let image = UIImage(data: data) else {
            logger.debug("Unable to create image from data.")
            return
        }
        
        
        // FIXME: - Do something with your 'image' at this point
        
        
    }
    
}
