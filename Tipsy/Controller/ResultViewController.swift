//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Muhammad Fahmi on 07/08/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var numberOfPeople: Int = 0
    var tipPercentage: Int = 0
    var totalBill: String?
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = totalBill!
        settingsLabel.text = calculatorBrain.settingsLabelText(numberOfPpl: numberOfPeople, tipPct: tipPercentage)        
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
