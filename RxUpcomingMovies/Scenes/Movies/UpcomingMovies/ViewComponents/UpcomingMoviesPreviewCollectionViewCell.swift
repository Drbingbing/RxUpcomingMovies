//
//  UpcomingMoviesPreviewCollectionViewCell.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/7/1.
//

import UIKit
import Kingfisher


class UpcomingMoviesPreviewCollectionViewCell: UICollectionViewCell {
    
    static let nib = UINib(nibName: "UpcomingMoviesPreviewCollectionViewCell", bundle: nil)
    static let identifier = "UpcomingMoviesPreviewCollectionViewCell"

    @IBOutlet weak var imageView: UIImageView!
    
    var viewModel: UpcomingMovieCellViewModelProtocol? {
        didSet { self.updateData() }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.kf.cancelDownloadTask()
        imageView.image = nil
    }

    private func updateData() {
        guard let viewModel = viewModel else {
            return
        }

        if let posterURL = viewModel.posterURL {
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(with: posterURL)
        }
    }
}
