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

class ViewController2: UIViewController {

    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField: UITextField!
    var blahs: [String:Double] = [:]
    var deleg:dataEnterDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
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


}
