
CREATE DATABASE QL_RapChieuPhim;
USE QL_RapChieuPhim;


CREATE TABLE Phim (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Ten VARCHAR(255) NOT NULL,
    ThoiLuong INT NOT NULL,
    create_at DATETIME NOT NULL
);

CREATE TABLE TaiKhoan (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Ten VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    create_at DATETIME NOT NULL
);

CREATE TABLE Phong (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Ten VARCHAR(100) NOT NULL,
    SoGhe INT NOT NULL,
    create_at DATETIME NOT NULL
);

CREATE TABLE ThoiGian (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Phim_Id INT NOT NULL,
    Phong_Id INT NOT NULL,
    TGBatDau DATETIME NOT NULL,
    FOREIGN KEY (Phim_Id)
        REFERENCES Phim (ID),
    FOREIGN KEY (Phong_Id)
        REFERENCES Phong (ID)
);

CREATE TABLE Ghe (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    SoHang VARCHAR(2) NOT NULL,
    SoGhe INT NOT NULL,
    Phong_id INT NOT NULL,
    create_at DATETIME NOT NULL,
    FOREIGN KEY (Phong_id)
        REFERENCES phong (ID)
);

CREATE TABLE VeDat (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ThoiGian_id INT NOT NULL,
    TaiKhoan_id INT NOT NULL,
    create_at DATETIME NOT NULL,
    FOREIGN KEY (ThoiGian_id)
        REFERENCES ThoiGian (ID),
    FOREIGN KEY (TaiKhoan_id)
        REFERENCES TaiKhoan (ID)
);

CREATE TABLE VeDat_Ghe (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    VeDat_id INT NOT NULL,
    Ghe_id INT NOT NULL,
    create_at DATETIME NOT NULL,
    FOREIGN KEY (VeDat_id) REFERENCES VeDat(ID),
    FOREIGN KEY (Ghe_id) REFERENCES Ghe(ID)
);

CREATE TABLE DienVien (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Ten VARCHAR(100) NOT NULL,
    last_update TIMESTAMP NOT NULL,
    create_at DATETIME NOT NULL
);

CREATE TABLE TheLoai (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Ten VARCHAR(100) NOT NULL UNIQUE,
    last_update TIMESTAMP NOT NULL,
    create_at DATETIME NOT NULL
);

CREATE TABLE DienVien_phim (
    DienVien_id INT PRIMARY KEY AUTO_INCREMENT,
    Phim_id INT NOT NULL,
    last_update TIMESTAMP NOT NULL,
    FOREIGN KEY (DienVien_id)
        REFERENCES DienVien (ID),
    FOREIGN KEY (Phim_id)
        REFERENCES Phim (ID)
);

CREATE TABLE Phim_TheLoai (
    Phim_id INT PRIMARY KEY AUTO_INCREMENT,
    TheLoai_id INT NOT NULL,
    last_update TIMESTAMP NOT NULL,
    FOREIGN KEY (Phim_id)
        REFERENCES Phim (ID),
    FOREIGN KEY (TheLoai_id)
        REFERENCES TheLoai (ID)
);
CREATE TABLE DienVien_TheLoai (
    DienVien_id INT PRIMARY KEY AUTO_INCREMENT,
    TheLoai_id INT NOT NULL,
    last_update TIMESTAMP NOT NULL,
    FOREIGN KEY (DienVien_id)
        REFERENCES DienVien (ID),
    FOREIGN KEY (TheLoai_id)
        REFERENCES TheLoai (ID)
);

INSERT INTO Phim (Ten, ThoiLuong, create_at)
VALUES ('Blade Runner 2049',153, '2024-01-03'),
('Dunkirk',106, '2024-02-15'),
('Geostorm',121, '2024-02-15'),
('Thor: Ragnarok',107, '2024-02-03'),
('Jigsaw',116, '2024-01-05'),
('The Death of Stalin',98, '2024-01-11'),
('The Lego Ninjago Movie',101, '2024-01-05'),
('Murder on the Orient Express',135, '2024-02-02'),
('Paddington 2',88, '2024-02-02'),
('Breathe',117, '2024-01-01'),
('Blade Runner',127, '2024-01-006'),
('Victoria and Abdul',112, '2024-01-18');

INSERT INTO TaiKhoan (Ten, email, create_at)
VALUES ('David','dmay@gmail.com', '2024-01-01'),('Davis','tdavis@gmail.com', '2023-11-22'),('Martin','jermar@gmail.com', '2024-01-03'),('John','smithy@gmail.com', '2023-11-11'),
('Martin','mwatto@gmail.com', '2024-02-02'),('Emma','itswingardiumleviosa@gmail.com', '2023-12-18'),('Pastore','jp@gmail.com', '2024-02-02'),('Hare','chare@gmail.com', '2022-12-12');

INSERT INTO phong (Ten, SoGhe, create_at) 
VALUES ('Chaplin',72, '2023-03-08'),
('Kubrick',36, '2024-01-30'),
('Coppola',36, '2024-01-22');

INSERT INTO ThoiGian (Phim_id, Phong_id, TGBatDau)
VALUES (9, 3, '2024-01-01 21:30:00'),
       (3, 2, '2024-01-03 19:00:00'),
       (8, 1, '2024-01-06 04:15:00'),
       (3, 1, '2024-01-12 13:00:00'),
       (9, 1, '2024-01-12 15:57:00'),
       (8, 2, '2024-01-19 20:15:00'),
       (8, 2, '2024-01-19 22:30:00'),
       (4, 2, '2024-01-22 16:30:00'),
       (3, 3, '2024-01-22 19:45:00'),
       (2, 2, '2024-01-22 19:45:00'),
       (6, 3, '2024-01-27 08:30:00'),
       (7, 1, '2024-01-27 10:05:00'),
       (11, 2, '2024-01-28 13:40:00'),
       (6, 2, '2024-01-28 14:20:00'),
       (3, 1, '2024-01-30 16:10:00'),
       (1, 2, '2024-02-03 13:25:00'),
       (10, 1, '2024-02-06 18:15:00'),
       (7, 1, '2024-02-11 14:10:00'),
       (9, 1, '2024-02-12 15:05:00'),
       (2, 3, '2024-02-14 17:30:00');

INSERT INTO Ghe (SoHang, SoGhe, phong_id, create_at)
VALUES ('A',1,1, '2024-01-30'),('A',2,1, '2024-01-30'),('A',3,1, '2024-01-30'),('A',4,1, '2024-01-30'),('A',5,1, '2024-01-30'),('A',6,1, '2024-01-30'),('A',7,1, '2024-01-30'),('A',8,1, '2024-01-30'),
('B',1,1, '2024-01-30'),('B',2,1, '2024-01-30'),('B',3,1, '2024-01-30'),('B',4,1, '2024-01-30'),('B',5,1, '2024-01-30'),('B',6,1, '2024-01-30'),('B',7,1, '2024-01-01'),('B',8,1, '2024-01-30');

INSERT INTO VeDat (ThoiGian_id, TaiKhoan_id, create_at)
VALUES (2,2, '2024-01-30'),(1,4, '2024-01-30'),(2,6, '2024-01-30'),(4,2, '2024-01-30'), 
(6,5, '2024-01-30'),(1,7, '2024-01-30'),(2,2, '2024-01-30'),(3,6, '2024-01-30');

INSERT INTO VeDat_Ghe (VeDat_id, Ghe_id, create_at) 
VALUES (1,54, '2024-01-30'),(1,33, '2024-01-30'),(1,42, '2024-01-30'),(2,43, '2024-01-30'),
		(2,44, '2024-01-30'),(3,45, '2024-01-30'),
		(3,46, '2024-01-30'),(4,48, '2024-01-30'),
		(4,47, '2024-01-30'),(5,55, '2024-01-30');

INSERT INTO DienVien (Ten, last_update, create_at)
VALUES 
('NICK','2006-02-15 10:15:20','2024-01-30'),
('CHASE','2006-02-15 10:15:20','2024-01-30'),
('DAVIS','2006-02-15 10:15:20','2024-01-30'),
('JOHNNY','2006-02-15 10:15:20','2024-01-30'),
('NICHOLSON','2006-02-15 10:15:20','2024-01-30'),
('GRACE','2006-02-15 10:15:20','2024-01-30'),
('MATTHEW','2006-02-15 10:15:20','2024-01-30'),
('JOE','2006-02-15 06:35:38','2024-01-30'),
('CHRISTIAN','2006-02-15 06:35:38','2024-01-30'),
('ZERO','2006-02-15 06:35:38','2024-01-30'),
('KARL','2006-02-15 06:35:38','2024-01-30'),
('WOOD','2006-02-15 06:35:38','2024-01-30'),
('VIVIEN','2006-02-15 06:35:38','2024-01-30'),
('OLIVIER','2006-02-15 06:35:38','2024-01-30'),
('FRED','2006-02-15 06:35:38','2024-01-30'),
('HELEN','2006-02-15 06:35:38','2024-01-30'),
('DAN','2006-02-15 06:35:38','2024-01-30');

INSERT INTO TheLoai (Ten, last_update, create_at)
VALUES ('Action','2006-02-15 08:25:36','2024-01-30'),
('Animation','2006-02-15 08:25:36','2024-01-30'),
('Children','2006-02-15 08:25:36','2024-01-30'),
('Classics','2006-02-15 08:25:36','2024-01-30'),
('Comedy','2006-02-15 08:25:36','2024-01-30'),
('Documentary','2006-02-15 08:25:36','2024-01-30'),
('Drama','2006-02-15 08:25:36','2024-01-30'),
('Family','2006-02-15 08:25:36','2024-01-30'),
('Foreign','2006-02-15 08:25:36','2024-01-30'),
('Games','2006-02-15 08:25:36','2024-01-30'),
('Horror','2006-02-15 08:25:36','2024-01-30'),
('Music','2006-02-15 08:25:36','2024-01-30'),
('New','2006-02-15 08:25:36','2024-01-30'),
('Sci-Fi','2006-02-15 08:25:36','2024-01-30'),
('Sports','2006-02-15 08:25:36','2024-01-30'),
('Travel','2006-02-15 08:25:36','2024-01-30');

INSERT INTO DienVien_Phim (DienVien_id, Phim_id, last_update)
VALUES

('15','3','2006-02-15 06:06:03'),
('16','5','2006-02-15 07:03:03'),
('16','8','2006-02-15 08:08:03'),
('3','9','2006-02-15 08:1:03'),
('4','2','2006-02-15 08:08:03'),
('18','3','2006-02-15 08:08:03'),
('18','8','2006-02-15 06:08:03'),
('5','1','2006-02-15 06:08:03'),
('5','2','2006-02-15 06:08:03');

INSERT INTO Phim_TheLoai (TheLoai_id, Phim_id, last_update)
VALUES ('1','1','2006-02-15 05:05:03'),
('1','2','2006-02-15 05:05:03'),
('1','3','2006-02-15 05:05:03'),
('2','5','2006-02-15 05:05:03'),
('3','8','2006-02-15 05:05:03'),
('4','9','2006-02-15 05:05:03'),
('5','2','2006-02-15 05:05:03'),
('6','3','2006-02-15 05:05:03'),
('8','8','2006-02-15 05:05:03'),
('5','1','2006-02-15 05:05:03'),
('6','2','2006-02-15 05:05:03');

INSERT INTO DienVien_TheLoai (DienVien_id, TheLoai_id, last_update)
VALUES
('1','16','2023-02-15 06:06:03'),
('2','15','2023-02-15 07:03:03'),
('4','7','2023-02-15 08:08:03'),
('3','3','2023-02-15 08:1:03'),
('4','12','202302-15 08:08:03'),
('5','3','202302-15 08:08:03'),
('12','8','2023-02-15 06:08:03'),
('12','11','2023-02-15 06:08:03'),
('3','2','202-02-15 06:08:03');