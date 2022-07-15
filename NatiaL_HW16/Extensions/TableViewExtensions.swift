//
//  TableViewExtensions.swift
//  NatiaL_HW16
//
//  Created by Natia's Mac on 15.07.22.
//

import Foundation
import UIKit

extension UITableView {
    func registerClass<T: UITableViewCell>(class: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.identifier)
    }
    
    func registerNib<T: UITableViewCell>(class: T.Type) {
        self.register(T.nib, forCellReuseIdentifier: T.identifier)
    }
    
    func deque<T: UITableViewCell>(class: T.Type, for indexPath: IndexPath) -> T {
        dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
}

