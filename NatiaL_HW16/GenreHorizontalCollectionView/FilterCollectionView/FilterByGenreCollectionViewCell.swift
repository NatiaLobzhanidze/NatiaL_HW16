//
//  FilterByGenreCollectionViewCell.swift
//  NatiaL_HW16
//
//  Created by Natia's Mac on 15.07.22.
//

import UIKit

class FilterByGenreCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var genreBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func filterMoviesByGenreBtn(_ sender: Any) {
    }
    func configureBtnName (by title: String) {
        genreBtn.setTitle(title, for: UIControl.State.normal)
    }
}
