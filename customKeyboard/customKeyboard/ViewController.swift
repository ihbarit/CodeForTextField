//
//  ViewController.swift
//  customKeyboard
//
//  Created by MCNMACBOOK01 on 14/02/23.
//

import UIKit
import SwiftUI


class ViewController: UIViewController, CustomKeyboardDelegate, UITextFieldDelegate {
   
    

    weak var delegate: CustomKeyboardDelegate?
    var activeTextField : UITextField?
    
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt1: UITextField!
    
    @IBOutlet weak var txt4: UITextField!
    @IBOutlet weak var txt3: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let host = UIHostingController(rootView: NumPad())
    
        
        txt1.delegate = self
        txt2.delegate = self
        txt3.delegate = self
        txt4.delegate = self
        
        activeTextField = txt1
        
    
        extract()
    
       
    }
    @objc func textDidChange(txtField:UITextField){
        
    }
    
        
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        return text.count + string.count <= 1
        
    }
   
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    func customKeyboardDidTapButton(_ string: String) {
  
        var str = string
        if str == "delete.left"{
            var str = activeTextField?.text
            if str?.count != 0{
                str?.removeLast()
            }
            activeTextField?.text  = str
            
            switch activeTextField {
            case txt1:
                txt1.becomeFirstResponder()
            case txt2:
                txt1.becomeFirstResponder()
            case txt3:
                txt2.becomeFirstResponder()
            case txt4:
                txt3.becomeFirstResponder()
                
            case txt4:
                txt4.becomeFirstResponder()
            default:
                break
            }
        }else{
            activeTextField?.text = str
            
            switch activeTextField {
            case txt1:
                txt2.becomeFirstResponder()
            case txt2:
                txt3.becomeFirstResponder()
            case txt3:
                txt4.becomeFirstResponder()
            case txt4:
                txt4.resignFirstResponder()
            default:
                break
            }
        }
        }
        
    
    func extract(){
        var numPadView = NumPad()
        
        numPadView.delegate = self
        
        let host = UIHostingController(rootView: numPadView)
        host.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(host.view)
        
        let constraints = [
            host.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            host.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            host.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
           
        ]
        
        self.view.addConstraints(constraints)
      
       
    }
    

}

