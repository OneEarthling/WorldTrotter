//
//  ViewController.swift
//  WorldTrotter
//
//  Created by User on 17.11.2020.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    //let gradientLayer = CAGradientLayer()
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    var fahreinheitValue: Measurement<UnitTemperature>? {
        // property observer
        didSet{
            updateCelsiusLabel()
        }
    }
    var celsiusValue : Measurement<UnitTemperature>? {
        if let fahreinheitValue = fahreinheitValue {
            return fahreinheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCelsiusLabel()
    }
    
    func updateCelsiusLabel(){
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        var numbers = CharacterSet.decimalDigits
        numbers.insert(charactersIn: ".")
        guard (string.rangeOfCharacter(from: numbers) != nil) || string.isEmpty else {
            return false
        }

        if existingTextHasDecimalSeparator != nil,
           replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textfield: UITextField){
        if let text = textfield.text, let value = Double(text) {
            fahreinheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahreinheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
}

