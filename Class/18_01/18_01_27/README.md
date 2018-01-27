# - 3 Week 복습

학생 성적 관리 시스템을 만들어보자.
각각 정의하는 파일을 만들어 상속도 해보고 지금까지 배워온 코드들을 최대한 활용해보자.

## 과목을 정의

```
struct Subject {
    var name: String
    var score: Int
    
    var grade: String?
    
    
    init(name: String, score: Int, student: Int) {
        self.name = name
        self.score = score
        if student == 3 {
            makeScore()
        }
    }
    
    mutating func makeScore() {
        switch self.score {
        case 90...100:
            self.grade = "A"
        default:
            self.grade = "F"
        }
    }
}

```

## 사람을 정의

```
class Person {
    var name: String
    var gender: String
    
    init(name: String, gender: String) {
        self.name = name
        self.gender = gender
    }
}


```

## 학생을 정의(이때 학생은 사람이기때문에 사람을 상속시켰다.)

```
class Student: Person {
    
    var studentCheck: Int
    
    init(name: String, gender: String, studentCheck: Int) {
        self.studentCheck = studentCheck
        super.init(name: name, gender: gender)
    }
    
    var sujectsDic: [String:Int] = [:]
    var subjects: [Subject] {
        get {
            var resultScore: [Subject] = []
            for (subName, subScore) in sujectsDic {
                resultScore.append(Subject(name: subName, score: subScore, student: studentCheck))
            }
            return resultScore
        }
        set {
            for subject in newValue {
                sujectsDic.updateValue(subject.score, forKey: subject.name)
            }
        }
    }
}

```


## 학생의 이름을 저장하고 추가적으로 과목을 저장 할 수 있다.

```
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let bae = Student(name: "배지호", gender: "남성", studentCheck: 3)
        bae.subjects = [
            Subject(name: "수학", score: 90, student: 1),
            Subject(name: "과학", score: 90, student: 3),
            Subject(name: "음악", score: 90, student: 2),
            Subject(name: "싸움", score: 80, student: 1),
        ]
        print(bae.sujectsDic)
    }

```


# 공부하며 느낀점.


지금까지 해온 공부중에 가장 어려웠던 init 과 Property 종류 중 하나인 연산 프로퍼티 get,set을 복습하여 좀 더 나에게 익숙한 코드로 만들어 보았다.

앞서 했던 수업의 참고자료를 통해 복습했으며, 확실히 어떻게 쓰여지고 왜 쓰는지를 파악하게 되었다. 

