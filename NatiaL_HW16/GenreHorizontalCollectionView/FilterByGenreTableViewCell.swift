//
//  FilterByGenreTableViewCell.swift
//  NatiaL_HW16
//
//  Created by Natia's Mac on 15.07.22.
//

import UIKit



class FilterByGenreTableViewCell: UITableViewCell{
    
//    func filterArray(by genre: String) {
//
//        vC.unwatchedArray = ViewController.movieList.filter({$0.genre.rawValue == genre.lowercased()}).filter({$0.seen})
//        vC.watchedArray = ViewController.movieList.filter({$0.genre.rawValue == genre.lowercased()})
//        vC.tableView?.reloadData()
//    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNib(class: FilterByGenreCollectionViewCell.self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension FilterByGenreTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FilterModel.filterMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(FilterByGenreCollectionViewCell.self, for: indexPath)
        cell.configureBtnName(by: FilterModel.filterMenu[indexPath.row])
        cell.filterDelegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("sadsd")
       // filterDelegate?.filterArray(by: FilterModel.filterMenu[indexPath.row])
      
     
    }
    
    
}


extension FilterByGenreTableViewCell: FilterTableView {
    
    func filterArray(by target : String) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {return}
        ViewController.movieList.
    }
}

