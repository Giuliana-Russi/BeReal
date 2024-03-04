//
//  PostCell.swift
//  BeReal-GiuliRussi
//
//  Created by Giuliana Russi on 3/4/24.
//

import UIKit
import Alamofire
import AlamofireImage

class PostCell: UITableViewCell {
    @IBOutlet private weak var postImageView: UIImageView!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var captionLabel: UILabel!
    
    private var imageDataRequest: DataRequest?

    func configure(with post: Post) {
        if let user = post.user {
            usernameLabel.text = user.username
        }

        if let imageFile = post.imageFile,
           let imageUrl = imageFile.url {
            imageDataRequest = AF.request(imageUrl).responseImage { [weak self] response in
                switch response.result {
                case .success(let image):
                    self?.postImageView.image = image
                    print("success!!")
                case .failure(let error):
                    print("❌ Error getting image: \(error.localizedDescription)")
                    break
                }
            }
        }
        captionLabel.text = post.caption
        
        if let date = post.createdAt {
            dateLabel.text = DateFormatter.postFormatter.string(from: date)
        }

    }

    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.image = nil

        imageDataRequest?.cancel()

    }
}

