//
//  DetailViewController.swift
//  ToDoApp
//
//  Created by 이승재 on 2023/06/28.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    
    lazy var buttons: [UIButton] = {
        return [redButton, greenButton, blueButton, purpleButton]
    }()
    
    @IBOutlet weak var mainTextView: UITextView!
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    let toDoManager = CoreDataManager.shared
    
    var toDoData: MemoData? {
        didSet {
            temporaryNum = toDoData?.color
        }
    }
    
    var temporaryNum: Int64? = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
        configureUI()
    }
    
    private func setup() {
        mainTextView.delegate = self
        
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = 10
        
        saveButton.clipsToBounds = true
        saveButton.layer.cornerRadius = 8
        clearButtonColors()
    }
    
    func configureUI() {
        // 기존데이터가 있을 때
        if let toDoDate = self.toDoData {
            self.title = "메모 수정하기"
            
            guard let text = toDoDate.memoText else { return }
            mainTextView.text = text
            
            mainTextView.textColor = .black
            saveButton.setTitle("UPDATE", for: .normal)
            mainTextView.becomeFirstResponder()
            let color = MyColor(rawValue: toDoDate.color)
            setupColorTheme(color: color)
         
        // 기존 데이터가 없을 때
        } else {
            self.title = "새로운 메모 생성하기"
            
            mainTextView.text = "텍스트를 여기에 입력하세요."
            mainTextView.textColor = .lightGray
            saveButton.setTitle("SAVE", for: .normal)
            setupColorTheme(color: .red)
        }
        setupColorButton(num: temporaryNum ?? 1)
    }
    
    private func clearButtonColors() {
        redButton.backgroundColor = MyColor.red.backgoundColor
        redButton.setTitleColor(MyColor.red.buttonColor, for: .normal)
        greenButton.backgroundColor = MyColor.green.backgoundColor
        greenButton.setTitleColor(MyColor.green.buttonColor, for: .normal)
        blueButton.backgroundColor = MyColor.blue.backgoundColor
        blueButton.setTitleColor(MyColor.blue.buttonColor, for: .normal)
        purpleButton.backgroundColor = MyColor.purple.backgoundColor
        purpleButton.setTitleColor(MyColor.purple.buttonColor, for: .normal)
    }

    private func setupColorTheme(color: MyColor? = .red) {
        backgroundView.backgroundColor = color?.backgoundColor
        saveButton.backgroundColor = color?.buttonColor
    }
    
    private func setupColorButton(num: Int64) {
        switch num {
        case 1:
            redButton.backgroundColor = MyColor.red.buttonColor
            redButton.setTitleColor(.white, for: .normal)
        case 2:
            greenButton.backgroundColor = MyColor.green.buttonColor
            greenButton.setTitleColor(.white, for: .normal)
        case 3:
            blueButton.backgroundColor = MyColor.blue.buttonColor
            blueButton.setTitleColor(.white, for: .normal)
        case 4:
            purpleButton.backgroundColor = MyColor.purple.buttonColor
            purpleButton.setTitleColor(.white, for: .normal)
        default:
            redButton.backgroundColor = MyColor.red.buttonColor
            redButton.setTitleColor(.white, for: .normal)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttons.forEach { button in
            button.clipsToBounds = true
            button.layer.cornerRadius = button.bounds.height / 2
        }
    }
    
    
    @IBAction func colorButtonTapped(_ sender: UIButton) {
        self.temporaryNum = Int64(sender.tag)
        
        let color = MyColor(rawValue: Int64(sender.tag))
        setupColorTheme(color: color)
        
        clearButtonColors()
        setupColorButton(num: Int64(sender.tag))
    }
    
    
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        // 기존데이터가 있을 때 --> 기존데이터 업데이트
        if let toDoData = self.toDoData {
            toDoData.memoText = mainTextView.text
            toDoData.color = temporaryNum ?? 1
            toDoManager.updateToDo(newToDoData: toDoData) {
                print("업데이트 완료")
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            let memoText = mainTextView.text
            toDoManager.saveToDoData(todoText: memoText, colorInt: temporaryNum ?? 1) {
                print("저장 완료")
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension DetailViewController: UITextViewDelegate {
    // 입력을 시작할 때
    // (텍스트뷰는 플레이스홀더가 따로 있지 않아서, 플레이스 홀더처럼 동작하도록 직접 구현)
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "텍스트를 여기에 입력하세요." {
            textView.text = nil
            textView.textColor = .black
            
        }
    }
    
    // 입력이 끝났을 때
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = "텍스트를 여기에 입력하세요."
            textView.textColor = .lightGray
        }
    }
}
