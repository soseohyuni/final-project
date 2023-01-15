# 📝 Play Stamp (공연 관람 기록 웹애플리케이션)
---
> 🔎 **Contents**<br><br>
**1. 프로젝트 개요**<br>
**2. 개발 환경**<br>
**3. ERD 설계**<br>
**4. 역할 분담**<br>
**5. 담당 기능 구현**<br>
---
<br>

## 📌 1. 프로젝트 개요
1. 프로젝트명 : Play Stamp (플레이 스탬프)
2. 프로젝트 주제 : 공연 관람 기록 및 공유
3. 개발 기간 : 2021.06.14 ~ 2021.07.12
4. 개발 목적 : 연극과 뮤지컬을 즐기는 연뮤덕 관람 후기를 기록하고 서로 공유할 수 있도록 개발

<br><br>

## 📌 2. 개발 환경
구분|개발 환경|
---|---|
OS|Windows10|
브라우저|Chrome|
개발 언어| (서버) apache-tomcat-8.5 <br> (클라이언트) Java, JavaScript, HTML5, CSS|
Framework||
DBMS|Oracle|
Tools|Github, Eclipse|

<br><br>

## 📌 3. ERD 설계
![테이블최종](https://user-images.githubusercontent.com/75024035/147765739-fec0cad7-cbde-4e14-b173-82bd1b95b787.png)

<br><br>

## 📌 4. 역할 분담
+ 김서현 : 회원가입(이메일 인증), 로그인, 회원 등급에 따른 메뉴 접근 제한, 파일 업로드 
+ 소서현 : 사용자페이지 홈, 주요 공연장 좌석 리뷰, 회원 등급에 따른 메뉴 접근 제한, 관리자페이지 홈,  관리자 페이지의 회원 관리
+ 안정미 : API 파싱, 공연 정보, 댓글/좋아요 기능, 회원 신고 프로세스
+ 전혜림 : API 파싱, 검색 기능을 활용한 단계별 리뷰 추가, 관리자 신고 프로세스, 페이징 작업

<br><br>

## 📌 5. 담당 기능 구현
**① 사용자 페이지 홈**
  + 리뷰 많은 공연순, 좋아요 많은 리뷰순, 리뷰 평점 높은 공연순으로 정렬<br>
![1](https://user-images.githubusercontent.com/75024035/147775735-34fdc7bc-807b-4820-857a-341911abfb2a.gif)

<br><br>

**② 주요 공연장 좌석 리뷰**
  + 원하는 공연장을 클릭하여 구역별 좌석 리뷰 확인
![2](https://user-images.githubusercontent.com/75024035/147776492-3628c37a-1220-4d5b-ad8e-6264e12384e8.gif)

<br><br>

**③ 회원 등급에 따른 메뉴 접근 제한**
  + case 1) 비회원<br>
![3-1](https://user-images.githubusercontent.com/75024035/147778963-ba6bea05-efd7-42ae-906e-48ab3f70d431.gif)
  + case 2) 뉴비<br>
![3-2](https://user-images.githubusercontent.com/75024035/147779585-c9dce95a-780b-437d-81ae-b381346dc502.gif)

<br><br>

**④ 관리자 페이지 홈**
  + 왼쪽 사이드의 메뉴바, 총 회원 수, 총 리뷰 수, 미처리된 신고 리스트 확인
  + 가입 회원 통계, 방문 회원 통계
![4](https://user-images.githubusercontent.com/75024035/147777027-4f56ea62-9b2a-4f97-84ee-5bc09c34b175.gif)
<br><br>

**⑤ 관리자 페이지의 회원 관리**
  + 회원 목록 및 해당 회원의 포인트 내역 조회
  + 관리자가 회원의 포인트를 강제로 변경해줘야 할 경우 잔여포인트 변경 -> 회원 등급 자동 변경
![5](https://user-images.githubusercontent.com/75024035/147778640-7084ecd2-373f-4a08-93ab-fe0bc25f5ae9.gif)

