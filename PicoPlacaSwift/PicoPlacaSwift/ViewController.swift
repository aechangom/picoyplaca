//
//  ViewController.swift
//  PicoPlacaSwift
//
//  Created by Andres Efrain Chango Macas on 4/23/18.
//  Copyright © 2018 Andres Efrain Chango Macas. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var plateTextField: UITextField!
    
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var hourTextField: UITextField!
    
    
    @IBOutlet weak var resultTextField: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func validateParameters(plate:String , date : String , time : String) -> Bool{
        var response = true;
        let validator = UtilitiesPlateManager()
        if (!validator.isValidDate(date: date)){
            self.showAlert(text: "Fecha Invalida debe cumplir el formato ddmmaaaa")
            self.dateTextField.text = ""
            response = false
        }
        if (!validator.plateValidator(plate: plate)){
            self.showAlert(text: "Placa no valida")
            self.plateTextField.text = ""
            response = false
        }
        if (!validator.isValidTime(time: time)){
            self.showAlert(text: "Hora no válida debe cumplir el formato HH:mm")
            self.hourTextField.text = ""
            response = false
        }
        
        return response
        
    }
    
    @IBAction func checkPicoPlaca(_ sender: Any) {
        self.resultTextField.text = ""
        if (self.validateParameters(plate: self.plateTextField.text!, date: self.dateTextField.text!, time: self.hourTextField.text!)){
            let validator = UtilitiesPlateManager()
            self.showResultonScreem(isAllow: validator.validatePicoPlacaAllow(plate: plateTextField.text!, date: self.dateTextField.text!, time: hourTextField.text!))
            
        }

    }
    func showResultonScreem(isAllow: Bool){
        if(!isAllow){
            self.resultTextField.textColor = UIColor.green
            self.resultTextField.text = "NO TIENES PICO Y PLACA"
            
        }else{
            self.resultTextField.textColor = UIColor.red
            self.resultTextField.text = "TINES PICO Y PLACA"
        }
        
    }
    
    func showAlert(text: String){
        let alert = UIAlertController(title: "Alerta",
                                      message: text,
                                      preferredStyle: UIAlertControllerStyle.alert)
        let aceptar = UIAlertAction(title: "Aceptar",
                                         style: .cancel, handler: nil)
        
        alert.addAction(aceptar)

        self.present(alert, animated: true, completion: nil)
        
    }
    

}

