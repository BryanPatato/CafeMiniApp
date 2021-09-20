//
//  ViewController2.swift
//  CafeMiniApp
//
//  Created by BRYAN RUIZ on 9/15/21.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField: UITextField!
    var blahs: [String:Double] = [:]
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for (d,c) in blahs { textView.text! += "\(d): \(c)\n" }
        textView.isEditable = false
    }

    @IBAction func add(_ sender: UIButton) {
        textView.text = ""
        blahs[textField.text!] = Double(textField2.text!)
        for (c,d) in blahs{ print("\(c): \(d)") }
        textField.text = ""
        textField2.text = ""
    }

    @IBAction func remove(_ sender: UIButton){
        blahs.removeValue(forKey: textField.text!)
        textView.text = ""
        for (c,d) in blahs { textView.text! += "\(c): \(d)\n" }
        textField.text = ""
        textField2.text = ""
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ovc = segue.source as! ViewController
        for (f,g) in blahs { ovc.list[f] = g } 
    }
    
}
