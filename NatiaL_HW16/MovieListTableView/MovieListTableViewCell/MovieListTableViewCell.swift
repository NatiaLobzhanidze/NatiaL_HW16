//
//  MovieListTableViewCell.swift
//  NatiaL_HW16
//
//  Created by Natia's Mac on 15.07.22.
//

import UIKit


// protocol/Delegate to pass data from MovieList to DetailsPage
protocol MovieListDelegate {
    func changeSection(for cell: MovieListTableViewCell)
}


class MovieListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieStatus: UIButton!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var movieIMDB: UILabel!
    
    var movieDelegate: MovieListDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func watchedOrNotBtn(_ sender: UIButton) {
        
        movieDelegate?.changeSection(for: self)
    }
    func configureMovie(with item: Movie){
        moviePoster.image = item.image
        movieTitle.text = item.title
        movieStatus.setTitle(item.seen ? " Seen " : "Going to See", for: UIControl.State.normal) 
        movieGenre.text = "\(item.genre)"
        movieIMDB.text = "\(item.imdb)"
    }
}
