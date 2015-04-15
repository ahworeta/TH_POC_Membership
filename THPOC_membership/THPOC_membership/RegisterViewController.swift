//
//  RegisterViewController.swift
//  THPOC_membership
//
//  Created by Matt Solano on 4/7/15.
//  Copyright (c) 2015 Inflexxion. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, NSURLConnectionDataDelegate {

    @IBOutlet weak var emaiTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    var theConnnection: NSURLConnection?
    var webServiceData:NSMutableData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signUp(sender: UIButton) {
        
        let userEmail = emaiTF.text
        let userPassword = passwordTF.text
        let userConfirmPassword = confirmPasswordTF.text
        
        let token = MobileCrypoUtil().generateSecurityToken()
        let actor = MobileActor(_deviceId: UIDevice.currentDevice().identifierForVendor.UUIDString, _membershipId: "", _securityToken: token, _domainId: "tobeadded")  //TODO: get domainid from settings
        
        let regReq = RegistrationRequest(actor: actor, _email: userEmail, _password: userPassword)

        
        if(userEmail.isEmpty || userPassword.isEmpty)
        {
            displayAlertMessage("All fields are required.")
            return
        }
        
        if(userPassword != userConfirmPassword)
        {
            displayAlertMessage("Passwords do not match.")
            return
        }
        
        
        let parametersString = "email=\(regReq.Email)&password=\(regReq.Password)&token=\(actor.SecurityToken)&deviceId=\(actor.DeviceId)&domainId=\(actor.DomainId)&membershipId=\(actor.MembershipId)"
        
        var url:String = "http://10.200.20.86/api/mobileservice/Register?\(parametersString)"
        
        
        let theURL = NSURL(string: url)!
        
        var req:NSURLRequest = NSURLRequest(URL: theURL)
        
        theConnnection = NSURLConnection(request: req, delegate: self, startImmediately: true)
       
    }
    
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        webServiceData = NSMutableData()
    }
    
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        webServiceData?.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        let JsonStr = NSString(data: webServiceData!, encoding: NSUTF8StringEncoding)
        println("json = \(JsonStr)")
        
        var jsonDict =  NSJSONSerialization.JSONObjectWithData(webServiceData!, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
                
        println("jsonDict = \(jsonDict)")
        
        
        var resultValue = jsonDict["Message"] as NSString
        println("result:\(resultValue)")
            
        var messageToDisplay:String = jsonDict["Message"] as String!
        //Display message
        displayAlertMessage(messageToDisplay)
        
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        println("connection failed \(error.description))")
    }
    
    func displayAlertMessage(userMessage:String)
    {
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
}
