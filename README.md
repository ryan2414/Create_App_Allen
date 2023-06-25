# 앨런 Swift문법 마스터 스쿨 (15개의 앱을 만들면서 근본원리부터 배우는 UIKit)
인강 링크 : https://inf.run/MBJT

## MemberList
<img src="https://github.com/ryan2414/Create_App_Allen/assets/75060346/95265c72-13db-4764-b190-ed9b7b30d8bc" width="25%" height="25%">

- Study Custom Delegate Pattern
- Delegate Pattern & Notification
    - 델리게이트 패턴  
        - 1:1 객체간 쌍방향 커뮤니케이션에 사용 한다. 
        - 리턴값 있을 수 있음 
    - Notification
        - 1:N 라디오 방송의 개념
        - 등록하면 Nofi를 받을 수 있음 
        - 리턴값의 개념이 없음


## TableView
<img src="https://github.com/ryan2414/Create_App_Allen/assets/75060346/7ef122eb-5aed-4f4f-a2eb-255286f694cd" width="25%" height="25%">   


- 델리게이트 패턴을 사용
- dataSource - 테이블뷰의 구성
    1. 몇개의 셀로 만들것인지?
    2. 셀의 구성은 어떻게? 

```swift
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return movieDataManager.getMovieData().count //컨텐츠 생성 개수
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print(#function)
        //indexPath.section //그룹
        //indexPath.row // 행
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = movieDataManager.getMovieData()[indexPath.row]
        
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.movieDescription.text = movie.movieDescription
        
        return cell
    }
}
```

- delegate
    1. 터치가 일어남/ 드레그가 일어남 등

```swift
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            
            let array = movieDataManager.getMovieData()
            
            let indexPath = sender as! IndexPath
            
            detailVC.moiveData = array[indexPath.row]
        }
    }
}
```

- tableView Data 추가시 `tableView.reloadData()` 호출


## MVC(Model-View-Controller) 디자인 패턴
- Model - 비즈니스 로직, 데이터 (화면과 전혀 관련이 없는 로직과 데이터 관련)
- View - UI관련. 즉, 사용자 화면 표시(뷰컨트롤러의 명령을 받아 화면 표시)
- Controller - 뷰컨트롤러, 모델의 정보를 어떻게 뷰에 표시할지를 해석해서 전달(중재자)


## BMI 계산기
<img src="https://github.com/ryan2414/Create_App_Allen/assets/75060346/411425d3-a7f5-461e-8e01-6bb5dca9b61a" width="25%" height="25%">   


## View 전환
1. 코드로 화면 전환
    
    ```swift
    //////////////////////////특정 화면으로 이동/////////////////////////
    let firstVC = FirstViewController()
    
    firstVC.someString = "Hello"
    firstVC.modalPresentationStyle = .fullScreen //전체화면으로 전환
    
    present(firstVC, animated: true)
    
    ///////////////////////////돌아가기(공통)///////////////////////////
    dismiss(animated: true)//이전화면으로 돌아가기
    ```
    
2. 코드로 스토리보드 객체를 생성해서, 화면 전환
    
    ```swift
    // 2) 코드로 스토리보드 객체를 생성해서, 화면 이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController {
            secondVC.someString = "아빠상어" // 인자 전달
            present(secondVC, animated: true)
        }
    }
    ```
    
3. 스토리보드에서 화면 이동(간접 세그웨이)
    
    ```swift
    // 3) 스토리보드에서의 화면 이동(간접 세그웨이) - 버튼을 눌렀을 때
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toThirdVC", sender: self)
    }
    
    // 인자 전달 방법
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toThirdVC" {
            let thirdVC = segue.destination as! ThirdViewController
            thirdVC.someString = "엄마상어"
        }
    }
    ```
    
4. 스토리보드 버튼에서 화면 이동(직접 세그웨이)
    
    ```swift
    // 4) 직접적인 segue를 버튼하고 연결했을 때 실행됨. -> 다음화면으로 넘어가기 위한 조건 설정
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    ```
    
    
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
