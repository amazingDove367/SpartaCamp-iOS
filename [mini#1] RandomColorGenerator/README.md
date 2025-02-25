# [mini #1] 랜덤 컬러 생성 앱 🌈
- 개인 미니 프로젝트
- UIKit 코드로 작성된 UI

<br>

## 프로젝트 소개
랜덤 컬러 생성 앱은 버튼을 클릭할 때마다 배경색이 랜덤하게 바뀌고, 현재 색상의 RGB 값을 화면에 표시하는 간단한 iOS 앱 입니다. 

<br>

## 구현된 기능
- **랜덤 색상 생성**  :  버튼 클릭 시 배경색이 랜덤하게 변경됩니다.

- **색상 정보 표시**  :  현재 화면 배경색의 RGB 값을 화면에 표시합니다.

- **초기화 기능**  :  초기화 버튼을 누르면 배경색이 흰색으로 변경되고, RGB 값도 초기화됩니다.
 
<br>

## 핵심 코드
- randomly generating RGB
```swift
let randomRed = CGFloat.random(in: 0...1)
let randomGreen = CGFloat.random(in: 0...1)
let randomBlue = CGFloat.random(in: 0...1)
let randomColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
```

<br>

- Converting CGFloat to RGB
```swift
let redValue = Int(randomRed * 255)
let greenValue = Int(randomGreen * 255)
let blueValue = Int(randomBlue * 255)
```

<br>

- 🔴 Configuration of class SceneDelegate for Programmatically creating UI 🔴
    > 1. delete storyboard file : Main.storyboard > Delete (Move to Trash)
    
    > 2. delete storyboard file in info.plist : RandomColorGenerator (project name) > TARGETS > RandomColorGenerator > Build Settings > search "into.plist" > Delete "UIKit Main Storyboard File Base Name"
  
    > 3. delete storyboard name in Info.plist : RandomColorGenerator (project name) > folder "RandomColorGenerator" > file "Info.plist" > Infomation Property List > ... > delete "Storyboard Name"
    
    > 4. modificate file "SceneDelegate.swift" (code below)
```swift
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard⭐️, the `window` property will automatically be initialized⭐️ and attached⭐️ to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        // willconnectTo() : 사용자가 앱을 처음 시작할 때, 앱의 첫 화면을 설정하는 코드

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let vc = RandomColorViewController() // 첫 화면의 viewcontroller file name
        window.rootViewController = vc
        self.window = window
        window.makeKeyAndVisible()
    }

    ...
}
```


<br>

## UIColor vs. RGB
(click the image to read the article)

<a href="https://hortenssiaa.tistory.com/73">
    <img width="680" alt="blogsite" src="https://github.com/user-attachments/assets/a7d1fcef-ff0c-4add-953c-56b59e1335a6">
</a>

<br>
<br>
<br>


## 데모

https://github.com/user-attachments/assets/456a0a72-3bba-4592-bf24-48495133a619
















