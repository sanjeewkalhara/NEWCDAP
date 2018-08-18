//
//  ThirdViewController.swift
//  IT15098856
//
//  Created by Pandula Kalhara on 8/18/18.
//  Copyright © 2018 Pandula Kalhara. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var meterTextFeild: UITextField!
    @IBOutlet weak var footTextFeild: UITextField!
    @IBOutlet weak var yardTextField: UITextField!
    @IBOutlet weak var kilometerTextField: UITextField!
    @IBOutlet weak var mileTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        meterTextFeild.text=""
        
        
        self.meterTextFeild.delegate = self
        
         meterTextFeild.addTarget(self, action: #selector(textChanged), for: .editingChanged)  //identify textfield chaing and call the function textchanged to calculation
         footTextFeild.addTarget(self, action: #selector(textChanged2), for: .editingChanged)  //identify textfield chaing and call the function textchanged to calculation
         yardTextField.addTarget(self, action: #selector(textChanged3), for: .editingChanged)  //identify textfield chaing and call the function textchanged to calculation
         kilometerTextField.addTarget(self, action: #selector(textChanged4), for: .editingChanged)  //identify textfield chaing and call the function textchanged to calculation
         mileTextField.addTarget(self, action: #selector(textChanged5), for: .editingChanged)  //identify textfield chaing and call the function textchanged to calculation
        
        meterTextFeild.clearsOnBeginEditing = true // clear the current user input if user try to edit textfield
        footTextFeild.clearsOnBeginEditing = true
        yardTextField.clearsOnBeginEditing = true
        kilometerTextField.clearsOnBeginEditing = true
        mileTextField.clearsOnBeginEditing = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { // alow to add numbers only also in storyboard only allow number and function keyboard
        
        let allowedCharacters = "+.1234567890"
        let allowedCharcterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharcterSet = CharacterSet(charactersIn: string)
        return allowedCharcterSet.isSuperset(of: typedCharcterSet)
    }
    
    @objc func textChanged() { //calculate the convertion
        let sum11 = Double(meterTextFeild.text!)
        
        footTextFeild.text = String(describing:(sum11 ?? 0) / 0.3048)
        yardTextField.text = String(describing:(sum11 ?? 0) * 1.0936)
        kilometerTextField.text = String(describing:(sum11 ?? 0) / 1000.00)
        mileTextField.text = String(describing:(sum11 ?? 0) * 0.00062137)
        
    }
    @objc func textChanged2() { //calculate the convertion
        let sum11 = Double(footTextFeild.text!)
        
        meterTextFeild.text = String(describing:(sum11 ?? 0) * 0.3048 )
        yardTextField.text = String(describing:(sum11 ?? 0) * 0.33333)
        kilometerTextField.text = String(describing:(sum11 ?? 0) *  0.0003048)
        mileTextField.text = String(describing:(sum11 ?? 0) * 0.00018939)
        
    }
    @objc func textChanged3() { //calculate the convertion
        let sum11 = Double(yardTextField.text!)
        
        footTextFeild.text = String(describing:(sum11 ?? 0) * 3.0000)
        meterTextFeild.text = String(describing:(sum11 ?? 0) * 0.9144)
        kilometerTextField.text = String(describing:(sum11 ?? 0) * 0.0009144)
        mileTextField.text = String(describing:(sum11 ?? 0) *  0.00056818)
        
    }
    @objc func textChanged4() { //calculate the convertion
        let sum11 = Double(kilometerTextField.text!)
        
        footTextFeild.text = String(describing:(sum11 ?? 0) * 3280.8398950131)
        yardTextField.text = String(describing:(sum11 ?? 0) * 1093.6132983377)
        meterTextFeild.text = String(describing:(sum11 ?? 0) * 1000.00)
        mileTextField.text = String(describing:(sum11 ?? 0) * 0.6213711922)
        
    }
    @objc func textChanged5() { //calculate the convertion
        let sum11 = Double(mileTextField.text!)
        
        footTextFeild.text = String(describing:(sum11 ?? 0) * 5280.0)
        yardTextField.text = String(describing:(sum11 ?? 0) * 1760.0)
        kilometerTextField.text = String(describing:(sum11 ?? 0) * 1.609344)
        meterTextFeild.text = String(describing:(sum11 ?? 0) / 0.00062137 )
        
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        // function for clear text field
        return true
    }
    
}
