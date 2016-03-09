//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Richard Martin on 2016-03-07.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func randomColor() -> UIColor {
        let r = CGFloat.random()
        let g = CGFloat.random()
        let b = CGFloat.random()
        
        return UIColor(red: r, green: g, blue: b, alpha: 0.7)
    }
}

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var celciusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        // always call the super implementation of viewDidLoad
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        changeBackgroundColor()
    }
    
    func changeBackgroundColor() {
        
        self.view.backgroundColor = UIColor.randomColor()
        
    }
    
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
        
        if let text = textField.text, number = numberFormatter.numberFromString(text) {
            fahrenheitValue = number.doubleValue
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
            
            let currentLocale = NSLocale.currentLocale()
            let decimalSeparator = currentLocale.objectForKey(NSLocaleDecimalSeparator) as! String
            
            let existingTextHasDecimalSeparator = textField.text?.rangeOfString(decimalSeparator)
            let replacementTextHasDecimalSeparator = string.rangeOfString(decimalSeparator)
            
            if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
                return false
            }
            else {
                return true
            }
        
    }
    
}
