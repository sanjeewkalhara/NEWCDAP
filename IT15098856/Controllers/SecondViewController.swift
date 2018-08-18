//
//  SecondViewController.swift
//  IT15098856
//
//  Created by Pandula Kalhara on 8/18/18.
//  Copyright © 2018 Pandula Kalhara. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate  {
    
    
    @IBOutlet weak var celsiusTextFeild: UITextField!
    @IBOutlet weak var kelvinTextFeild: UITextField!
    @IBOutlet weak var fahrenheitTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        celsiusTextFeild.text=""
        
        
        self.celsiusTextFeild.delegate = self
        
        celsiusTextFeild.addTarget(self, action: #selector(textChanged), for: .editingChanged) //identify textfield chaing and call the function textchanged to calculation
        kelvinTextFeild.addTarget(self, action: #selector(textChanged2), for: .editingChanged) //identify textfield chaing and call the function textchanged to calculation
        fahrenheitTextField.addTarget(self, action: #selector(textChanged3), for: .editingChanged) //identify textfield chaing and call the function textchanged to calculation
        
        celsiusTextFeild.clearsOnBeginEditing = true   // clear the current user input if user try to edit textfield
        kelvinTextFeild.clearsOnBeginEditing = true
        fahrenheitTextField.clearsOnBeginEditing = true
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
    
    @objc func textChanged() {  //calculate the convertion
        let sum11 = Double(celsiusTextFeild.text!)
        
        kelvinTextFeild.text = String(describing:(sum11 ?? 0) + 273.15)
        
        fahrenheitTextField.text = String(describing:(sum11 ?? 0 ) * 1.8 + 32)
        
        
    }
    @objc func textChanged2() {  //calculate the convertion
        
        let sum11 = Double(kelvinTextFeild.text!)
        
        celsiusTextFeild.text = String(describing:(sum11 ?? 0) - 273.15)
        
        fahrenheitTextField.text = String(describing:(sum11 ?? 0 ) * 1.8 - 459.67)
        
        
    }
    @objc func textChanged3() {  //calculate the convertion
        let sum11 = Double(fahrenheitTextField.text!)
        
        celsiusTextFeild.text = String(describing:(sum11 ?? 0) - 32  / 1.8)
        
        kelvinTextFeild.text = String(describing:(sum11 ?? 0 ) * 459.7 * 0.555)
        
        
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {  // function for clear text field
        return true
    }
    
    
}

