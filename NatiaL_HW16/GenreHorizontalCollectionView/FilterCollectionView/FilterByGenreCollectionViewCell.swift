//
//  FilterByGenreCollectionViewCell.swift
//  NatiaL_HW16
//
//  Created by Natia's Mac on 15.07.22.
//

import UIKit
protocol FilterTableView {
    func filterArray(by : String)
}
class FilterByGenreCollectionViewCell: UICollectionViewCell {
    
  static var filterDelegate: FilterTableView!
    
    @IBOutlet weak var genreBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func filterMoviesByGenreBtn(_ sender: UIButton) {
        guard let name = sender.titleLabel?.text else { return }
        FilterByGenreCollectionViewCell.filterDelegate?.filterArray(by: name.lowercased())
    }
    
    
    func configureBtnName (by title: String) {
        genreBtn.setTitle(title, for: UIControl.State.normal)
    }
}
