//
//  SearchView.swift
//  MatRoad
//
//  Created by 이승현 on 2023/10/02.
//

import UIKit
import SnapKit

class SearchView: BaseView {
    
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.rowHeight = 70
        view.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchCell")
        view.backgroundColor = UIColor(named: "White")
        return view
    }()
    
    lazy var searchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = ""
        searchBar.layer.shadowColor = UIColor.clear.cgColor
        //searchBar.showsCancelButton = true
        searchBar.barTintColor = UIColor(named: "White")
        searchBar.searchTextField.textColor = .white
        searchBar.autocapitalizationType = .none
        searchBar.placeholder = "맛집을 검색해주세요!"
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.font = UIFont(name: "KCC-Ganpan", size: 16.0)//UIFont.systemFont(ofSize: 14) //플레이스 홀더 글씨 크기
        }
        searchBar.searchTextField.textColor = UIColor(named: "textColor")
        searchBar.searchTextField.font = UIFont(name: "KCC-Ganpan", size: 14.0)
        
//        if let cancelButton = searchBar.value(forKey: "cancelButton") as? UIButton {
//            cancelButton.setTitle("취소", for: .normal)
//            cancelButton.setTitleColor(UIColor(named: "cancelButton"), for: .normal)
//            cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
//            cancelButton.tintColor = .white
//        }
        return searchBar
    }()
    lazy var noResultsLabel: UILabel = {
        let label = UILabel()
        label.text = "검색결과가 없습니다."
        label.font = UIFont(name: "KCC-Ganpan", size: 15.0)
        label.textColor = .white
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    let emptyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "투명아이콘")
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()
    
    let emptyImageLabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textColor = .darkGray
        view.font = UIFont(name: "KCC-Ganpan", size: 17.0)//UIFont.systemFont(ofSize: 17)
        view.isHidden = true
        return view
    }()
    
    override func configureView() {
        addSubview(searchBar)
        addSubview(tableView)
        addSubview(noResultsLabel)
        addSubview(emptyImageView)
        addSubview(emptyImageLabel)
    }
    
    override func setConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        noResultsLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        emptyImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(300)
        }
        emptyImageLabel.snp.makeConstraints { make in
            make.top.equalTo(emptyImageView.snp.bottom).inset(50)
            make.centerX.equalTo(emptyImageView)
            //make.width.equalTo(300)
        }

        
    }
    
}
