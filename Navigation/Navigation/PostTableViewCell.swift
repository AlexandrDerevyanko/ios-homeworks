
import UIKit

class PostTableViewCell: UITableViewCell {
    
    struct ViewModel {
        var author: String
        var description: String
        var image: UIImage?
        var likes: Int
        var views: Int
    }
    
    private let images: UIImageView = {
        let images = UIImageView()
        images.contentMode = .scaleAspectFill
        images.backgroundColor = .black
        images.translatesAutoresizingMaskIntoConstraints = false
        return images
    }()
    
    private let authors: UILabel = {
        let authors = UILabel()
        authors.font = UIFont(name: "Arial Bold", size: 20)
        authors.textColor = .black
        authors.numberOfLines = 2
        authors.translatesAutoresizingMaskIntoConstraints = false
        return authors
    }()
    
    private let descriptions: UILabel = {
        let descriptions = UILabel()
        descriptions.font = UIFont(name: "Arial normal", size: 14)
        descriptions.textColor = .systemGray
        descriptions.numberOfLines = 0
        descriptions.translatesAutoresizingMaskIntoConstraints = false
        return descriptions
    }()
    
    private let likes: UILabel = {
        let likes = UILabel()
        likes.font = UIFont(name: "Arial normal", size: 16)
        likes.textColor = .black
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()
    
    private let views: UILabel = {
        let views = UILabel()
        views.font = UIFont(name: "Arial normal", size: 16)
        views.textColor = .black
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()
    
    func setup (with viewModel: ViewModel) {
        images.image = viewModel.image
        authors.text = viewModel.author
        descriptions.text = viewModel.description
        likes.text = "Likes: \(viewModel.likes)"
        views.text = "Views: \(viewModel.views)"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(images)
        contentView.addSubview(authors)
        contentView.addSubview(descriptions)
        contentView.addSubview(likes)
        contentView.addSubview(views)
        
        NSLayoutConstraint.activate([
            
            authors.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authors.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authors.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            authors.bottomAnchor.constraint(equalTo: images.topAnchor, constant: -16),
            
            images.topAnchor.constraint(equalTo: authors.bottomAnchor, constant: 16),
            images.bottomAnchor.constraint(equalTo: descriptions.topAnchor, constant: -16),

            descriptions.topAnchor.constraint(equalTo: images.bottomAnchor, constant: 16),
            descriptions.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptions.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptions.bottomAnchor.constraint(equalTo: likes.topAnchor, constant: -16),
            
            likes.topAnchor.constraint(equalTo: descriptions.bottomAnchor, constant: 16),
            likes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            views.topAnchor.constraint(equalTo: descriptions.bottomAnchor, constant: 16),
            views.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            views.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)

        ])
    }
    
}
