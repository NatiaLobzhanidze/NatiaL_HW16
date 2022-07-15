//
//  DetailsCollectionViewCell.swift
//  NatiaL_HW16
//
//  Created by Natia's Mac on 15.07.22.
//

import UIKit

class DetailsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var seenLb: UILabel!
    @IBOutlet weak var imdbLB: UILabel!
    @IBOutlet weak var titleLb: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureDetails(from item: Movie) {
        image.image = item.image
        seenLb.text = item.seen ? "Seen" : "Going to See"
        imdbLB.text = "\(item.imdb)"
        titleLb.text = item.title
    }
    
}
