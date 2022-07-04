//
//  ViewController.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/28.
//

import UIKit
import RxSwift

class UpcomingMoviesViewController: BaseViewController, Storyboarded {
    
    static var storyboardName: String { "UpcomingMovies" }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: UpcoimgMoviesViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "UpcomingMovies"
        self.binding()
        self.setupCollectionView()
        self.setupCollectionViewLayout()
        self.viewModel.getMovies()
    }
    
    private func binding() {
        self.viewModel.movieSubject
            .asObserver()
            .bind(
                to: self.collectionView.rx.items(
                    cellIdentifier: UpcomingMoviesPreviewCollectionViewCell.identifier, cellType: UpcomingMoviesPreviewCollectionViewCell.self
                )
            ) { [unowned self] index, movie, cell in
                let viewModel = self.viewModel.movieCells[index]
                cell.imageView.layer.cornerRadius = 6
                cell.imageView.clipsToBounds = true
                cell.viewModel = viewModel
            }
            .disposed(by: disposeBag)
        
        self.viewModel.errorSuject
            .asObserver()
            .bind { error in
                print(error.localizedDescription)
            }
            .disposed(by: disposeBag)
    }
    
    private func setupCollectionView() {
        self.collectionView.register(UpcomingMoviesPreviewCollectionViewCell.nib, forCellWithReuseIdentifier: UpcomingMoviesPreviewCollectionViewCell.identifier)
    }
    
    private func setupCollectionViewLayout() {
        let previewLayoutWidth = CGFloat(150) / CGFloat(1.5)
        let layout = VerticalFlowLayout(preferredWidth: previewLayoutWidth, preferredHeight: CGFloat(150), minColumns: 3)
        
        self.collectionView.setCollectionViewLayout(layout, animated: false)
    }
}

