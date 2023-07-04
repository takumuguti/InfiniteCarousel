//
//  CollectionViewCell.swift
//  InfiniteCarousel
//
//  Created by Takudzwanashe Muguti on 2023/07/02.
//

import UIKit

struct Model{
    let text: String
    let backgroundColour: UIColor
}

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "cell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
        contentView.layer.cornerRadius = 10
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.backgroundColor = UIColor.red
        label.text = ""
    }
    
    func configure(with model: Model){
        contentView.backgroundColor = model.backgroundColour
        label.text = model.text
    }
    

}
