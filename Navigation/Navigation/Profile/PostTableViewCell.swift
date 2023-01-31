
import UIKit
import SnapKit
import iOSIntPackage

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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        #if DEBUG
        backgroundColor = .cyan
        #endif
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup (with viewModel: ViewModel) {
        let sourceImage = viewModel.image ?? UIImage()
        authors.text = viewModel.author
        descriptions.text = viewModel.description
        likes.text = "Likes: \(viewModel.likes)"
        views.text = "Views: \(viewModel.views)"
        ImageProcessor.init().processImage(sourceImage: sourceImage, filter: .chrome) { filterImage in
            images.image = filterImage
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        images.image = nil
        authors.text = nil
        descriptions.text = nil
        likes.text = nil
        views.text = nil
    }
    
    private func setupView() {
        addSubview(images)
        addSubview(authors)
        addSubview(descriptions)
        addSubview(likes)
        addSubview(views)
        
        authors.snp.makeConstraints { make in
            make.top.equalTo(self).offset(16)
            make.left.equalTo(self).offset(16)
            make.right.equalTo(self).offset(-16)
            make.height.equalTo(30)
        }
        images.snp.makeConstraints { make in
            make.top.equalTo(authors.snp.bottom).offset(16)
            make.left.equalTo(self).offset(16)
            make.right.equalTo(self).offset(-16)
            make.height.equalTo(images.snp.width)
        }
        descriptions.snp.makeConstraints { make in
            make.top.equalTo(images.snp.bottom).offset(16)
            make.left.equalTo(self).offset(16)
            make.right.equalTo(self).offset(-16)
        }
        likes.snp.makeConstraints { make in
            make.top.equalTo(descriptions.snp.bottom).offset(16)
            make.left.equalTo(self).offset(16)
            make.bottom.equalTo(self).offset(-16)
        }
        views.snp.makeConstraints { make in
            make.top.equalTo(descriptions.snp.bottom).offset(16)
            make.right.equalTo(self).offset(-16)
            make.bottom.equalTo(self).offset(-16)
        }
        
    }
    
}
