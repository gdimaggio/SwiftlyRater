//
//  SRReachabilityManager.swift
//  SwiftlyRaterSample
//
//  Created by Gianluca Di Maggio on 1/8/17.
//  Copyright © 2017 dima. All rights reserved.
//

import UIKit

/// Protocol for listenig network status change
protocol SRReachabilityManagerDelegate : NSObjectProtocol {
    func networkStatusDidChange(status: Reachability.NetworkStatus)
}

class SRReachabilityManager: NSObject {
    static var sharedManager = SRReachabilityManager()

    var isNetworkAvailable : Bool {
        return reachabilityStatus != .notReachable
    }

    var reachabilityStatus: Reachability.NetworkStatus = .notReachable

    let reachability = Reachability()

    var delegate: SRReachabilityManagerDelegate?

    func reachabilityChanged(notification: Notification) {
        if let reachability = notification.object as? Reachability {
            self.reachabilityStatus = reachability.currentReachabilityStatus
            self.delegate?.networkStatusDidChange(status: reachability.currentReachabilityStatus)
        }
    }


    func startMonitoring() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.reachabilityChanged),
                                               name: ReachabilityChangedNotification,
                                               object: reachability)
        do{
            try reachability?.startNotifier()
        }catch{
//            print("Could not initiate Reachability monitoring")
        }
    }

    func stopMonitoring(){
        reachability?.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: ReachabilityChangedNotification,
                                                  object: reachability)
    }

}
