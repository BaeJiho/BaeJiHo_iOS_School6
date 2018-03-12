# - NavigationController


- View Controller 의 Container 역할을 하는 View Controller
- View Controller 간의 구조를 잡는 역할을 한다.
- 일반적으로 Root View를 가지고 있지 않고, View Controller를 Sub View Controller로 가지고 있다.

####종류

- UINavigationController
- UITabbarController
- UISplitViewController




### NavigationController 구조

![2018-02-09 4 34 03](https://user-images.githubusercontent.com/35207193/36016594-1a361b04-0db7-11e8-90d4-e67e82ec82c6.png)

### NavigationController 인터페이스

![2018-02-09 4 40 53](https://user-images.githubusercontent.com/35207193/36016792-091bb616-0db8-11e8-98a3-b562e848dc2f.png)




# - UserDefaults

- 파일 저장 (Property List, SQLite, 아카이빙) 
- iOS DataBase이용 - Core Data
- Network - Server DB이용



- 사용자의 정보를 저장하는 싱글톤 인스턴스
- 간단한 사용자 정보를 저장/불러오기가 가능하게 만든 인스턴스이다.
- 내부적으로 Plist 파일로 저장되어 보안이 강하지 않다.(필요에따라 암호화 필요)

# - 실습

![2018-02-09 16_46_48](https://user-images.githubusercontent.com/35207193/36016955-e0b704d6-0db8-11e8-98bf-f401cf8f4a29.gif)
