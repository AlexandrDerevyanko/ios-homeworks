//
//  Post.swift
//  Navigation
//
//  Created by Aleksandr Derevyanko on 12.11.2022.
//

import UIKit

public var arrayOfPublications: [Post] = [publication1, publication2, publication3, publication4, publication5]

public var publication1 = Post(author: "Corgi", description: "Some description", image: "1", likes: 143, views: 1421)
public var publication2 = Post(author: "Corgi", description: "Some description", image: "2", likes: 150, views: 1831)
public var publication3 = Post(author: "Corgi", description: "Some description", image: "3", likes: 258, views: 2638)
public var publication4 = Post(author: "Corgi", description: "Some description", image: "4", likes: 122, views: 1500)
public var publication5 = Post(author: "Corgi", description: "Some description", image: "5", likes: 118, views: 1823)

public struct Post {
    public var author: String
    public var description: String
    public var image: String
    public var likes: Int
    public var views: Int
    public init(author: String, description: String, image: String, likes: Int, views: Int) {
        self.author = author
        self.description = description
        self.image = image
        self.likes = likes
        self.views = views
    }
}

