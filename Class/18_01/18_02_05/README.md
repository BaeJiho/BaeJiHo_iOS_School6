# - ViewController 이전의 상황을 알아보자

먼저 오늘은 설명보다도 관계도를 잘 이해해야한다.

<img width="500" alt="mvc" src="https://user-images.githubusercontent.com/35207193/35804648-00f79f8a-0abc-11e8-8c10-86baff173331.png">

최초 터치(Event)가 실행되면 UIApplication이 실행되고 Application Delegate에서 UIWindow와 View Controller, Document가 실행되는 구조이다.

우리가 항상 View Controller에서 viewDidLoad가 시작점이라 생각한 이유가 바로 위에 관계도를 보면 이해할 수 있을 것이다.

<img width="500" alt="default" src="https://user-images.githubusercontent.com/35207193/35804848-c79e782a-0abc-11e8-81b6-2b81d3984f17.png">

your Code쪽을 보면 application이라는 부분이 있다. Delegate부분을 알아보자.

대부분의 상태변화를 app delegate 객체에 호출되는 메소드를 오버라이드하여 알아챌 수 있다.

- application:willFinishLaunchingWithOptions:
어플리케이션이 최초 실행될 때 호출되는 메소드

- application:didFinishLaunchingWithOptions:
어플리케이션이 실행된 직후 사용자의 화면에 보여지기 직전에 호출.

- applicationDidBecomeActive:
어플리케이션이 Active 상태로 전환된 직후 호출.

- applicationWillResignActive:
어플리케이션이 Inactive 상태로 전환되기 직전 호출

- applicationDidEnterBackground:
어플리케이션이 백그라운드 상태로 전환된 직후 호출.

- applicationWillEnterForeground:
어플리케이션이 Active 상태가 되기 직전에, 화면에 보여지기 직전의 시점에 호출.

- applicationWillTerminate:
어플리케이션이 종료되기 직전에 호출.


# - Storyboard에서 만들던 ViewController를 Delegate에서 코드로 만들어보자.

```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let myListVc: ViewController = storyboard.instantiateInitialViewController() as! ViewController
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = myListVc
        window?.makeKeyAndVisible()
        
        return true
    }

```

이렇게 스토리보드와 뷰 컨트롤러를 생성한 뒤 UIWindow를 생성하고 rootViewController에 앞서 생성한 뷰 컨트롤러를 대입시킨 뒤 보여주는 코드를 작성한다.

# 공부하며 느낀점

항상 만들어져 있던 ViewController에 viewDidLoad를 실행했는데 이것을 생성하기 이전에 무엇이 일어나는지를 눈으로 보면서 느끼다보니 좀 더 Application의 원리를 알게되었다.