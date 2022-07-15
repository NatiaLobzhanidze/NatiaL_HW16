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
    
   var filterDelegate: FilterTableView!
    
    @IBOutlet weak var genreBtn: UIButton!
    
    @IBOutlet weak var genreFilterLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func filterMoviesByGenreBtn(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "ViewController") as? ViewController ,
        let name = sender.titleLabel?.text else { return }
        filterDelegate?.filterArray(by: name)
        if name == "Action" {
          
            print(vc.unwatchedArray.count)
            //vc.unwatchedArray.removeAll()
            vc.unwatchedArray = ViewController.movieList.filter({$0.genre.rawValue == Movie.Genre.action.rawValue})
            
            print(vc.unwatchedArray.count)
            vc.tableView?.reloadData()
        }
    }
    
    
    func configureBtnName (by title: String) {
        
//        genreBtn.setTitle(title, for: UIControl.State.normal)
        
        genreFilterLb.text = title
        
    }
}
