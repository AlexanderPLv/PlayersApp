//
//  Presentable.swift
//  PlayersApp
//
//  Created by Alexander Pelevinov on 08.08.2023.
//

import UIKit

protocol Presentable {
    var toPresent: UIViewController? { get }
}
 
extension UIViewController: Presentable {
    var toPresent: UIViewController? {
        return self
    }
}
