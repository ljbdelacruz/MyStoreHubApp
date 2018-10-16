//
//  Geolocation.swift
//  StoreHub
//
//  Created by Lainel John Dela Cruz on 15/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation


class Geolocation{
    var longitude, latitude:Float?;
    init(){
        self.longitude=0;
        self.latitude=0;
    }
    convenience init(lon:Float, lat:Float){
        self.init()
        self.set(lon: lon, lat: lat);
    }
    func set(lon:Float, lat:Float){
        self.longitude=lon;
        self.latitude=lat;
    }
    func setData()->Dictionary<String, Any?>{
        let loc=["lon":self.longitude, "lat":self.latitude];
        return ["location":loc];
    }
}
