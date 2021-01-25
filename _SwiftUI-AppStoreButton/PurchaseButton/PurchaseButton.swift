//
//  PurchaseButton.swift
//  PurchaseButton
//
//  Created by Pablo Blanco González on 08/10/2020.
//

import SwiftUI

struct PurchaseButton: View {
    
    @ObservedObject var model: PurchaseButtonViewModel
        
    let preparingDownloadAction: (@escaping (Result<Any, Error>) -> ()) -> ()
    let downloadAction: (@escaping (Result<Double, Error>) -> ()) -> ()
    let cancelDownloadAction: () -> ()
    let downloadedAction: () -> ()
    
    init(isDownloaded: Bool,
         isDone: Bool,
         preparingDownloadAction: @escaping (@escaping (Result<Any, Error>) -> ()) -> (),
         downloadAction: @escaping (@escaping (Result<Double, Error>) -> ()) -> (),
         cancelDownloadAction: @escaping () -> (),
         downloadedAction: @escaping () -> ()) {
        
        self.model = PurchaseButtonViewModel(isDone: isDone,
                                             isDownloaded: isDownloaded)
        
        self.preparingDownloadAction = preparingDownloadAction
        self.downloadAction = downloadAction
        self.cancelDownloadAction = cancelDownloadAction
        self.downloadedAction = downloadedAction
    }

    var body: some View {
        Button(action: {
            switch model.state {
            case .get:
                model.state = .preparingToDownload
                preparingDownloadAction { result in
                    switch result {
                    case .success:
                        model.state = .downloading(progress: 0.0)
                        downloadAction { result in
                            switch result {
                            case .success(let downloadProgress):
                                model.state = downloadProgress >= 1.0 ? .open : .downloading(progress: downloadProgress)
                            case .failure:
                                model.state = .get(isDownloaded: model.isDownloaded)
                                cancelDownloadAction()
                            }
                        }
                    case .failure:
                        model.state = .get(isDownloaded: model.isDownloaded)
                        cancelDownloadAction()
                    }
                }
            case .open:
                downloadedAction()
            case .preparingToDownload:
                break
            case .downloading:
                model.state = .get(isDownloaded: model.isDownloaded)
                cancelDownloadAction()
            }
        }, label: {
            VStack(alignment: .center) {
                switch model.state {
                case .get(let isDownloaded):
                    if isDownloaded {
                        Image(systemName: "icloud.and.arrow.down")
                    } else {
                        Text("GET")
                    }
                case .open:
                    Text("OPEN")
                case .preparingToDownload:
                    CircularProgressBar(color: model.state.properties.foregroundColor)
                case .downloading(let progress):
                    CircularProgressButtonBar(progress: progress, foregroundColor: model.state.properties.foregroundColor)
                }
            }
        })
        .frame(height: 30, alignment: .center)
        .buttonStyle(PurchaseButtonStyle(state: model.state))
        .animation(.easeIn)
    }
}

struct PurchaseButton_Previews: PreviewProvider {
    
    @State var isDownloaded: Bool = false
    @State static private var payTimer: Timer?

    static var previews: some View {
        
        PurchaseButton(isDownloaded: true,
                       isDone: true,
                       preparingDownloadAction: { result in
                        print("Preparing to download...")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            result(.success(true))
                        }
                       },
                       downloadAction: { result in
                        print("Download")
                        var downloadProgress = 0.0
                        payTimer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
                            withAnimation {
                                downloadProgress += 0.1
                                result(.success(downloadProgress))
                            }
                         }
                       },
                       cancelDownloadAction: {
                        print("Cancellng...")
                        payTimer?.invalidate()
                        payTimer = nil
                       }, downloadedAction: {
                        print("Open")
                        // OPEN APP
                       })
    }
}
