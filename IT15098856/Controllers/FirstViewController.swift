//
//  FirstViewController.swift
//  IT15098856
//
//  Created by Pandula Kalhara on 8/18/18.
//  Copyright © 2018 Pandula Kalhara. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITextFieldDelegate  {
    
    
    @IBOutlet weak var gramTextfeiled: UITextField!
    @IBOutlet weak var ounceTextField: UITextField!
    @IBOutlet weak var poundTextFeild: UITextField!
    @IBOutlet weak var kilogramTextfeiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gramTextfeiled.text=""
        
        
        self.gramTextfeiled.delegate = self
        
        gramTextfeiled.addTarget(self, action: #selector(textChanged), for: .editingChanged) //identify textfield chaing and call the function textchanged to calculation
        ounceTextField.addTarget(self, action: #selector(textChanged2), for: .editingChanged) //identify textfield chaing and call the function textchanged to calculation
        poundTextFeild.addTarget(self, action: #selector(textChanged3), for: .editingChanged) //identify textfield chaing and call the function textchanged to calculation
        kilogramTextfeiled.addTarget(self, action: #selector(textChanged4), for: .editingChanged) //identify textfield chaing and call the function textchanged to calculation
        
        gramTextfeiled.clearsOnBeginEditing = true // clear the current user input if user try to edit textfield
        ounceTextField.clearsOnBeginEditing = true
        poundTextFeild.clearsOnBeginEditing = true
        kilogramTextfeiled.clearsOnBeginEditing = true
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
        let sum11 = Double(gramTextfeiled.text!)
        
        kilogramTextfeiled.text = String(describing:(sum11 ?? 0) / 1000)
        poundTextFeild.text = String(describing:(sum11 ?? 0) / 453.59237)
        ounceTextField.text = String(describing:(sum11 ?? 0) * 0.035274)
        
    }
    @objc func textChanged2() { //calculate the convertion
        let sum11 = Double(ounceTextField.text!)
        
        gramTextfeiled.text = String(describing:(sum11 ?? 0) / 0.035274)
        poundTextFeild.text = String(describing:(sum11 ?? 0) / 16)
        kilogramTextfeiled.text = String(describing:(sum11 ?? 0) / 35.274)
        
    }
    @objc func textChanged3() { //calculate the convertion
        let sum11 = Double(poundTextFeild.text!)
        
        kilogramTextfeiled.text = String(describing:(sum11 ?? 0) * 0.45359237)
        ounceTextField.text = String(describing:(sum11 ?? 0) * 16)
        gramTextfeiled.text = String(describing:(sum11 ?? 0) * 453.59237)
        
    }
    @objc func textChanged4() { //calculate the convertion
        let sum11 = Double(kilogramTextfeiled.text!)
        
        gramTextfeiled.text = String(describing:(sum11 ?? 0) * 1000)
        poundTextFeild.text = String(describing:(sum11 ?? 0) * 2.2046)
        ounceTextField.text = String(describing:(sum11 ?? 0) / 0.02834952)
        
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool { // function for clear text field
        return true
    }
    
    
}



