//
//  ViewController.swift
//  CafeMiniApp
//
//  Created by BRYAN RUIZ on 9/13/21.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate, sendBack{
    
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var textFeild: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textView2: UITextView!
    let alert2 = UIAlertController(title: "ADMIN", message: "whats the username and password", preferredStyle: .alert)
    var list: [String:Double] = ["hotdog":2.50,"cookie":1.00,"samich":2.00,"banana":0.50,"mango":5.00]
    let password = "puncake"
    let username = "waffle"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.isEditable = false
        textView2.isEditable = false
        alert2.addTextField(configurationHandler: nil)
        alert2.addTextField(configurationHandler: nil)
        alert2.addAction(UIAlertAction(title: "done", style: .default, handler: { [self, weak alert2] (_) in let textField2 = alert2?.textFields![0]
            let textField3 = alert2?.textFields![1]
            if textField2?.text == self.username && textField3?.text == self.password {
                self.performSegue(withIdentifier: "car", sender: self)
            }
        } ) )
    }
    override func viewWillAppear(_ animated: Bool) {
        textView2.text = ""
        for (f,g) in list {
            textView2.text! += "\(f): \(g)\n"
        }
    }
    
    func getBack(info: [String : Double], info2: [String : Double]) {
        for (a,b) in info{ list[a] = b }
        for (c,_) in info2{ list.removeValue(forKey: c) }
    }
    
    @IBAction func sortPrice(_ sender: UIButton) {
        textView2.text = ""
        var sort = list.values.sorted()
        var sorted:[String:Double] = [:]
        while sorted.count != list.count {
            for i in 0...sort.count-1{
            for (a,b) in list{
                if sort[i] == b {
                    textView2.text += "\(a): $\(b)\n"
                }
                sorted[a] = b
            }
            }
            
        }
    }
    
    @IBAction func sortName(_ sender: UIButton) {
        textView2.text = ""
        var sort = list.keys.sorted()
        var sorted:[String:Double] = [:]
        while sorted.count != list.count {
            for i in 0...sort.count-1{
            for (a,b) in list{
                if sort[i] == a {
                    textView2.text += "\(a): $\(b)\n"
                }
                sorted[a] = b
            }
            }
        }
    }
    
    @IBAction func addItem(_ sender: UIButton) {
            if list[textFeild.text!] != nil {
                textView.text += " \(textFeild.text! ): $\(list[textFeild.text!]!)\n"
                label2.isHidden = true
            }
            else{
                label2.text = "item invaild"
            }
        }
    
    @IBAction func Admin(_ sender: UIBarButtonItem) {
        present(alert2, animated: true, completion: nil)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! ViewController2
        for (q,w) in list { nvc.blahs[q] = w }
        nvc.deleg = self
    }
    
    }
