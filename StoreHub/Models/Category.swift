//
//  Category.swift
//  StoreHub
//
//  Created by Lainel John Dela Cruz on 15/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import Firebase

class Category{
    var ID, Name, CatType:String?;
    init(){
        self.ID="";
        self.Name="";
        self.CatType="";
    }
    convenience init(id:String, name:String, catType:String){
        self.init();
        self.set(id: id, name: name, catType: catType);
    }
    func set(id:String, name:String, catType:String){
        self.ID=id;
        self.Name=name;
        self.CatType=catType;
    }
    func InsertNew(fbCustom:FirebaseCustom, completionHandler: @escaping (Any?, Error?) -> ()){
        let db=Database.database().reference().child("Category");
        let param=["Name":self.Name!, "Type": self.CatType!];
        fbCustom.InsertData(data: param, db: db, completionHandler: completionHandler)
    }
    
}
