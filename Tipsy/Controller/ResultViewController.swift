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
    
    var numberOfPeople: String = "0"
    var tipPercentage: Int = 0
    var totalBill: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = totalBill!
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(tipPercentage)% tip."

        // Do any additional setup after loading the view.
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
