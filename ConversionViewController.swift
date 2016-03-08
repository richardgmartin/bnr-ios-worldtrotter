//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Richard Martin on 2016-03-07.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var celciusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue: Double? {
        didSet {
            updateCelciusLabel()
        }
    }
    
    var celciusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        }
        else {
            return nil
        }
    }
    
    func updateCelciusLabel() {
        if let value = celciusValue {
            celciusLabel.text = numberFormatter.stringFromNumber(value)
        }
        else {
            celciusLabel.text = "???"
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        
        if let text = textField.text, value = Double(text) {
            fahrenheitValue = value
        }
        else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func textField(textField: UITextField,
        shouldChangeCharactersInRange range: NSRange,
        replacementString string: String) -> Bool {
            
            let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
            let replacementTextHasDecimalSeparator = string.rangeOfString(".")
            
            if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
                return false
            }
            else {
                return true
            }
            
// attempt at bronze challenge in chapter 4
            
//        let existingText:NSString = textField.text!
//            
//        let validValues = NSCharacterSet(charactersInString: "0123456789.")
//        let invalidValues = validValues.invertedSet
//        let rangeOfInvalidValues = existingText.rangeOfCharacterFromSet(invalidValues)
//        let invalidEntry:Bool = rangeOfInvalidValues.location != NSNotFound
//            
//        if invalidEntry {
//            return false
//        }
//        else {
//            return true
//        }
        
    }
    
}
