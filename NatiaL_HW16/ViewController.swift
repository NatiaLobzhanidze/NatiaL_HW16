//
//  ViewController.swift
//  NatiaL_HW16
//
//  Created by Natia's Mac on 15.07.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    static var movieList = [Movie]()
    var watchedArray = [Movie]()
    var unwatchedArray = [Movie]()
    var filteredArray = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        makeMovieList()
        tableView.registerNib(class: FilterByGenreTableViewCell.self)
        tableView.registerNib(class: MovieListTableViewCell.self)
        
    }
    
    func makeMovieList() {
    
        let genre = Movie.Genre.allCases
        for i in 0..<titlesAndActorsDictionary.count {
            guard let movieGenre = genre.randomElement(), let genre = Movie.Genre(rawValue: movieGenre.rawValue) else { return }
            let title = titlesAndActorsDictionary.keys.map{$0}[i]
            let actor = titlesAndActorsDictionary.values.map{$0}[i]
            ViewController.movieList.append(Movie(image: UIImage(named: title), title: title, releaseDate: "\(Int.random(in: 2005...2022))", imdb: Double( Double.random(in: 0...5).format(f: oneFormat)) ?? 0.0, mainActor: actor, seen: Bool.random(), genre: genre, isFavourite: Bool.random()))
        }
        watchedArray = ViewController.movieList.filter({$0.seen == true })
        unwatchedArray = ViewController.movieList.filter({$0.seen == false })
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterByGenreTableViewCell", for: indexPath)
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
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
           return ""
        } else if  section == 1 {
            return "Seen"
        } else {
            return  "Going to See "
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

extension ViewController: FilterTableView {
    func filterArray(by name: String) {

        switch name {
        case  "all":
                 //All
                 watchedArray = ViewController.movieList.filter({$0.seen == true })
                 unwatchedArray = ViewController.movieList.filter({$0.seen == false })
            self.tableView.reloadData()
            
        case "comedy":
                 // Comedy
                 watchedArray = ViewController.movieList.filter{$0.seen == true }.filter({$0.genre.rawValue == Movie.Genre.comedy.rawValue})
                 unwatchedArray = ViewController.movieList.filter({$0.seen == false }).filter({$0.genre.rawValue == Movie.Genre.comedy.rawValue})
                 tableView.reloadData()
            
             case "action":
                 // Action
                 watchedArray = ViewController.movieList.filter{$0.seen == true }.filter({$0.genre.rawValue == Movie.Genre.action.rawValue})
                 unwatchedArray = ViewController.movieList.filter({$0.seen == false }).filter({$0.genre.rawValue == Movie.Genre.action.rawValue})
                 tableView.reloadData()
            
             case "drama":
                 //Drama
                 watchedArray = ViewController.movieList.filter{$0.seen == true }.filter({$0.genre.rawValue == Movie.Genre.drama.rawValue})
                 unwatchedArray = ViewController.movieList.filter({$0.seen == false }).filter({$0.genre.rawValue == Movie.Genre.drama.rawValue})
                 tableView.reloadData()
             default:
                 break
     
             }
        }
    }
    
    
