//
//  ViewController.swift
//  StoreHub
//
//  Created by Lainel John Dela Cruz on 15/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit
import SVProgressHUD;

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var UIEmail: UITextField!
    @IBOutlet weak var UIPassword: UITextField!
    @IBOutlet weak var UIError: UILabel!
    @IBOutlet weak var UIDoneBtn: UIButton!
    
    var fbCustom:FirebaseCustom=FirebaseCustom();
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.UIEmail.delegate=self;
        self.UIPassword.delegate=self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func OnLoginClick(_ sender: Any) {
        SVProgressHUD.show();
        self.fbCustom.AuthUser(completionHandler: {
            (response, error) in
            if error == nil{
                self.performSegue(withIdentifier: "loginToDashboard", sender: sender);
            }else{
                self.UIError.alpha=1;
                self.UIError.text=error?.localizedDescription
            }
            SVProgressHUD.dismiss();
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginToDashboard"{
            let destVC=segue.destination as! DashboardViewController;
            destVC.fbCustom=self.fbCustom;
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.UIDoneBtn.alpha=1;
    }
    
    @IBAction func OnDoneClick(_ sender: Any) {
        self.UIEmail.endEditing(true);
        self.UIPassword.endEditing(true);
        self.UIDoneBtn.alpha=0;
    }
    
    
    
    
    

}

