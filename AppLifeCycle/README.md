# ViewController Lifecycle
<img src="https://github.com/user-attachments/assets/29b5027a-791e-47fb-a01e-2006e1c8fafa" width="600">
<img src="https://github.com/user-attachments/assets/b4540744-3c5b-4e65-9028-eaedc926b8fa" width="600">

## `lazy var`
- **`addTarget`의 `self`로 인한 Warning** <br>
  `button`에 대한 초기화하는 시점에, 이 view의 모든것이 초기화 되지 X → `lazy` 사용
  
  ```
  'self' refers to the method 'ViewController.self', which may be unexpected
  ```
  
## `lazy var` vs. `let`
- `let`  <br>
  : 코드가 읽히는 시점에 초기화 코드가 실행됨
- `lazy var`  <br>
  : 코드 어디에선가 button을 호출할 때, 초기화 코드가 실행되면서 초기화 시점을 늦추게 하는 코드  <br>
    코드가  button을 호출할 때는, viewController가 초기화가 끝난 때이니, self 사용 가능

  ```swift
  private lazy var button: UIButton = {
      let button = UIButton()
      button.setTitle("다음 페이지로 이동", for: .normal)
      button.backgroundColor = .red
      button.setTitleColor(.white, for: .normal)
      button.addTarget(self, action: #selector(buttonTapped), for: .touchDown)
      return button
  }()
  ```
