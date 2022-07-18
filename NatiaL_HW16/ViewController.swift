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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeMovieList()
        tableViewSetUp()
    }
    
    func tableViewSetUp(){
        tableView.delegate = self
        tableView.dataSource = self
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

