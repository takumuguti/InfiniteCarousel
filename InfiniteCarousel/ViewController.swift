//
//  ViewController.swift
//  InfiniteCarousel
//
//  Created by Takudzwanashe Muguti on 2023/07/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    private let models: [Model] = [
        Model(text: "Facebook", backgroundColour: .systemBlue),
        Model(text: "Amazon", backgroundColour: .systemYellow),
        Model(text: "Netflix", backgroundColour: .systemRed),
        Model(text: "Google", backgroundColour: .systemGreen),
    ]
    
    //additional variables:
    let buffer = 3
    var totalElements: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalElements = buffer + models.count
        return totalElements
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else{
            return UICollectionViewCell()
        }
        let currentCell = indexPath.row % models.count
        cell.configure(with: models[currentCell])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 180)
    }
    
    
}

extension ViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let itemSize = collectionView.contentSize.width/CGFloat(totalElements)
        
        if scrollView.contentOffset.x > itemSize*CGFloat(models.count){
            collectionView.contentOffset.x -= itemSize*CGFloat(models.count)
        }
        if scrollView.contentOffset.x < 0  {
            collectionView.contentOffset.x += itemSize*CGFloat(models.count)
        }
    }
}

