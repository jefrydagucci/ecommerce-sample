///**
/**
ContactApp
Created by: Jefry Eko Mulya on 19/11/19
https://github.com/jefrydagucci
Copyright (c) 2019 DAGUCI

*/

import UIKit

final class DGLoaderView: UIView {
    
    private let padding: CGFloat = 16
    private let spacing: CGFloat = 16
    
    var text: String? {
        didSet {
            setupLabel()
        }
    }
    private var style: UIActivityIndicatorView.Style
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = spacing
        return stackView
    }()
    
    private lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.tintColor = UIColor.black
        indicator.startAnimating()
        return indicator
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black.withAlphaComponent(0.7)
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    init(text: String?,
         style: UIActivityIndicatorView.Style) {
        self.text = text
        self.style = style
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(stackView)
        stackView.addArrangedSubview(indicator)
        stackView.addArrangedSubview(label)
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        label.text = text
        indicator.style = style
    }
    
    private func setupLabel() {
        label.text = text
    }
    
    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding * -1),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: padding),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: padding * -1)
            ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height * 0.5
    }
}
