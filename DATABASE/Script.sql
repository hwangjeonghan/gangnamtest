-- 1. 다대다 관계: 사용자가 여러 도서를 대여할 수 있고, 도서도 여러 사용자에게 대여될 수 있습니다. 이를 해결하기 위해 중간 테이블이 필요합니다.
-- 2. 중복 데이터: books 테이블에 user_no와 Rental_data가 포함되어 있어 중복 데이터가 발생할 수 있습니다.
-- 이를 해결하기 위해 다음과 같이 ERD를 수정합니다:
-- 1. users 테이블: 사용자 정보를 저장합니다.
-- 2. books 테이블: 도서 정보를 저장합니다.
-- 3. rentals 테이블: 사용자와 도서 간의 대여 정보를 저장합니다.
-- 수정된 ERD는 다음과 같습니다:
-- users 테이블 생성

CREATE TABLE users (
    user_no INT PRIMARY KEY,
    user_name VARCHAR(100),
    user_address VARCHAR(255),
    user_phone VARCHAR(20),
    user_status VARCHAR(20)
);

-- books 테이블 생성
CREATE TABLE books (
    book_code INT PRIMARY KEY,
    book_title VARCHAR(255),
    book_quantity INT,
    book_status VARCHAR(20)
);

-- rentals 테이블 생성
CREATE TABLE rentals (
    rental_id INT PRIMARY KEY AUTO_INCREMENT,
    user_no INT,
    book_code INT,
    rental_date DATE,
    FOREIGN KEY (user_no) REFERENCES users(user_no),
    FOREIGN KEY (book_code) REFERENCES books(book_code)
);


-- users 데이터 삽입
INSERT INTO users (user_no, user_name, user_address, user_phone, user_status) VALUES
(1, '홍길동', '서울시 강남구', '010-1234-5678', '활성'),
(2, '김철수', '서울시 서초구', '010-8765-4321', '비활성');

-- books 데이터 삽입
INSERT INTO books (book_code, book_title, book_quantity, book_status) VALUES
(101, '데이터베이스 개론', 5, '대여 가능'),
(102, '운영체제', 3, '대여 가능');

-- rentals 데이터 삽입
INSERT INTO rentals (user_no, book_code, rental_date) VALUES
(1, 101, '2023-10-01'),
(2, 102, '2023-10-02');

SELECT u.user_no, u.user_name, b.book_title
FROM rentals r
JOIN users u ON r.user_no = u.user_no
JOIN books b ON r.book_code = b.book_code
WHERE u.user_no = 1;