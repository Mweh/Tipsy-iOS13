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
    
    var calculatorBrain = CalculatorBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        let buttonTitle = sender.currentTitle!
        let buttonTitleWithoutPercent = String(buttonTitle.dropLast())
        calculatorBrain.tip = Float(buttonTitleWithoutPercent)!/100
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        calculatorBrain.split = Float(sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billInNumber = Float(billTextField.text!) ?? 0.0
        calculatorBrain.finalBil = calculatorBrain.calculateBil(tB: billInNumber, t: calculatorBrain.tip, s: calculatorBrain.split)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalBill = String(format: "%.2f", calculatorBrain.finalBil!)
            destinationVC.tipPercentage = Int(calculatorBrain.tip*100)
            destinationVC.numberOfPeople = Int(calculatorBrain.split)
        }
    }
    
}

