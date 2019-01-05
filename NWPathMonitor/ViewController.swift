//
//  ViewController.swift
//  NWPathMonitor
//
//  Created by Bhat, Adithya H (external - Project) on 04/01/19.
//  Copyright © 2019 Bhat, Adithya H (external - Project). All rights reserved.
//

import UIKit
import Network

class ViewController: UIViewController, NetworkCheckObserver {
    
    @IBOutlet weak var statusLabel: UILabel!
    var networkCheck = NetworkCheck.sharedInstance()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        statusLabel.text = networkCheck.currentStatus == .satisfied ? "Connected" : "Disconnected"
        networkCheck.addObserver(observer: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        networkCheck.removeObserver(observer: self)
        super.viewWillDisappear(animated)
    }

    func statusDidChange(status: NWPath.Status) {
        statusLabel.text = status == .satisfied ? "Connected" : "Disconnected"
    }

}

