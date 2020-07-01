///**
/**
ContactApp
Created by: Jefry Eko Mulya on 19/11/19
https://github.com/jefrydagucci
Copyright (c) 2019 DAGUCI

*/

import UIKit

final class DGFullScreenLoaderView: UIView {
    private lazy var loaderView : DGLoaderView = {
        let loader = DGLoaderView(text: nil, style: .gray)
        loader.backgroundColor = UIColor.white
        return loader
    }()
    
    init(text: String?) {
        super.init(frame: .zero)
        loaderView.text = text
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        backgroundColor = UIColor.black.withAlphaComponent(0.4)
        addSubview(loaderView)
    }
    
    private func setupConstraints() {
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loaderView.centerXAnchor.constraint(equalTo: centerXAnchor),
            loaderView.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }
}
