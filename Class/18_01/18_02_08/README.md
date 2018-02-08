# - UIViewController

- 앱의 기초가 되는 내부 구조<br>
- 모든 앱은 적어도 한개 이상의 ViewController를 가지고 있으며 대부분의 앱은 여러개의 ViewController로 이뤄져 있다.
- ViewController는 사용자의 인터렉션과 앱의 데이터 사이에서 컨트롤의 역할을 한다.
- ViewController는 View 관리, 사용자 이벤트 핸들링, ViewController간의 전환 등을 위한 메소드와 프로퍼티를 가지 고 있다.

----
## - ViewController 종류

General View Controller<br>
- UIViewController<br>
- UITableViewController<br>
- UICollectionViewController<br>
Container View Controller
- UINavigationController<br>
- UITabbarController<br>
- UISplitViewController


## - Segue

- 앱의 인터페이스 흐름을 정의하는 데 사용.
- Storyboard 파일 내 두 개의 ViewController사이의 화면전환을 정의.
- Segue의 시작점은 button, tableView의 row, gesture등으로 시작하며 끝점은 전환되는 다음 ViewController이다.
- segue는 일반적으로 다음 ViewController로 진행되는 것을 가 르키나, unwind segue를 통해 ViewController를 닫는 역할도 할수 있다.


# - 실습화면

![2018-02-08 17_05_32](https://user-images.githubusercontent.com/35207193/35962121-9f691106-0cf3-11e8-8fce-27b0a1171a13.gif)


# 공부하고 느낀점

ViewController를 서로 연결하며, 알럿을 생성하여 제한을 두는것은 우리가 일상생활에서 늘 사용해왔던 UI이며, 기능이다.
총 init 방법 xib 방법 storyboard를 생성하여 연결하는 방법이 있다. 이 점을 반드시 기억하고 꼭 Main.storyboard 에서만이 아니라 코드로써 연결을 가능케 하도록 하자!