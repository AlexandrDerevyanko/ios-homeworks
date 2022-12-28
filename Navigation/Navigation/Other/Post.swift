//
//  Post.swift
//  Navigation
//
//  Created by Aleksandr Derevyanko on 12.11.2022.
//

import UIKit

var arrayOfPublications: [Post] = [publication1, publication2, publication3, publication4, publication5]

var publication1 = Post(author: "Corgi", description: "Some description", image: "1", likes: 143, views: 1421)
var publication2 = Post(author: "Corgi", description: "Some description", image: "2", likes: 150, views: 1831)
var publication3 = Post(author: "Corgi", description: "Some description", image: "3", likes: 258, views: 2638)
var publication4 = Post(author: "Corgi", description: "Some description", image: "4", likes: 122, views: 1500)
var publication5 = Post(author: "Corgi", description: "Some description", image: "5", likes: 118, views: 1823)

struct Post {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

struct SecondPost {
    var title: String
}

var sec = SecondPost(title: "2")


var data: [UIImage?] = [ UIImage(named: "collection1"), UIImage(named: "collection2"), UIImage(named: "collection3"), UIImage(named: "collection4"), UIImage(named: "collection5"), UIImage(named: "collection6"), UIImage(named: "collection7"), UIImage(named: "collection8"), UIImage(named: "collection9"), UIImage(named: "collection10"), UIImage(named: "collection11"), UIImage(named: "collection12"), UIImage(named: "collection13"), UIImage(named: "collection14"), UIImage(named: "collection15"), UIImage(named: "collection16"), UIImage(named: "collection17"), UIImage(named: "collection18"), UIImage(named: "collection19"), UIImage(named: "collection20"),]
