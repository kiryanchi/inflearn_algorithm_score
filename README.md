# 인프런 알고리즘 자동 채점기

> 버그가 있으면 이슈나 수정해서 커밋 부탁드립니다.

인프런 알고리즘 강의 중 [김태원](https://www.inflearn.com/users/@codingcamp) 강사님은 채점기를 제공해줘 알고리즘 공부에 큰 도움을 준다.

하지만 Windows 버전만 제공이 돼서 그 외의 운영체제에서는 강의의 이점이 조금 퇴색된다.

구글링 중, 우연히 [C++ 버전의 자동 채점기](https://www.inflearn.com/questions/322413)를 발견했고 이를 기반으로 파이썬 버전도 제작해보았다.

## 지원 강의

[파이썬 알고리즘 문제풀이 입문 (코딩테스트 대비)](https://www.inflearn.com/course/%ED%8C%8C%EC%9D%B4%EC%8D%AC-%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98-%EB%AC%B8%EC%A0%9C%ED%92%80%EC%9D%B4-%EC%BD%94%EB%94%A9%ED%85%8C%EC%8A%A4)

## 사용법

[필수] ***macOS*** 라면 **coreutils** 를 설치해주세요.

```shell
brew install coreutils
```

사용법은 Windows 파일 측정기와 크게 차이가 없다.

1. 작성한 코드 파일을 `code.py`로 저장한다.

2. [run.sh](https://github.com/kiryanchi/inflearn_algorithm_score/blob/main/run.sh) 파일을 폴더에 넣고 사용하면 된다.

> 권한 오류가 뜨면 `chmod 755 ./run.sh` 를 해준다.

> [run.sh](https://github.com/kiryanchi/inflearn_algorithm_score/blob/main/run.sh) 에서 파일 이름을`core.py` 에서 \
다른 걸로 바꿔도 된다.

## 계획

- [ ] C++ 버전도 지원 (요청이 있다면..)

## Reference

https://www.inflearn.com/questions/322413