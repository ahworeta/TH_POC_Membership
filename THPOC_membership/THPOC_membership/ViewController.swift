//
//  ViewController.swift
//  THPOC_membership
//
//  Created by Dev on 2/27/15.
//  Copyright (c) 2015 Inflexxion. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameFT: UITextField!
    
    @IBOutlet weak var pinFT: UITextField!
    
    @IBOutlet weak var feedbackLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Login(sender: AnyObject) {
        var bm = BusinessManager()
        var c = LoginCredential(loginUserName: userNameFT.text, loginPin: pinFT.text)
        var a = bm.Login(c)
        if !a {
            //userNameFT
            userNameFT.text = ""
            pinFT.text = ""
            feedbackLb.text = "Wrong credential, try again"
            return
        }
    }

}

