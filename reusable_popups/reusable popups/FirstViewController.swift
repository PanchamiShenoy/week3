//
//  FirstViewController.swift
//  reusable popups
//
//  Created by Panchami Shenoy on 18/10/21.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var dateLabel: UILabel!
    var observer :NSObjectProtocol?
   /* override func viewDidLoad() {
      super.viewDidLoad()
        
       // NotificationCenter.default.addObserver(self, selector: #selector(handlePopupClosing), name: .saveDateTime, object: nil)
    }
       */
    
    /* @objc func handlePopupClosing(notification:Notification) {
         let dateVc = notification.object as! DatePopupViewController
         dateLabel.text = dateVc.formattedDate
         
     }*/
     
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
  
  /* 
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDatePopupViewControllerSegue" {
            let popup = segue.destination as! DatePopupViewController
            popup.showTimePicker = false
        }
    }
*/
    

}
