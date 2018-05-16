//
//  ViewController.swift
//  Binarios
//
//  Created by Juan Morillo on 16/5/18.
//  Copyright © 2018 Juan Morillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var valueEntryTextField: UITextField!
    @IBOutlet weak var binaryBtn: UIButton!
    @IBOutlet weak var decimalBtn: UIButton!
    
    let placeHolder = NSAttributedString(string: "Enter a value...", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), NSAttributedStringKey.font: UIFont(name: "Menlo", size: 36.0)!])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueEntryTextField.attributedPlaceholder = placeHolder
        valueEntryTextField.addTarget(self, action: #selector(textFieldTextDidChang), for: .editingChanged)
        disableBtns()
    }
    
    @objc func textFieldTextDidChang() {
        if valueEntryTextField.text == "" {
            disableBtns()
        } else {
            enableBtns()
        }
    }
    
    func disableBtns() {
        binaryBtn.isEnabled = false
        binaryBtn.alpha = 0.5
        decimalBtn.isEnabled = false
        decimalBtn.alpha = 0.5
    }
    
    func enableBtns() {
        binaryBtn.isEnabled = true
        binaryBtn.alpha = 1.0
        decimalBtn.isEnabled = true
        decimalBtn.alpha = 1.0
    }
    
    @IBAction func binaryBtnWasPressed(_ sender: Any) {
        if valueEntryTextField.text != "" {
            binaryBtn.alpha = 1.0
            decimalBtn.alpha = 0.5
            guard let string = valueEntryTextField.text, let intFromString = Int(string) else  { return }
            let binaryDigit = BinaryDecimal(intFromString)
            valueEntryTextField.text = "\(binaryDigit.calculateBinaryValueForInt())"
        }
    }
    
    @IBAction func decimalBtnWasPressed(_ sender: Any) {
        if valueEntryTextField.text != "" {
            binaryBtn.alpha = 0.5
            decimalBtn.alpha = 1.0
            guard let string = valueEntryTextField.text else { return }
            let bitsFromString = string.map { Int(String($0))! }
            let binaryDigit = BinaryDecimal(bitsFromString)
            valueEntryTextField.text = "\(binaryDigit.calculateIntValueForBinary())"
        }
    }
}

