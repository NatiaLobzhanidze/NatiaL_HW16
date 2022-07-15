//
//  TableViewCellExtensions.swift
//  NatiaL_HW16
//
//  Created by Natia's Mac on 15.07.22.
//

import Foundation
import UIKit

extension UITableViewCell {
    static var identifier: String { String(describing: self) }
    
    static var nib: UINib { UINib(nibName: identifier, bundle: nil) }
}
