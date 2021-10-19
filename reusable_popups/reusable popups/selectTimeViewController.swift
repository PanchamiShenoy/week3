//
//  selectTimeViewController.swift
//  reusable popups
//
//  Created by Panchami Shenoy on 18/10/21.
//

import UIKit

class selectTimeViewController: UIViewController {

    @IBOutlet var dateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var observer :NSObjectProtocol?

    override func viewDidAppear(_ animated: Bool) {
     observer =  NotificationCenter.default.addObserver(forName: .saveDateTime, object: nil, queue: OperationQueue.main) { (notification) in
            let dateVc = notification.object as! DatePopupViewController
            self.dateLabel.text = dateVc.formattedTime
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    @IBAction func selectTime(_ sender: Any) {
        let sb = UIStoryboard(name: "DatePopupViewController", bundle: nil)
        let popup = sb.instantiateInitialViewController()! as! DatePopupViewController
        popup.showTimePicker = true
        self.present(popup, animated: true)
    }
    
   
}
