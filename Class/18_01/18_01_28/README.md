# - 3Week 복습 2 

어제 공부한 학생 성적 입력 프로그램에서 추가적으로 학생 2명을 만들어 그 두명에게 성적을 입력하고,
그 입력한 값의 평균 또는 두명이 각각 가지고 있는 점수중 한개를 비교해서 그 값의 차를 구해보는 함수를 구현하여 업그레이드 해보았다.

추가한 계산 파일이다.

```
class Calculator {
    func average(student: Student){
        
        let list: [Subject] = student.subjects
        var totalScore: Int = 0
        
        for n in list {
            totalScore += n.score
        }
        
        let averageScore: Double = Double(totalScore) / Double(list.count)
        
        print("\(student.name)의 평균은 \(averageScore) 입니다.")
    }
    
    func compareScore(student1: Student, student2: Student) -> Int{
        let stu1 = student1.subjects
        let stu2 = student2.subjects
        var mathScoreOne: Int = student1.mathValue()
        var mathScoreTwo: Int = student2.mathValue()
        
        if mathScoreOne > mathScoreTwo {
            let compare = mathScoreOne - mathScoreTwo
            print("\(student1.name)의 수학점수가 \(compare)점 더 좋다")
            return student1.mathValue()
        }else if mathScoreTwo < mathScoreOne{
            let compareTwo = mathScoreTwo - mathScoreOne
            print("\(student2.name)의 수학점수가 \(compareTwo)점 더 좋다")
            return student2.mathValue()
        }else {
            print("둘다 점수가 같다.")
            return 0
        }
    }
}

```

이후 실제 뷰컨트롤 영역에 Calculator 인스턴스를 불러와 사용해보았다.

```
class ViewController: UIViewController {
    
    let cal: Calculator = Calculator()
    override func viewDidLoad() {
        super.viewDidLoad()
        let bae = Student(name: "배지호", gender: "남성", studentCheck: 3)
        let haha = Student(name: "하하", gender: "남성", studentCheck: 3)
        bae.subjects = [
            Subject(name: "수학", score: 90, student: 2),
            Subject(name: "과학", score: 80, student: 3),
            Subject(name: "음악", score: 70, student: 2),
            Subject(name: "싸움", score: 60, student: 1),
        ]
        haha.subjects = [
            Subject(name: "수학", score: 63, student: 2),
            Subject(name: "과학", score: 80, student: 3),
            Subject(name: "음악", score: 70, student: 2),
            Subject(name: "싸움", score: 60, student: 1),
        ]
        
        cal.average(student: bae)
        cal.compareScore(student1: bae, student2: haha)
        
    }

```



# 공부하며 느낀점

아직 내가 구현한 코드의 리딩이 부족한 것 같다. subject라는 성적에 학생이 대학생이라면 성적을 grade 를 변환하는 함수를 구현하였는데, 실제 뷰컨트롤에서 성적을 입력할 때 student라는 변수까지 입력해줘야하는 불필요한 부분이 생겼다. 이를 해결하고 좀 더 간편하고 쉬운 코딩을 할 수 있도록 더 연구해야할 것 같다.