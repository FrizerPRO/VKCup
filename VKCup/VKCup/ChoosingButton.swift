//
//  ChoosingButton.swift
//  VKCup
//
//  Created by Frizer on 17.12.2022.
//

import UIKit

class ChoosingButton: UIButton {
    let label = UILabel()
    let stick = UILabel()
    let plus = UILabel()
    var sizeConstraints = [NSLayoutConstraint]()
    public var activity: Answer
    init(activity: Answer){
        self.activity = activity
        super.init(frame: .zero)
        label.text = activity.name
        initView()
        
    }
    private func checkActivity(){
        UIView.animate(withDuration: CGFloat(0.3)){
            if self.activity.isPicked{
            self.backgroundColor = .orange
                self.plus.text = "✓"
                self.stick.isHidden = true
        } else{
            self.stick.isHidden = false
            self.self.plus.text = "+"
            self.backgroundColor = .gray
        }
    }
        self.removeConstraints(sizeConstraints)
        sizeConstraints = [NSLayoutConstraint]()
        sizeConstraints +=
        [self.widthAnchor.constraint(equalToConstant: getSize().width),
        self.heightAnchor.constraint(equalToConstant: getSize().height)]
        NSLayoutConstraint.activate(sizeConstraints)
    }
    private func initView(){
        initText()
        initButton()
        self.sizeToFit()
        self.layoutIfNeeded()
        self.addTarget(self, action: #selector(isTapped), for: .touchUpInside)
    }
    @objc
    private func isTapped(){
        activity.isPicked = !activity.isPicked
        checkActivity()
    }
    private func initText(){
        self.addSubview(label)
        label.sizeToFit()
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    private func initButton(){
        self.layer.cornerRadius = 7
        stick.font = UIFont.systemFont(ofSize: 25)
        stick.text = "|"
        stick.textColor = .white
        self.addSubview(stick)
        stick.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
            stick.leftAnchor.constraint(equalTo: label.rightAnchor, constant: 4).isActive = true
            stick.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
        plus.font = UIFont.systemFont(ofSize: 30)
        plus.textColor = .white
        self.addSubview(plus)
        plus.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        plus.leftAnchor.constraint(equalTo: stick.rightAnchor, constant: 4).isActive = true
        plus.centerYAnchor.constraint(equalTo: stick.centerYAnchor).isActive = true
        checkActivity()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     func getSize() -> CGSize {
         return CGSize(
            width: label.intrinsicContentSize.width +
            plus.intrinsicContentSize.width +
            stick.intrinsicContentSize.width + 12,
            height: max(label.font.lineHeight,
                        plus.font.lineHeight ,
                        stick.font.lineHeight))
    }
    
}
