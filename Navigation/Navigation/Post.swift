//
//  Post.swift
//  Navigation
//
//  Created by Aleksandr Derevyanko on 12.11.2022.
//

import UIKit

var arrayOfPublications: [Post] = [publication1, publication2, publication3, publication4, publication5]

var publication1 = Post(author: "Corgi", description: "Some description", image: "1", likes: 100, views: 1000)
var publication2 = Post(author: "Corgi", description: "Some description", image: "2", likes: 100, views: 1000)
var publication3 = Post(author: "Corgi", description: "Some description", image: "3", likes: 100, views: 1000)
var publication4 = Post(author: "Corgi", description: "Some description", image: "4", likes: 100, views: 1000)
var publication5 = Post(author: "Corgi", description: "Some description", image: "5", likes: 100, views: 1000)

struct Post {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

struct Post2 {
    let uuid = UUID().uuidString
}

struct SecondPost {
    var title: String
}

var sec = SecondPost(title: "2")
