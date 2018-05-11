//
//  ObserverPatternProtocols.swift
//  JSONandObserver - iOS
//
//  Created by Arturo Sanhueza on 28-04-18.
//  Copyright © 2018 Arturo Sanhueza. All rights reserved.
//

import Foundation

protocol Subject {
    func registerObserver(o: Observer)
    func updateInObserver(message: Int)
}

protocol Observer {
    func getMessage(message:Int)
}
