//
//  SubscriptionCell.swift
//  PinTube
//
//  Created by Daval Cato on 3/18/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import UIKit

class SubscriptionCell: FeedCell {
    
    override func fetchVideos() {
        ApiService.sharedInstance.fetchSubscriptionFeed { (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
}
