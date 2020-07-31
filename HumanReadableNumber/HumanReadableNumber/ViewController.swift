//
//  ViewController.swift
//  HumanReadableNumber
//
//  Created by Tarun Tomar on 29/07/20.
//  Copyright © 2020 Tarun Tomar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var numericNumberTextField: UITextField!
    @IBOutlet var displayHumanreadableNumber: UILabel!
    private let viewModelObj = HumanreadableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numericNumberTextField.delegate = self
    }
    
    @IBAction func submitTapped() {
        let textfieldInt: Int? = Int(numericNumberTextField.text!)
        let readableOutput = viewModelObj.getNumber(num: textfieldInt ?? 0)
        displayHumanreadableNumber.text = readableOutput
        prepareForNext()
    }
    
    func prepareForNext() {
        numericNumberTextField.resignFirstResponder()
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 9
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
}
