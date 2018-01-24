# 알고리즘 문제 풀기


##### - number = 123이면 1 + 2 + 3 = 6을 return하면 됩니다.

```
// number = 123이면 1 + 2 + 3 = 6을 return하면 됩니다.
func sumNumb(of number: Int) -> Int {
    
    let strNum: String = String(number)
    var totalNum = 0
    
    for n in  strNum{
        let num: String = String(n)
        totalNum += Int(num)!
    }
    return totalNum
}
sumNumb(of: 654)

```

먼저 숫자는 입력받으면 더해지지만 문자는 바로 뒷자리에 붙기때문에 그 방법을 이용하여, 정수로 입력받은 숫자 123을<br>
문자인 "123"으로 변경하였다. String은 Character의 모음(문자열)이기때문에 for-in 문을 통하여, 한개씩 숫자를 뽑아냈다.<br>
숫자를 뽑아낸것을 Int로 타입캐스팅을 통하여 바로 미리 만들어놓은 빈 변수에 +=를 통하여 더하려했으나, 타입캐스팅이 안되는 상황을 접하여, String타입의 변수를 하나 만들어 꺼내놓은 1개를 넣고 그 변수를 Int로 타입캐스팅을 통하여 계산하였다.


##### - 4와 3을 입력 받으면 4부터 시작해서 4씩 증가하는 숫자를 3개 가지는 리스트를 만들어서 리턴합니다.

```
// 4와 3을 입력 받으면 4부터 시작해서 4씩 증가하는 숫자를 3개 가지는 리스트를 만들어서 리턴합니다.
func numberGenerator(x: Int, n: Int) -> [Int] {
    var total : [Int] = []
    
    for i in 1...n {
        total += [x * i]
    }
    return total
}
numberGenerator(x: 4, n: 3)

```


함수에 첫번째 파라미터 변수 x에 두번째 파라미터 변수 n의 갯수만큼 곱하여 곱할때마다 리스트에 저장하여 리턴하는 방식이였다. 빈 배열을 먼저 선언하였고,  for-in문을 통하여, n의 갯수만큼 x를 곱하게 하였다.



##### - 어떠한 크기의 배열이 와도 평균이 구해지는 함수를 만들자.

```
// 어떠한 크기의 배열이 와도 평균이 구해지는 함수를 만들자.

func arrayList(num: [Int]) -> Double {
    var total = 0
    
    for n in num {
        total += n
    }
    
    let totalNum = Double(total) / Double(num.count)
    return totalNum
}
arrayList(num: [91,80,47,38,70])

```

배열로 정수인 값을 받고 그 배열안에 있는 정수를 전부 더한 뒤 배열의 갯수만큼 나누어 그 배열의 평균을 구하는것이다.<br>
배열의 값을 더할 새로운 변수를 선언하였으며, for-in문을 통하여 배열에 있는 정수값을 하나씩 변수에 더하였다.<br>
전부 더한 변수를 배열의 갯수만큼 나누었다. Double로 타입캐스팅을 한 이유는 나누었을때 소수점 자리가 나올 경우 Int타입은 소수점을 전부 제외시키기 때문에 숫자가 차이가 날 수 있다.


##### - 정해진 문자를 가지고 입력받은 문자열과 비교하기

```
//대문자와 소문자가 섞여있는 문자열 s를 매개변수로 입력받습니다.
//s에 'p'의 개수와 'y'의 개수를 비교해 같으면 True, 다르면 False를 리턴하도록 함수를 완성하세요. 'p', 'y' 모두 하나도 없는 경우는 항상 True를 리턴합니다.
//예를들어 s가 pPoooyY면 True를 리턴하고 Pyy라면 False를 리턴합니다.


func strText(t: String) -> Bool {
    var num1: Int = 0
    var num2: Int = 0
    
    
    for n in t {
        if n == "p" {
            num1 += 1
        }else if n == "y" {
            num2 += 1
        }
    }
    if num1 == num2 {
        return true
    }else if num1 != num2 {
        return false
    }
    return true
}
strText(t: "pPPPy")

```

문자열을 받아서 for-in문을 통해 하나씩 꺼내어 정해진 문자와 동일하면 카운터를 하나 증가하게 코딩을하였다.<br>



# 공부하며 느낀점

아직 타입에 대한 이해도가 많이 부족한 것 같다.<br>
각 타입에 대해서 좀 더 공부하고 collection type을 좀 더 공부해서 다른 문제들도 쉽게 풀어볼수 있도록 하자.