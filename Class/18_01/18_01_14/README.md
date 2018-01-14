# - 도서관 관리 프로그램 만들어보기

앞서 공부한 객체지향(class, 변수, 함수)를 추가로 여러가지 코드를 찾아보고 도서관 관리 프로그램을 만들어보았다.

내가 원하는 책의 이름과 장르, 지은이까지하여 3개를 입력하면 저장이 되고, 이 저장된 값을 지우거나 혹은 저장된 책들이 무엇이 있는지 찾아볼수 있는 기능을 만들어보았다.

먼저 책을 담을 list를 처음 사용하였으며, +=라는 기호를 사용하여, 책을 계속 더해주는 코드, 추가적으로 함수내에있는 remove라는 코드까지 사용함으로써 도서관 관리에 대한 정의를 해보았다.

```
class BookManager{
    
    //책을 정의한다.
    struct Book {
        var name:String?
        var genre:String?
        var author:String?
        
        func bookPrint(){
            print("Name : \(name!)")
            print("Name : \(genre!)")
            print("Name : \(author!)")
            print("======================")
        }
    }
    //위에 정의한 책을 여러개 저장할 수 있도록 리스트에 담는다.
    var bookList = [Book]()
    //책을 입력할때마다 bookList에 저장한다.
    func registerBook(bookObjeck:Book) {
        bookList += [bookObjeck]
    }
```

위에 코드는 책의 정보는 이름과 장르와 지은이를 입력하고 그 책을 보여주는 코드이며, 리스트를 만들어 입력한 책들을 저장하는 코드이다.

책의 기능은 
- 입력한 책의 정보를 보여준다.
- list에 담긴 모든 책의 갯수를 보여준다.
- list에 담긴 모든 책의 정보를 보여준다.
- list에 담긴 모든 책의 정보를 삭제한다.
이렇게 4가지로 제작하였다.

```
    //입력한 책의 정보를 보여준다.
    func showAllBooks() -> String {
        var strTemp = ""
        for bookTemp in bookList {
            strTemp += "Name: \(bookTemp.name!)\n"
            strTemp += "Genre: \(bookTemp.genre!)\n"
            strTemp += "Author: \(bookTemp.author!)\n"
            strTemp += "---------- \n"
        }
        return strTemp
    }
    //bookList에 담긴 모든 책의 갯수를 보여준다.
    func countBooks() -> Int {
        return bookList.count
    }
    //bookList에 담긴 모든 책의 정보를 보여준다.
    func searchBook(name:String) -> String? {
        var strTemp = ""
        for bookTemp in bookList {
            if bookTemp.name == name{
                strTemp += "Name: \(bookTemp.name!)\n"
                strTemp += "Genre: \(bookTemp.genre!)\n"
                strTemp += "Author: \(bookTemp.author!)\n"

                return strTemp
            }
        }
        return nil
    }
    //bookList에 담긴 모든 책의 정보를 삭제한다.
    func removeBook(name:String){
        for (index,value) in bookList.enumerated() {
            if value.name! == name {
                bookList.remove(at: index)
            }
        }
    }
```

# - 공부하며 느낀점

for문과 if문의 필요성을 많이 느꼈다. 각각의 쓰임새는 다르지만 같이 사용함으로써 그 사용하는 범위가 늘어나며 여러번 작성해야할 코드를 for문과 if문을 사용함으로써 좀 더 개발자스럽게 코드가 완성되었다.<br>
func 함수 안에 새로운 변수를 선언해서 class 내에 있는 변수와 같이 대입하며 사용하는것이 너무나도 매력적이고 재미있음을 느꼈다. 옵셔널을 사용해보았지만 아직은 그 사용감이 부족하다. 옵셔널과 튜플에 대해서 좀 더 알아보도록하자.