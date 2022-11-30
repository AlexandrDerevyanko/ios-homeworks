//
//  Post.swift
//  Homework 6
//
//  Created by Aleksandr Derevyanko on 29.11.2022.
//

import UIKit

struct Post {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

var publication1 = Post(author: "Corgi", description: "Some description", image: "1", likes: 100, views: 1000)
var publication2 = Post(author: "Corgi", description: "Some description", image: "2", likes: 100, views: 1000)
var publication3 = Post(author: "Corgi", description: "Some description", image: "3", likes: 100, views: 1000)
var publication4 = Post(author: "Corgi", description: "Some description", image: "4", likes: 100, views: 1000)
var publication5 = Post(author: "Corgi", description: "Some description", image: "5", likes: 100, views: 1000)

var array: [Post] = [publication1, publication2, publication3, publication4, publication5]
