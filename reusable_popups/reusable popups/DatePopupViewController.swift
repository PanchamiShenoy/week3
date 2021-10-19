//
//  DatePopupViewController.swift
//  reusable popups
//
//  Created by Panchami Shenoy on 18/10/21.
//

import UIKit

class DatePopupViewController: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var saveButton: UIButton!
    
    @IBOutlet var titleLabel: UILabel!
    var showTimePicker:Bool = false
    
    var formattedDate :String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: datePicker.date)
    }
    var formattedTime :String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: datePicker.date)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if showTimePicker {
            titleLabel.text = "select time"
            datePicker.datePickerMode = .time
            saveButton.setTitle("save time", for: .normal)
        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveDate(_ sender: Any) {
        
        NotificationCenter.default.post(name: .saveDateTime, object: self)
        dismiss(animated: true)
    }
    

}
