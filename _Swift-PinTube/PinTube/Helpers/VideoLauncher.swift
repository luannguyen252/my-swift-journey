//
//  VideoLauncher.swift
//  PinTube
//
//  Created by Daval Cato on 8/10/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class VideoPlayerView: UIView, AVPlayerViewControllerDelegate, UIGestureRecognizerDelegate {
    
    let blackView = UIView()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.translatesAutoresizingMaskIntoConstraints = false
        aiv.startAnimating()
        return aiv
        
    }()
    
    @objc lazy var videoDismissButton: UIButton = {
        let button = UIButton(type: .system)
        let image =  UIImage(named: "hide")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.isHidden = true
        
        button.addTarget(self, action: #selector(handleVideo), for: .touchUpInside)
        
        
        return button
    }()
    
   
    
    
    // Handle the tap
    
    // @objc func handleVideo(note: NSNotification) {
    
    
    @objc func handleVideo(note: NSNotification) {
        

        
        print("video dismissed..")
    }
    
    lazy var pausePlayButton: UIButton = {
        let button = UIButton(type: .system)
        let image =  UIImage(named: "pause")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.isHidden = true
        
        
        button.addTarget(self, action: #selector(handlePause), for: .touchUpInside)
        return button
         
    }()
    
    
    var isPlaying = false
    
    
    @objc func handlePause() {
        if isPlaying {
            player?.pause()
            pausePlayButton.setImage(UIImage(named: "play"), for: .normal)
        } else {
            player?.play()
            pausePlayButton.setImage(UIImage(named: "pause"), for: .normal)
        
         }

        isPlaying = !isPlaying
        
    }
    
    let controlsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 1)
        return view
        
    }()
    
    let videoLengthlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00:00"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textAlignment = .right
        
        return label
        
    }()
    
    let currentTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00:00"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        
        return label
        
        
    }()
    
    let videoSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = .red
        slider.setThumbImage(UIImage(named: "dot"), for: .normal)
        
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
        
        return slider
        
        
    }()
    
    @objc func handleSliderChange() {
        print(videoSlider.value)
        
        if let duration = player?.currentItem?.duration {
            
            let totalSeconds = CMTimeGetSeconds(duration)
            
            let value = Float64(videoSlider.value) * totalSeconds
            
            //Seeks the value here in seconds
            let seekTime = CMTime(value: Int64(value), timescale: 1)
            
            //This is how you skip to a different section of the video
            player?.seek(to: seekTime, completionHandler: { (completedSeek) in
                //Expect to do something here
                
            })
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        setupPlayerView()
        
        setupGradientLayer()
        
        controlsContainerView.frame = frame
        addSubview(controlsContainerView)
        
        controlsContainerView.addSubview(activityIndicatorView)
        activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        controlsContainerView.addSubview(pausePlayButton)
        pausePlayButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pausePlayButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        pausePlayButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        pausePlayButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        controlsContainerView.addSubview(videoDismissButton)
        videoDismissButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 4).isActive = true
        videoDismissButton.topAnchor.constraint(equalTo: topAnchor, constant: 1).isActive = true
        videoDismissButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        videoDismissButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        controlsContainerView.addSubview(videoLengthlabel)
        videoLengthlabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        videoLengthlabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2).isActive = true
        videoLengthlabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        videoLengthlabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        controlsContainerView.addSubview(currentTimeLabel)
        currentTimeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        currentTimeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2).isActive = true
        currentTimeLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        currentTimeLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
       
        controlsContainerView.addSubview(videoSlider)
        videoSlider.rightAnchor.constraint(equalTo: videoLengthlabel.leftAnchor).isActive = true
        videoSlider.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        videoSlider.leftAnchor.constraint(equalTo: currentTimeLabel.rightAnchor).isActive = true
        videoSlider.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        backgroundColor = .black
    }
    
    var player: AVPlayer?
    
    private func setupPlayerView() {
        //This is a borrowed video link - just a place mark for now.
        let urlString = "https://firebasestorage.googleapis.com/v0/b/gameofchats-762ca.appspot.com/o/message_movies%2F12323439-9729-4941-BA07-2BAE970967C7.mov?alt=media&token=3e37a093-3bc8-410f-84d3-38332af9c726"
        
        if let url = NSURL(string: urlString) {
             player = AVPlayer(url: url as URL)
            
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            self.layer.addSublayer(playerLayer)
            playerLayer.frame = self.frame
            
            
            player?.play()
            
            player?.addObserver(self, forKeyPath: "currentItem.loadedTimeRanges", options: .new, context: nil)
            
            //Tracking the duration of the video with a player progress monitor
            let interval = CMTime(value: 1, timescale: 2)
            player?.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { (progressTime) in
                
                let seconds = CMTimeGetSeconds(progressTime)
                let secondsString = Int(seconds.truncatingRemainder(dividingBy: 60))
                let minutesString = String(format: "%02d", Int(seconds) / 60)
                
                self.currentTimeLabel.text = "\(minutesString):\(secondsString)"
                
                //Modifing the slider thumb dot to work along with the currentTimeLabel
                if let duration = self.player?.currentItem?.duration {
                    let durationSeconds = CMTimeGetSeconds(duration)
                    
                    self.videoSlider.value = Float(seconds / durationSeconds)
                    
                }
                
            })
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        //Here is where the video is ready to render frames
        if keyPath == "currentItem.loadedTimeRanges" {
            activityIndicatorView.stopAnimating()
            controlsContainerView.backgroundColor = .clear
            pausePlayButton.isHidden = false
            videoDismissButton.isHidden = false
            isPlaying = true
            
            if let duration = player?.currentItem?.duration {
                let seconds = CMTimeGetSeconds(duration)
                
                let secondText = Int(seconds.truncatingRemainder(dividingBy: 60))
                let minutesText = String(format: "%02d", Int(seconds) / 60)
               
                videoLengthlabel.text = "\(minutesText):\(secondText)"
        
            }
        }
    }
    
    private func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor ]
        //TO modified the gradientLayer locations
        gradientLayer.locations = [0.7, 1.2]
        controlsContainerView.layer.addSublayer(gradientLayer)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class VideoLauncher: NSObject {
    
    func showVideoPlayer() {
        print("Showing video player animation...")
        
        if let keyWindow = UIApplication.shared.keyWindow {
            let view = UIView(frame: keyWindow.frame)
            view.backgroundColor = UIColor.white
            
            view.frame = CGRect(x: keyWindow.frame.width - 10, y: keyWindow.frame.height - 10, width: 10, height: 10)
            
            //16 x 9 is the aspect ratio of all HD videos
            let height = keyWindow.frame.width * 9 / 16
            let videoPlayerFrame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: height)
            let videoPlayerView = VideoPlayerView(frame: videoPlayerFrame)
            view.addSubview(videoPlayerView)
            
            keyWindow.addSubview(view)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                view.frame = keyWindow.frame
                
                
            }) { (completedAnimation) in
                
                
                //The view is expected to rise from the lower right corner later....
                
                UIApplication.shared.setStatusBarHidden(true, with: .fade)
                
                
                //code below fixes warning above
                
//                class ViewController: UIViewController {
//
//                    @IBAction func clicked(sender: AnyObject) {
//                        statusBarHidden = !statusBarHidden
//                    }
//
//                    var statusBarHidden = false {
//                        didSet {
//                            UIView.animate(withDuration: 0.5) { () -> Void in
//                                self.setNeedsStatusBarAppearanceUpdate()
//                            }
//                        }
//                    }
//
//                    override var prefersStatusBarHidden: Bool {
//                        return statusBarHidden
//                    }
//
//                    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
//                        return .slide
//                    }
//                }
            
            }
        }
    }
}















