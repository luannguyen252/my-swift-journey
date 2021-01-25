//
//  TrendingCell.swift
//  PinTube
//
//  Created by Daval Cato on 3/18/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import UIKit

class TrendingCell: FeedCell {
    
    override func fetchVideos() {
        ApiService.sharedInstance.fetchTrendingFeed { (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }
        
    }
    
}
