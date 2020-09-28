//
//  ViewController.swift
//  calculator_basic_ver2
//
//  Created by Vo Hoang Duc Khoa on 9/27/20.
//  Copyright © 2020 Vo Hoang Duc Khoa. All rights reserved.
//

import UIKit

extension Float {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

class ViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnAC: UIButton!
    @IBOutlet weak var btnReverse: UIButton!
    @IBOutlet weak var btnPercent: UIButton!
    @IBOutlet weak var btnDivide: UIButton!
    @IBOutlet weak var btnTimes: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnEqual: UIButton!
    @IBOutlet weak var btnNumber0: UIButton!
    @IBOutlet weak var btnNumber1: UIButton!
    @IBOutlet weak var btnNumber2: UIButton!
    @IBOutlet weak var btnNumber3: UIButton!
    @IBOutlet weak var btnNumber4: UIButton!
    @IBOutlet weak var btnNumber5: UIButton!
    @IBOutlet weak var btnNumber6: UIButton!
    @IBOutlet weak var btnNumber7: UIButton!
    @IBOutlet weak var btnNumber8: UIButton!
    @IBOutlet weak var btnNumber9: UIButton!
    @IBOutlet weak var btnComma: UIButton!    
    
    var StringCalculationSign = ""
    var StringInput = ""
    var IntCountOfNumber = 0
    var BoolExistNumber = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    func checkIntNumber(number: String) -> Bool {
        if (floor(Double(number)!) == Double(number)){
            return true
        }
        return false
    }
    
    func convertResult(StringResult: String) -> String{
        if (checkIntNumber(number: StringResult)){
            return "\(Int(floor(Double(StringResult)!)))"
        }
        else {
            return String(Float(StringResult)!.clean)
        }
    }
    
    func calculator(StringInput: String, StringCalculationSign: String){
        if (StringCalculationSign == ""){
        }
        else{
            let numberInCalculatorSign = StringCalculationSign[StringCalculationSign.index(StringCalculationSign.startIndex, offsetBy: 1)..<StringCalculationSign.endIndex]
            
            
            switch StringCalculationSign[StringCalculationSign.startIndex] {
            case "÷":
                if (lblResult.text?.count == 0){
                    lblResult.text! = "Error"
                }
                else{
                    let result = String(Float(StringInput)!/Float(numberInCalculatorSign)!)
                    lblResult.text = convertResult(StringResult: "\(result)")
                }
                self.StringCalculationSign.removeAll()
            case "×":
                let result = String(Float(StringInput)!*Float(numberInCalculatorSign)!)
                lblResult.text = convertResult(StringResult: "\(result)")
                self.StringCalculationSign.removeAll()
            case "-":
                let result = String(Float(StringInput)!-Float(numberInCalculatorSign)!)
                lblResult.text = convertResult(StringResult: "\(result)")
                self.StringCalculationSign.removeAll()
            case "+":
                //Bị lỗi trong vài trường hợp, ví dụ 0.3 + 0.6 = 0.90000004 hoặc dư nhiều số 0 sau dấu phẩy
                let result = String(Float(StringInput)!+Float(numberInCalculatorSign)!)
                lblResult.text = convertResult(StringResult: "\(result)")
                self.StringCalculationSign.removeAll()
            default:
                print()
            }
        }
    }
    
    
    //MARK: Action
    @IBAction func btnAC(_ sender: Any) {
        lblResult.text = "0"
        StringInput = ""
        StringCalculationSign = ""
        IntCountOfNumber = 0
    }
    
    @IBAction func btnReverse(_ sender: Any) {
        if (StringCalculationSign.isEmpty){
            lblResult.text! = convertResult(StringResult: "\(-Float(lblResult.text!)!)")
        }
        else if (StringCalculationSign.count == 1){
            if (!BoolExistNumber){
                StringInput = lblResult.text!
                lblResult.text! = "-0"
                StringCalculationSign += "-"
                BoolExistNumber = true
            }
            
        }
        else{
            lblResult.text! = convertResult(StringResult: "\(-Float(lblResult.text!)!)")
            StringCalculationSign = String(StringCalculationSign[StringCalculationSign.startIndex]) + String(lblResult.text!)
            BoolExistNumber = true
        }
        
        
    }
    
    @IBAction func btnPercent(_ sender: Any) {
        lblResult.text = "\(Float(lblResult.text!)!/100)"
        
    }
    
    @IBAction func btnDivide(_ sender: Any) {
        if (StringCalculationSign.isEmpty){
            StringInput = lblResult.text!
            StringCalculationSign = "÷"
            BoolExistNumber = false
        }
        else if (StringCalculationSign.count == 1){
            StringInput = lblResult.text!
            StringCalculationSign = "÷"
            BoolExistNumber = false
        }
        else{
            calculator(StringInput: StringInput, StringCalculationSign: StringCalculationSign)
            StringInput = lblResult.text!
            StringCalculationSign = "÷"
            BoolExistNumber = false
            
        }
    }
    
    @IBAction func btnTimes(_ sender: Any) {
        if (StringCalculationSign.isEmpty){
            StringInput = lblResult.text!
            StringCalculationSign = "×"
            BoolExistNumber = false
        }
        else if (StringCalculationSign.count == 1){
            StringInput = lblResult.text!
            StringCalculationSign = "×"
            BoolExistNumber = false
        }
        else{
            calculator(StringInput: StringInput, StringCalculationSign: StringCalculationSign)
            StringInput = lblResult.text!
            StringCalculationSign = "×"
            BoolExistNumber = false
        }
    }
    
    @IBAction func btnMinus(_ sender: Any) {
        if (StringCalculationSign.isEmpty){
            StringInput = lblResult.text!
            StringCalculationSign = "-"
            BoolExistNumber = false
        }
        else if (StringCalculationSign.count == 1){
            StringInput = lblResult.text!
            StringCalculationSign = "-"
            BoolExistNumber = false
        }
        else{
            calculator(StringInput: StringInput, StringCalculationSign: StringCalculationSign)
            StringInput = lblResult.text!
            StringCalculationSign = "-"
            BoolExistNumber = false
        }
    }
    
    @IBAction func btnPlus(_ sender: Any) {
        if (StringCalculationSign.isEmpty){
            StringInput = lblResult.text!
            StringCalculationSign = "+"
            BoolExistNumber = false
        }
        else if (StringCalculationSign.count == 1){
            StringInput = lblResult.text!
            StringCalculationSign = "+"
            BoolExistNumber = false
        }
        else{
            calculator(StringInput: StringInput, StringCalculationSign: StringCalculationSign)
            StringInput = lblResult.text!
            StringCalculationSign = "+"
            BoolExistNumber = false
        }
    }
    
    @IBAction func btnEqual(_ sender: Any) {
        if (StringCalculationSign.count == 1){
            StringCalculationSign += StringInput
            calculator(StringInput: StringInput, StringCalculationSign: StringCalculationSign)
        }
        else{
            calculator(StringInput: StringInput, StringCalculationSign: StringCalculationSign)
        }
    }
    
    @IBAction func btnNumber0(_ sender: Any) {
        if (StringCalculationSign.isEmpty){
            if (!BoolExistNumber || lblResult.text! == "0"){
                lblResult.text = "0"
                BoolExistNumber = true
            }
            else{
                lblResult.text! += "0"
            }
        }
        else if (StringCalculationSign.count == 1){
            if (!BoolExistNumber){
                StringInput = lblResult.text!
                lblResult.text! = "0"
                StringCalculationSign += "0"
            }
            else{
                lblResult.text! += "0"
                StringCalculationSign += "0"
            }
            
        }
        else{
            lblResult.text! += "0"
            StringCalculationSign += "0"
        }
    }
    
    @IBAction func btnNumber1(_ sender: Any) {
        if (StringCalculationSign.isEmpty){
            if (!BoolExistNumber || lblResult.text! == "0"){
                lblResult.text = "1"
                BoolExistNumber = true
            }
            else{
                lblResult.text! += "1"
            }
        }
        else if (StringCalculationSign.count == 1){
            if (!BoolExistNumber){
                StringInput = lblResult.text!
                lblResult.text! = "1"
                StringCalculationSign += "1"
            }
            else{
                lblResult.text! += "1"
                StringCalculationSign += "1"
            }
        }
        else{
            lblResult.text! += "1"
            StringCalculationSign += "1"
        }
    }
    
    @IBAction func btnNumber2(_ sender: Any) {
        if (StringCalculationSign.isEmpty){
            if (!BoolExistNumber || lblResult.text! == "0"){
                lblResult.text = "2"
                BoolExistNumber = true
            }
            else{
                lblResult.text! += "2"
            }
        }
        else if (StringCalculationSign.count == 1){
            if (!BoolExistNumber){
                StringInput = lblResult.text!
                lblResult.text! = "2"
                StringCalculationSign += "2"
            }
            else{
                lblResult.text! += "2"
                StringCalculationSign += "2"
            }
        }
        else{
            lblResult.text! += "2"
            StringCalculationSign += "2"
        }
    }
    
    @IBAction func btnNumber3(_ sender: Any) {
        if (StringCalculationSign.isEmpty){
            if (!BoolExistNumber || lblResult.text! == "0"){
                lblResult.text = "3"
                BoolExistNumber = true
            }
            else{
                lblResult.text! += "3"
            }
        }
        else if (StringCalculationSign.count == 1){
            if (!BoolExistNumber){
                StringInput = lblResult.text!
                lblResult.text! = "3"
                StringCalculationSign += "3"
            }
            else{
                lblResult.text! += "3"
                StringCalculationSign += "3"
            }
        }
        else{
            lblResult.text! += "3"
            StringCalculationSign += "3"
        }
    }
    
    @IBAction func btnNumber4(_ sender: Any) {
        if (StringCalculationSign.isEmpty){
            if (!BoolExistNumber || lblResult.text! == "0"){
                lblResult.text = "4"
                BoolExistNumber = true
            }
            else{
                lblResult.text! += "4"
            }
        }
        else if (StringCalculationSign.count == 1){
            if (!BoolExistNumber){
                StringInput = lblResult.text!
                lblResult.text! = "4"
                StringCalculationSign += "4"
            }
            else{
                lblResult.text! += "4"
                StringCalculationSign += "4"
            }
        }
        else{
            lblResult.text! += "4"
            StringCalculationSign += "4"
        }
    }
    
    @IBAction func btnNumber5(_ sender: Any) {
        if (StringCalculationSign.isEmpty){
            if (!BoolExistNumber || lblResult.text! == "0"){
                lblResult.text = "5"
                BoolExistNumber = true
            }
            else{
                lblResult.text! += "5"
            }
        }
        else if (StringCalculationSign.count == 1){
            if (!BoolExistNumber){
                StringInput = lblResult.text!
                lblResult.text! = "5"
                StringCalculationSign += "5"
            }
            else{
                lblResult.text! += "5"
                StringCalculationSign += "5"
            }
        }
        else{
            lblResult.text! += "5"
            StringCalculationSign += "5"
        }
    }
    
    @IBAction func btnNumber6(_ sender: Any) {
        if (StringCalculationSign.isEmpty){
            if (!BoolExistNumber || lblResult.text! == "0"){
                lblResult.text = "6"
                BoolExistNumber = true
            }
            else{
                lblResult.text! += "6"
            }
        }
        else if (StringCalculationSign.count == 1){
            if (!BoolExistNumber){
                StringInput = lblResult.text!
                lblResult.text! = "6"
                StringCalculationSign += "6"
            }
            else{
                lblResult.text! += "6"
                StringCalculationSign += "6"
            }
        }
        else{
            lblResult.text! += "6"
            StringCalculationSign += "6"
        }
    }
    
    @IBAction func btnNumber7(_ sender: Any) {
        if (StringCalculationSign.isEmpty){
            if (!BoolExistNumber || lblResult.text! == "0"){
                lblResult.text = "7"
                BoolExistNumber = true
            }
            else{
                lblResult.text! += "7"
            }
        }
        else if (StringCalculationSign.count == 1){
            if (!BoolExistNumber){
                StringInput = lblResult.text!
                lblResult.text! = "7"
                StringCalculationSign += "7"
            }
            else{
                lblResult.text! += "7"
                StringCalculationSign += "7"
            }
        }
        else{
            lblResult.text! += "7"
            StringCalculationSign += "7"
        }
    }
    
    @IBAction func btnNumber8(_ sender: Any) {
        if (StringCalculationSign.isEmpty){
            if (!BoolExistNumber || lblResult.text! == "0"){
                lblResult.text = "8"
                BoolExistNumber = true
            }
            else{
                lblResult.text! += "8"
            }
        }
        else if (StringCalculationSign.count == 1){
            if (!BoolExistNumber){
                StringInput = lblResult.text!
                lblResult.text! = "8"
                StringCalculationSign += "8"
            }
            else{
                lblResult.text! += "8"
                StringCalculationSign += "8"
            }
        }
        else{
            lblResult.text! += "8"
            StringCalculationSign += "8"
        }
    }
    
    @IBAction func btnNumer9(_ sender: Any) {
        if (StringCalculationSign.isEmpty){
            if (!BoolExistNumber || lblResult.text! == "0"){
                lblResult.text = "9"
                BoolExistNumber = true
            }
            else{
                lblResult.text! += "9"
            }
        }
        else if (StringCalculationSign.count == 1){
            if (!BoolExistNumber){
                StringInput = lblResult.text!
                lblResult.text! = "9"
                StringCalculationSign += "9"
            }
            else{
                lblResult.text! += "9"
                StringCalculationSign += "9"
            }
        }
        else{
            lblResult.text! += "9"
            StringCalculationSign += "9"
        }
    }
    
    @IBAction func btnComma(_ sender: Any) {
        if (StringCalculationSign.isEmpty){
            lblResult.text! = "0."
            BoolExistNumber = true
        }
        else if (StringCalculationSign.count == 1){
            if (!BoolExistNumber){
                lblResult.text! = "0."
                StringCalculationSign += "0."
                BoolExistNumber = true
            }
        }
        else if (String(lblResult.text!).firstIndex(of: ".") == nil){
            lblResult.text! += "."
            StringCalculationSign += "."
            BoolExistNumber = true
        }
    }
}

