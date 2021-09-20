//
//  ViewController2.swift
//  CafeMiniApp
//
//  Created by BRYAN RUIZ on 9/15/21.
//

import UIKit
protocol dataEnterDelegate {
    func passData(info:[String:Double])
}

class ViewController2: UIViewController, sendDataOver  {

    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField: UITextField!
    var blahs: [String:Double] = [:]
    var deleg:dataEnterDelegate? = nil
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.isEditable = false
    
        // Do any additional setup after loading the view.
    }
    func dataPassed(info: [String : Double]) {
        textView.text = ""
        for (f,d) in info{
        blahs[f] = d
        }
        for (g,f) in blahs {
            textView.text = "\(g): \(f)"
        }
    }

    @IBAction func add(_ sender: UIButton) {
        blahs[textField.text!] = Double(textField2.text!)
        if (deleg != nil){
            deleg!.passData(info: blahs)
        }
        for (c,d) in blahs{ print("\(c): \(d)")}
        textField.text = ""
        textField2.text = ""
    }

    @IBAction func remove(_ sender: UIButton){
        blahs.removeValue(forKey: textField.text!)
        if (deleg != nil){
            deleg!.passData(info: blahs)
        }
        for (c,d) in blahs {
            textView.text = "\(c): \(d)"
        }
        textField.text = ""
        textField2.text = ""
    }
    
}
