//
//  ViewController.swift
//  UIDatePickerForUITextFields_Swift4
//
//  Created by DeEp KapaDia on 18/05/18.
//  Copyright © 2018 DeEp KapaDia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var DatePickTextField: UITextField!
    
    let picker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        CreatePickerView()
        
    }

    func CreatePickerView(){
        
        //Toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        
        //Done button
        let Done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector (donebtnpress))
        toolbar.setItems([Done], animated: false)
        
        //butoon to apear on date picker to show
        DatePickTextField.inputAccessoryView = toolbar
        
        //useful to get input view on clicking TextFields
        DatePickTextField.inputView = picker
        
        
        //Formate for date picker
        picker.datePickerMode = .date //We can select " .date .CounDownTimer .DateandTime .Time "
    }

    
    @objc func donebtnpress(){
        
        //formate date foor Display
        let formater = DateFormatter()
        
        //Selections for Date Formate for Display on TextFields .Full .Long .Mideum .None .Short....
        formater.dateStyle = .medium
        
        //selections for Country name and time on Text Fields  .Full .Long .Mideum .None .Short....
        formater.timeStyle = .none
        
        //convert and display string format
        let DateString = formater.string(from: picker.date)
        
        
        //pass value to Text Field...
        DatePickTextField.text = "\(DateString)"
        self.view.endEditing(true)
        
    }
}

