//
//  JSONData.swift
//  JSONandObserver - iOS
//
//  Created by Arturo Sanhueza on 01-05-18.
//  Copyright © 2018 Arturo Sanhueza. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class JSONData: Object, Mappable {
    dynamic var updated = 0
    dynamic var id = 0
    dynamic var nombre: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id    <- map["id"]
        updated         <- map["updated"]
        nombre      <- map["nombre"]
    }
}
