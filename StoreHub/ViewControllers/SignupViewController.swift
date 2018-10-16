//
//  SignupViewController.swift
//  StoreHub
//
//  Created by Lainel John Dela Cruz on 15/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit
import SVProgressHUD;

class SignupViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var UIEmailTF: UITextField!
    @IBOutlet weak var UIFirstTF: UITextField!
    @IBOutlet weak var UILastTF: UITextField!
    @IBOutlet weak var UIPasswordTF: UITextField!
    @IBOutlet weak var UIRPasswordTF: UITextField!
    
    @IBOutlet weak var UIError: UILabel!
    
    var fbCustom:FirebaseCustom?;
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden=false;
        // Do any additional setup after loading the view.
        self.UIError.alpha=0;
        self.fbCustom=FirebaseCustom();
        //
        self.UIEmailTF.delegate=self;
        self.UIPasswordTF.delegate=self;
        self.UIFirstTF.delegate=self;
        self.UILastTF.delegate=self;
        self.UIPasswordTF.delegate=self;
        self.UIRPasswordTF.delegate=self;
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func SubmitOnClick(_ sender: Any) {
        SVProgressHUD.show();
        self.fbCustom?.userInfo?.Email=self.UIEmailTF.text!;
        self.fbCustom?.userInfo?.Password=self.UIPasswordTF.text!;
        self.fbCustom?.userInfo?.Firstname=self.UIFirstTF.text!;
        self.fbCustom?.userInfo?.Lastname=self.UILastTF.text!
        
        if (self.fbCustom?.userInfo?.CheckData(repass: self.UIRPasswordTF.text!))!{
            self.fbCustom?.createUser(completionHandler: {
                (resp, err) in
                if err == nil {
                    self.performSegue(withIdentifier: "signupToDashboard", sender: sender);
                }else{
                    self.UIError.alpha=1;
                    self.UIError.text=err?.localizedDescription;
                }
                SVProgressHUD.dismiss();
                
            })
        }else{
            SVProgressHUD.dismiss();
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "signupToDashboard"{
            let destVC=segue.destination as! DashboardViewController;
            destVC.fbCustom=self.fbCustom!;
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.UIDoneBtn.alpha=1;
    }
    @IBOutlet weak var UIDoneBtn: UIButton!
    @IBAction func OnDoneClick(_ sender: Any) {
        self.UIDoneBtn.alpha=0;
        self.UIEmailTF.endEditing(true);
        self.UIFirstTF.endEditing(true);
        self.UILastTF.endEditing(true);
        self.UIPasswordTF.endEditing(true);
        self.UIRPasswordTF.endEditing(true);
    }
    
    
    
}
