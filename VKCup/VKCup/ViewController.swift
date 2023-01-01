//
//  ViewController.swift
//  VKCup
//
//  Created by Frizer on 17.12.2022.
//

import UIKit

class ViewController: UIViewController {
    let laterButton = UIButton()
    let scrollView = UIScrollView()
    let allActivities = ["Прогулки","Юмор","Еда","Кино","Рестораны","Автомобили","Рестораны","Парковки","Работа","Отдых","Юмор","Еда","Кино","Рестораны","Автомобили","Рестораны","Парковки","Работа","Отдых","Юмор","Еда","Кино","Рестораны","Автомобили","Рестораны","Парковки","Работа","Отдых","Юмор","Еда","Кино","Рестораны","Автомобили","Рестораны","Парковки","Работа"]
    var activities = [Answer]()
    let continueButton = UIButton()
    let greetingText = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initAnswers()
    }
    
    private func initUI(){
        initAnswers()
        initButton()
        initLabel()
        initStackView()
        initButtonLate()
    }
    private func initAnswers(){
        for i in allActivities{
            activities.append(Answer(text: i))
        }
    }
    func  initStackView(){
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: greetingText.bottomAnchor, constant: 10).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -30).isActive = true
        scrollView.contentSize = scrollView.frame.size

        let stackView1 = UIStackView()
        scrollView.addSubview(stackView1)
        
        stackView1.axis = .vertical
        stackView1.distribution = .equalSpacing
        stackView1.spacing = 10
        stackView1.alignment = .leading
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView1.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView1.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView1.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        var i = 0
        while i < activities.count{
            let singleRow = UIStackView()
            singleRow.axis = .horizontal
            singleRow.alignment = .top
            singleRow.spacing = 4
            singleRow.frame.size = CGSize(width: view.frame.width, height: 100)
            let count = i;
            repeat{
            let but = ChoosingButton(activity: activities[i])
            but.addTarget(self, action: #selector(continueButtonEnable), for: .touchUpInside)
            singleRow.addArrangedSubview(but)
            i += 1;
            } while(i < count + 3 && i<activities.count)
            i -= 1;
            
            stackView1.addArrangedSubview(singleRow)
            singleRow.translatesAutoresizingMaskIntoConstraints = false
            i += 1
        }

    }
    @objc
    private func continueButtonEnable(){
        UIView.animate(withDuration: 0.5){
            if self.activities.first(where: {
            $0.isPicked
        }) != nil{
                self.continueButton.isHidden = false
                self.continueButton.isEnabled = true
        } else{
            self.continueButton.isHidden = true
            self.continueButton.isEnabled = false
        }
        }
    }
    private func initButton(){
        view.addSubview(continueButton)
        continueButtonEnable()
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.setTitle("Продолжить", for: .normal)
        continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        continueButton.backgroundColor = .white
        continueButton.setTitleColor(.black, for: .normal)
        continueButton.titleLabel?.font = .systemFont(ofSize: 25)
        continueButton.layer.cornerRadius = 10
        continueButton.titleLabel?.textColor = .black
    }
    private func initLabel(){
        greetingText.lineBreakMode = .byWordWrapping
        greetingText.numberOfLines = 0
        view.addSubview(greetingText)
        greetingText.translatesAutoresizingMaskIntoConstraints = false
        greetingText.text = "Отметьте то, что вам интересно,\nчтобы настроить Дзен"
        
        greetingText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20).isActive = true
        greetingText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        greetingText.heightAnchor.constraint(equalToConstant: 60).isActive = true
        greetingText.widthAnchor.constraint(equalToConstant: view.frame.size.width*0.75).isActive = true
        
        greetingText.textColor = .gray
        greetingText.font = .systemFont(ofSize: 15)
    }
    private func initButtonLate(){
        view.addSubview(laterButton)
        laterButton.translatesAutoresizingMaskIntoConstraints = false
        laterButton.setTitle("Позже", for: .normal)
        laterButton.leadingAnchor.constraint(equalTo: greetingText.trailingAnchor,constant: 5).isActive = true
        laterButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30).isActive = true

        laterButton.backgroundColor = .darkGray
        laterButton.setTitleColor(.white, for: .normal)
        laterButton.titleLabel?.font = .systemFont(ofSize: 20)
        laterButton.layer.cornerRadius = 20
        laterButton.titleLabel?.textColor = .black
    }

}

