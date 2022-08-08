//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.1
    var split = "2"
    var totalBill: Float = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        
        let buttonTitleWithoutPercent = String(buttonTitle.dropLast())
        
        tip = Double(buttonTitleWithoutPercent)!/100

    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        split = splitNumberLabel.text!
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let floatBillTextField = (Float(billTextField.text!) ?? 0.0)
        totalBill = ((floatBillTextField+(floatBillTextField*Float(tip))) / (Float(split) ?? 0.0))
        print(String(format: "%.2f", totalBill))
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalBill = String(format: "%.2f", totalBill)
            print(tip)
            print(split)
            destinationVC.tipPercentage = Int(tip*100)
            destinationVC.numberOfPeople = split
        }
    }
    

}

