//
//  FirebaseCustom.swift
//  SimpleChatMessaging
//
//  Created by Lainel John Dela Cruz on 12/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import Firebase

class FirebaseCustom{
    public var userInfo:UserInfo?;
    init(){
        self.userInfo=UserInfo();
    }
    func createUser(completionHandler: @escaping (Any?, Error?) -> ()){
        Auth.auth().createUser(withEmail: (self.userInfo?.Email)!, password: (self.userInfo?.Password)!, completion: {
            (user, error) in
            if error==nil{
                //success user created
                self.userInfo?.SaveNewUserInfo(fbCustom: self, completionHandler: completionHandler)
            }else{
                //print error
                completionHandler(nil, error);
            }
        })
    }
    func AuthUser(completionHandler: @escaping (Any?, Error?) -> ()){
        Auth.auth().signIn(withEmail: (self.userInfo?.Email)!, password: (self.userInfo?.Password)!, completion: {
            (response, error) in
            if error==nil{
                completionHandler(response, nil);
            }else{
                print("Auth Error!");
                print(error!);
                completionHandler(nil, error);
            }
        })
    }
    func Logout(completionHandler: @escaping (Bool) -> ()){
        do{
            try Auth.auth().signOut()
            completionHandler(true)
        }catch{
            completionHandler(false);
        }
    }
    func InsertData(data:Any?, db:DatabaseReference, completionHandler: @escaping (Any?, Error?) -> ()){
        db.childByAutoId().setValue(data!){
            (error, ref) in
            if error == nil{
                completionHandler(ref, nil);
            }else{
                completionHandler(nil, error as! Error);
            }
        }
    }
    func InsertCustomID(id:String,db:DatabaseReference, param:Any?, completionHandler: @escaping (Any?, Error?) -> ()){
        db.child(id).setValue(param){
            (error, resp) in
            if error == nil{
                completionHandler(resp, nil);
            }else{
                completionHandler(nil, error);
            }
        }
    }
    
    
    func RetrieveDataValue(db:DatabaseReference, completionHandler: @escaping (DataSnapshot?) -> ()){
//        let messageDB=Database.database().reference().child(name);
        db.observe(.childAdded, with: completionHandler)
    }
    
    
}



