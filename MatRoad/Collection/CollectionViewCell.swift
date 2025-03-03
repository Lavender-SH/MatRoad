//
//  CollectionViewCell.swift
//  MatRoad
//
//  Created by 이승현 on 2023/09/30.
//

import UIKit
import Cosmos

class CollectionViewCell: BaseCollectionViewCell {
    
    let shadowContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowOpacity = 0.6
        view.layer.shadowRadius = 5.0
        return view
    }()
    
    let imageView: GradientImageView = {
        let view = GradientImageView(frame: .zero)
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 16.5
        view.clipsToBounds = true
        view.backgroundColor = .clear
        return view
    }()

    
    let dateLabel = {
        let view = UILabel()
        view.textColor = .lightGray
        //view.font = UIFont.systemFont(ofSize: 10)
        view.font = UIFont(name: "KCC-Ganpan", size: 10.0)
        view.textAlignment = .left
        view.text = ""
        return view
    }()
    
    let titleLabel = {
        let view = UILabel()
        view.textColor = .white
        //view.font = UIFont.systemFont(ofSize: 12)
        view.font = UIFont(name: "KCC-Ganpan", size: 12.0)
        view.textAlignment = .left
        view.numberOfLines = 2
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        view.text = ""
        return view
    }()
    
    let cosmosView: CosmosView = {
        let view = CosmosView()
        view.settings.updateOnTouch = false
        view.settings.fillMode = .precise
        view.settings.filledImage = UIImage(named: "smallfill")
        view.settings.emptyImage = UIImage()
        view.settings.starSize = 12 // 별의 크기 설정
        view.settings.starMargin = 1 // 별 사이의 간격 설정
        //view.settings.emptyImage = UIImage(named: "empty")
        //view.settings.emptyImage = nil
        return view
    }()
    
    let deleteCheckmark: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark.circle.fill")
        imageView.tintColor = .red
        //imageView.backgroundColor = .gray
        imageView.isHidden = true
        return imageView
    }()
    let transCheckmark: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark.circle.fill")
        imageView.tintColor = .red
        imageView.isHidden = true
        return imageView
    }()
    
    
    override func configureView() {
        contentView.addSubview(shadowContainerView)
        shadowContainerView.addSubview(imageView)
        //contentView.addSubview(imageView)
        contentView.addSubview(dateLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(cosmosView)
        contentView.addSubview(deleteCheckmark)
        contentView.addSubview(transCheckmark)
        
        
    }
    
    override func setConstraints() {

        shadowContainerView.snp.makeConstraints { make in
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
            make.top.equalTo(contentView.snp.top)
            make.height.equalTo(shadowContainerView.snp.width).multipliedBy(1.4)
        }

        imageView.snp.makeConstraints { make in
            make.edges.equalTo(shadowContainerView)
        }

        dateLabel.snp.makeConstraints { make in
            make.bottom.equalTo(titleLabel.snp.top).offset(3)
            make.leading.equalTo(12)
            make.height.equalTo(20)
        }
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(imageView.snp.bottom).inset(4)
            make.leading.equalTo(12)
            make.trailing.equalTo(shadowContainerView).inset(10)
            //make.width.equalToSuperview()
            
        }
//        cosmosView.snp.makeConstraints { make in
//            make.top.equalTo(imageView.snp.bottom).offset(7)
//            //make.top.equalTo(contentView.snp.top).inset(0)
//            make.leading.equalTo(imageView.snp.leading).offset(7)
//            make.centerX.equalTo(contentView)
//            //make.width.equalTo(80)
//            //make.right.equalTo(imageView.snp.right).inset(7)
//        }
        
        cosmosView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(7)
            make.leading.equalTo(imageView.snp.leading).offset(7)
            make.centerX.equalTo(contentView)
            make.bottom.equalTo(contentView.snp.bottom).offset(-7) // 추가된 줄
        }

        deleteCheckmark.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.center.equalTo(imageView)
        }
        transCheckmark.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.center.equalTo(imageView)
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let gradientLayer = imageView.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = imageView.bounds
        }
    }
    
    
}


class GradientImageView: UIImageView {
    private var gradientLayer: CAGradientLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradientLayer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradientLayer()
    }
    
    private func setupGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.6, 1.0]
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    func refreshGradient() {
        gradientLayer.removeFromSuperlayer()
        setupGradientLayer()
        setNeedsLayout()
    }
}
