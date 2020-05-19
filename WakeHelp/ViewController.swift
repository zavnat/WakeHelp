//
//  ViewController.swift
//  WakeHelp
//
//  Created by admin on 19.05.2020.
//  Copyright © 2020 Natali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var datePicker: UIDatePicker!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let localeID = Locale.preferredLanguages.first
    datePicker.locale = Locale(identifier: localeID!)
  }


}

