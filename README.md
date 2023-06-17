# 앨런 Swift문법 마스터 스쿨 (15개의 앱을 만들면서 근본원리부터 배우는 UIKit)
인강 링크 : https://inf.run/MBJT

## Login Project
<img src="https://github.com/ryan2414/Create_App_Allen/assets/75060346/9dbd32b0-7d36-4e8e-9dee-6f7017651850" width="25%" height="25%">   

- 스크립트만으로 UI 만들기
- Alert 창 만들기
```Swift
let alert = UIAlertController(title: "비밀번호 바꾸기", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)

let success = UIAlertAction(title: "확인", style: .default) { action in
    print("확인 버튼이 눌렸습니다.")
}
let cancel = UIAlertAction(title: "취소", style: .cancel) { cancel in
    print("취소 버튼이 눌렸습니다.")
}

alert.addAction(success)
alert.addAction(cancel)

present(alert, animated: true, completion: nil)
```
- UI 애니메이션 할당
```Swift
UIView.animate(withDuration: 0.3) {
    self.stackView.layoutIfNeeded()
}
```


## TextField
- textField 관련 속성 써보기 
```Swift
textField.keyboardType = UIKeyboardType.emailAddress
textField.placeholder = "이메일 입력"
textField.borderStyle = .roundedRect
textField.clearButtonMode = .always
textField.returnKeyType = .go
```
- textField 글자 수 제한 방법
```Swift
// 텍스트필드 글자 내용이 (한글자 한글자) 입력되거나 지워질때 호출이 되고 (허락)
func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let maxLength = 10
    let currentString: NSString = (textField.text ?? "") as NSString
    let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
    return newString.length <= maxLength
}
```
- textField 이외의 영역 터치시 키보드 내리기
```Swift
// 화면의 탭을 감지하는 메서드
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
}
```


## Timer
<img src="https://github.com/ryan2414/Create_App_Allen/assets/75060346/710665fe-a4f4-483c-980a-b8fd184136d7" width="25%" height="25%">   

- 타이머 구현하기/ 셀렉터 & 클로저 사용
```
weak var timer: Timer? // 강한 레퍼런스 사이클을 조심해야 한다.

@IBAction func startButtonTapped(_ sender: UIButton) {
       timer?.invalidate()

       //셀렉터 사용
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)

       //클로저 사용
       timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [self] _ in
           if number > 0 {
               number -= 1
               slider.value = Float(number)/Float(60)
               mainLabel.text = "\(number) 초"
           } else {
               number = 0
               mainLabel.text = "초를 선택하세요"

               timer?.invalidate()

               AudioServicesPlayAlertSound(SystemSoundID(1322))
           }

       })
   }

   @objc func doSomethingAfter1Second() {
       if number > 0 {
           number -= 1
           slider.value = Float(number)/Float(60)
           mainLabel.text = "\(number) 초"
       } else {
           number = 0
           mainLabel.text = "초를 선택하세요"

           timer?.invalidate()

           AudioServicesPlayAlertSound(SystemSoundID(1322))
       }
   }
```
- 사운드 플레이 
```
import AVFoundation

AudioServicesPlayAlertSound(SystemSoundID(1322))
```


## UpDownGame
<img src="https://github.com/ryan2414/Create_App_Allen/assets/75060346/0092048a-b488-4034-b5a4-f05e792c3c21" width="25%" height="25%">   

- 업다운 게임
- String을 Int로 형변환
- guard let num = Int(string값) 사용

## RockPaperScissors
<img src="https://github.com/ryan2414/Create_App_Allen/assets/75060346/f9543b8e-2b96-4c72-b8b1-09ef67e737ed)" width="25%" height="25%">   

- 가위바위보 게임


## DiceGame
<img src ="https://github.com/ryan2414/Create_App_Allen/assets/75060346/2136f482-61f7-47ba-bd43-36de0b1917bb" width="25%" height="25%">   

- 버튼을 누르면 랜덤으로 다이스 이미지 바꾸기


## MyFirstApp
<img src="https://github.com/ryan2414/Create_App_Allen/assets/75060346/060e28c4-917b-47d8-97ce-d287937fb92b" width="25%" height="25%">   

- 단순 버튼을 누르면 텍스트 바꾸기
