//
//  FilterByGenreCollectionViewCell.swift
//  NatiaL_HW16
//
//  Created by Natia's Mac on 15.07.22.
//

import UIKit

class FilterByGenreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var genreBtn: UIButton!
    
    @IBOutlet weak var genreFilterLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureBtnName (by title: String) {
        genreFilterLb.text = title
        
    }
}
