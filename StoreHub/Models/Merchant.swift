//
//  Merchant.swift
//  StoreHub
//
//  Created by Lainel John Dela Cruz on 15/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import Firebase


class Merchant:Geolocation{
    var ID, OwnerEmail, Name:String?
    var responseRate, reviewRate:Float?;
    var productCount:Int?;
    
    override init(){
        super.init();
        self.ID="";
        self.OwnerEmail="";
        self.Name="";
        self.responseRate=0;
        self.reviewRate=0;
        self.productCount=0;
    }
    convenience init(id:String, oid:String, name:String, rr:Float, rrate:Float, pcount:Int){
        self.init();
        self.set(id: id, oid: oid, name: name, respRate: rr, revRate: rrate, prodCount: pcount);
    }
    func set(id:String, oid:String, name:String, respRate:Float, revRate:Float, prodCount:Int){
        self.ID=id;
        self.OwnerEmail=oid;
        self.Name=name;
        self.responseRate=respRate;
        self.reviewRate=revRate;
        self.productCount=prodCount;
    }
    func InsertNew(fbCustom:FirebaseCustom, completionHandler: @escaping (Any?, Error?) -> ()){
        let db=Database.database().reference().child("Merchants")
        let param=["Name":self.Name, "OwnerID":self.OwnerEmail, "Location":self.setData(), "ReviewRate":self.reviewRate, "ProductCount":self.productCount, "ResponseRate":self.responseRate] as [String : Any];
        fbCustom.InsertData(data: param, db: db, completionHandler: completionHandler)
    }
    static func GetByLocation(lon:Float, lat:Float)->[Merchant]{
        return [];
    }
    
    func GetByMerchantID(id:String, fbCustom:FirebaseCustom, completionHandler: @escaping (Any?, String?) -> ()){
        let db=Database.database().reference().child("Merchants").child(id);
        fbCustom.RetrieveDataValue(db: db, completionHandler: {
            (resp) in
            if resp != nil{
                print("Merchant");
                print(resp);
                completionHandler(resp, nil)
            }else{
                completionHandler(nil, "Sorry cannot connect to server right now please contact administrator")
            }
        })
    }
    
    
    
    
}
