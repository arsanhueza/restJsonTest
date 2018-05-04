//
//  Observer.swift
//  restApiJson
//
//  Created by Arturo Sanhueza on 04-05-18.
//  Copyright © 2018 Arturo Sanhueza. All rights reserved.
//

protocol Observer{
    var id : Int{ get }
    func update()
}
