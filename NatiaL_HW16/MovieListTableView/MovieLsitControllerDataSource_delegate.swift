//
//  MovieLsitControllerDataSource.swift
//  NatiaL_HW16
//
//  Created by Natia's Mac on 15.07.22.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if  indexPath.section == 0 {
            return 70
        } else {
            return 250
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: "Details", bundle: nil)
        let vc  = sb.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController
        
        guard let  vc = vc else { return }
        
        if indexPath.section == 0 {
            
        } else if  indexPath.section == 1 {
            let elem = watchedArray[indexPath.row]
            vc.detailsModel = Movie(image: elem.image, title: elem.title, releaseDate: elem.releaseDate, imdb: elem.imdb, mainActor: elem.mainActor, seen: elem.seen, genre: elem.genre, isFavourite: elem.isFavourite)
            
        } else {
            let elem = unwatchedArray[indexPath.row]
            vc.detailsModel = Movie(image: elem.image, title: elem.title, releaseDate: elem.releaseDate, imdb: elem.imdb, mainActor: elem.mainActor, seen: elem.seen, genre: elem.genre, isFavourite: elem.isFavourite)
        }
        
        navigationController?.pushViewController( vc, animated: true)
        
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int { 3 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            print(section.self)
            return 1
        case 1:
            return watchedArray.count
        default:
            return unwatchedArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return ""
        } else if  section == 1 {
            return "Seen"
        } else {
            return  "Going to See "
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FilterByGenreTableViewCell", for: indexPath) as! FilterByGenreTableViewCell
            cell.sendDataDelegate = self
            return cell
        case 1:
            let cell = tableView.deque(class: MovieListTableViewCell.self, for: indexPath)
            cell.configureMovie(with: watchedArray[indexPath.row])
            cell.movieDelegate = self
            return cell
        default:
            let cell = tableView.deque(class: MovieListTableViewCell.self, for: indexPath)
            cell.configureMovie(with: unwatchedArray[indexPath.row])
            cell.movieDelegate = self
            return cell
            
        }
    }
}

extension ViewController: MovieListDelegate {
    
    func changeSection(for cell: MovieListTableViewCell) {
        
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        if indexPath.section  == 1 {
            var chooseCell = watchedArray[indexPath.row]
            chooseCell.seen = !chooseCell.seen
            
            watchedArray.remove(at: indexPath.row)
            unwatchedArray.append(chooseCell)
            
        } else if indexPath.section  == 2  {
            var chooseCell = unwatchedArray[indexPath.row]
            chooseCell.seen = !chooseCell.seen
            
            unwatchedArray.remove(at: indexPath.row)
            watchedArray.append(chooseCell)
            
        }
        tableView.reloadData()
    }
}

extension ViewController: SendDataDelegate {
    func sendData(about index : Int) {
        
        switch index {
        case 0:
            
            watchedArray = ViewController.movieList.filter({$0.seen == true })
            unwatchedArray = ViewController.movieList.filter({$0.seen == false })
            tableView.reloadData()
        case 1:
            changeArrayElements(by: Movie.Genre.comedy.rawValue)
        case 2:
            changeArrayElements(by: Movie.Genre.action.rawValue)
        case 3:
            changeArrayElements(by: Movie.Genre.drama.rawValue)
        default:
            break
        }
    }
    
    func changeArrayElements(by genreName: String) {
        watchedArray = ViewController.movieList.filter{$0.seen == true }.filter({$0.genre.rawValue == genreName})
        
        unwatchedArray = ViewController.movieList.filter({$0.seen == false }).filter({$0.genre.rawValue == genreName})
        
        tableView.reloadData()
    }
}


