//
//  SecondViewController.swift
//  reusable popups
//
//  Created by Panchami Shenoy on 18/10/21.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var dateLabel: UILabel!
    var observer :NSObjectProtocol?
    override func viewDidAppear(_ animated: Bool) {
     observer =  NotificationCenter.default.addObserver(forName: .saveDateTime, object: nil, queue: OperationQueue.main) { (notification) in
            let dateVc = notification.object as! DatePopupViewController
            self.dateLabel.text = dateVc.formattedDate
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
}
