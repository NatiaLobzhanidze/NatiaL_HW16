//
//  MovieDetailsViewController.swift
//  NatiaL_HW16
//
//  Created by Natia's Mac on 15.07.22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var favoriteMoveis = Set<String>()
    
    @IBOutlet weak var coverPoster: UIImageView!
    @IBOutlet weak var mainPoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var imdbRating: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var watchedStatus: UILabel!
    @IBOutlet weak var mainActor: UILabel!
    @IBOutlet weak var genreLb: UILabel!
    @IBOutlet weak var overView: UITextView!
    
    @IBOutlet weak var detailsCollectionView: UICollectionView!
    
    var detailsModel: Movie?
    var newArr = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        detailsCollectionView.dataSource = self
        detailsCollectionView.delegate = self
        detailsCollectionView.registerNib(class: DetailsCollectionViewCell.self)
    }
    
    @IBAction func makeAsFav(_ sender: UIButton) {
        
        guard let title = self.movieTitle.text else { return }
        
        if sender.titleLabel?.text == "Add To Favorite List" {
            sender.setTitle("Remove from Favorite List", for: UIControl.State.normal)
            favoriteMoveis.insert(title)
            
            print(favoriteMoveis.count)
        } else {
            sender.setTitle("Add To Favorite List", for: UIControl.State.normal)
            favoriteMoveis.remove(title)
            print(favoriteMoveis.count)
        }
        //            delegate?.passFavoriteMovieTitle(from: Array(favoriteMoveis))
    }
    
    func setUpView(){
        guard let movieDetails = detailsModel else { return }
        coverPoster.image = movieDetails.image
        mainPoster.image = movieDetails.image
        movieTitle.text = movieDetails.title
        imdbRating.text = String(movieDetails.imdb)
        genreLb.text = movieDetails.genre.rawValue
        releaseDate.text = "     \(movieDetails.releaseDate)"
        watchedStatus.text = movieDetails.seen ? "Watched" : "Going to Watch"
        mainActor.text = movieDetails.mainActor
        overView.text = movieDetails.description
    }
}

extension MovieDetailsViewController: UICollectionViewDelegate , UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let genre = detailsModel?.genre else { return 0}
        let newArr = ViewController.movieList.filter{$0.genre == genre}.filter({$0.title != detailsModel?.title})
        return newArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(DetailsCollectionViewCell.self, for: indexPath)
        guard let genre = detailsModel?.genre else { return UICollectionViewCell() }
        newArr = ViewController.movieList.filter{$0.genre == genre}.filter({$0.title != detailsModel?.title}
        )
        cell.configureDetails(from: newArr[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        detailsModel = newArr[indexPath.row]
        setUpView()
        
    }
    
    
}
extension MovieDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200,
                      height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    }
}
