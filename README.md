# Coduck Grader Docker

이 Docker 이미지 환경은 Coduck 채점 시스템에서 사용하기 위한 멀티언어 샌드박스 채점기입니다.  
IOI의 [`isolate`](https://github.com/ioi/isolate)를 통해 자원 제한, 보안 격리, 시간/메모리 제어가 가능합니다.

---

## 지원 언어 및 환경

| 언어          | 컴파일러 / 인터프리터             | 컴파일 / 실행 방식                         |
|-------------|--------------------------|-------------------------------------|
| **C**       | `gcc`                    | `gcc Main.c -o Main`<br/>`./Main`   |
| **C++**     | `g++`                    | `g++ Main.cpp -o Main`<br/>`./Main` |
| **Python3** | `python3`                | `python3 Main.py`                   |
| **PyPy3**   | `pypy3`                  | `pypy3 Main.py`                     |
| **Java**    | `openjdk-8-jdk-headless` | `javac Main.java` <br/> `java Main` |

---

## 예시

### 샌드박스 초기화

`isolate --init` 명령어를 사용하여 샌드박스를 초기화합니다.

```bash
$ isolate --init
/var/local/lib/isolate/0
```

`/var/local/lib/isolate/0/box` 디렉토리가 작업 디렉토리가 됩니다.

### C 예제

`hello.c` 파일을 작성합니다.

```c
#include <stdio.h>
int main() {
    printf("Hello, World!\n");
    return 0;
}
```

`isolate`를 사용하여 C 프로그램을 컴파일하고 실행합니다.

```bash
cp hello.c /var/local/lib/isolate/0/box
isolate --run --full-env --processes=4 -- /usr/bin/gcc hello.c -o hello
isolate --run hello
```

### Python3 예제

`hello.py` 파일을 작성합니다.

```python
print("Hello, World!")
```

`isolate`를 사용하여 Python3 프로그램을 실행합니다.

```bash
isolate --run --full-env /usr/bin/python3 hello.py
```
