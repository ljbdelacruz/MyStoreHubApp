//
//  UserInfo.swift
//  SimpleChatMessaging
//
//  Created by Lainel John Dela Cruz on 12/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import Firebase;



class UserInfo{
    public var Email, Password, Firstname, Lastname:String
    init(){
        self.Email="";
        self.Password="";
        self.Firstname="";
        self.Lastname="";
    }
    convenience init(email:String, pass:String, fname:String, lname:String){
        self.init();
        self.set(email: email, pass: pass, fname:fname, lname:lname);
    }
    func set(email:String, pass:String, fname:String, lname:String){
        self.Email=email;
        self.Password=pass;
        self.Firstname=fname;
        self.Lastname=lname;
    }
    func CheckData(repass:String)->Bool{
        if(self.Password == repass){
            if(self.Email != "" && self.Password != "" && self.Firstname != "" && self.Lastname != ""){
                return true;
            }
        }
        return false;
    }
    func SaveNewUserInfo(fbCustom:FirebaseCustom,  completionHandler: @escaping (Any?, Error?) -> ()){
        var db=Database.database().reference().child("UserInfo");
        var param:[String:Any]=["Firstname":self.Firstname, "Lastname":self.Lastname, "Email":self.Email];
        fbCustom.InsertData(data: param, db: db, completionHandler: completionHandler)
    }
    
    
}
