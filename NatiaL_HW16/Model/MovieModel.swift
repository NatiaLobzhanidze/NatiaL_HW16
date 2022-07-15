//
//  MovieModel.swift
//  NatiaL_HW16
//
//  Created by Natia's Mac on 15.07.22.
//

import Foundation
import UIKit
struct Movie {
    
    enum Genre: String, CaseIterable {
        case action
        case drama
        case comedy
    }
    let image : UIImage!
    let title: String
    let releaseDate: String
    let imdb: Double
    let mainActor: String
    var seen: Bool
    var genre: Genre
    let isFavourite: Bool
    let description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
}

let titlesAndActorsDictionary = ["Doctor Strange" : "Benedict Cumberbatch" ,
                         "WandaVision" : "Elizabeth Olsen and Paul Bettany",
                         "Loki" : "Tom Hiddleston" ,
                         "Spider-Man": "Tom Holland" ,
                         "Iron Man" : "Robert Downey Jr.",
                         "Captain America: The Winter Soldier" : "Chris Evans",
                                 "Thor: Love and Thunder" : "Chris Hemsworth and Natalie Portman",
                         "Black Widow" : "Scarlett  Johansson " ,
                         "Capitan Marvel" : "Brie Larson ",
                        "Black Panther": "Chadwick Boseman" ]

