//
//  PlayerTableViewController.swift
//  NBA UIKit
//
//  Created by zappycode on 6/22/19.
//  Copyright © 2019 Nick Walter. All rights reserved.
//

import UIKit
import SwiftUI

class PlayerTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath)
        
        let player = players[indexPath.row]
        
        cell.textLabel?.text = player.name
        
        return cell
    }
    
    @IBSegueAction func showPlayer(_ coder: NSCoder) -> UIViewController? {
        
        let player = players[tableView.indexPathForSelectedRow!.row]
        
        let playerView = PlayerView(player: player)
        
        return UIHostingController(coder: coder, rootView: playerView)
    }
}
