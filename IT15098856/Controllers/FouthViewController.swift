//
//  FouthViewController.swift
//  IT15098856
//
//  Created by Pandula Kalhara on 8/18/18.
//  Copyright © 2018 Pandula Kalhara. All rights reserved.
//

import UIKit

class FouthViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var meterTextField: UITextField!
    @IBOutlet weak var feetTextField: UITextField!
   @IBOutlet weak var kilometerTextField: UITextField!
   @IBOutlet weak var milesTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        meterTextField.text=""
        
        
        self.meterTextField.delegate = self
        
        meterTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)  //identify textfield chaing and call the function textchanged to calculation
        feetTextField.addTarget(self, action: #selector(textChanged1), for: .editingChanged)
        kilometerTextField.addTarget(self, action: #selector(textChanged2), for: .editingChanged)
        milesTextField.addTarget(self, action: #selector(textChanged3), for: .editingChanged)
        
        meterTextField.clearsOnBeginEditing = true // clear the current user input if user try to edit textfield
        feetTextField.clearsOnBeginEditing = true
        kilometerTextField.clearsOnBeginEditing = true
        milesTextField.clearsOnBeginEditing = true
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
        let sum11 = Double(meterTextField.text!)
        
        feetTextField.text = String(describing:(sum11 ?? 0) * 196.850394)
        kilometerTextField.text = String(describing:(sum11 ?? 0) * 3.6)
        milesTextField.text = String(describing:(sum11 ?? 0) * 2.236936)
        
    }
    @objc func textChanged1() { //calculate the convertion
        let sum11 = Double(feetTextField.text!)
        
        meterTextField.text = String(describing:(sum11 ?? 0) * 0.00508)
        kilometerTextField.text = String(describing:(sum11 ?? 0) * 0.018288)
        milesTextField.text = String(describing:(sum11 ?? 0) * 0.0113636)
        
    }
    @objc func textChanged2() { //calculate the convertion
        let sum11 = Double(kilometerTextField.text!)
        
        feetTextField.text = String(describing:(sum11 ?? 0) * 54.68)
        meterTextField.text = String(describing:(sum11 ?? 0) * 0.277778)
        milesTextField.text = String(describing:(sum11 ?? 0) * 0.6213711922)
        
    }
    @objc func textChanged3() { //calculate the convertion
        let sum11 = Double(milesTextField.text!)
        
        feetTextField.text = String(describing:(sum11 ?? 0) * 88)
        kilometerTextField.text = String(describing:(sum11 ?? 0) * 1.60934)
        meterTextField.text = String(describing:(sum11 ?? 0) * 0.44704)
        
    }
    
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        // function for clear text field
        return true
    }
    
    
    
    
    
    
    
}
