-- ================================================
-- Hệ Thống Quản Lý Bất Động Sản - Dữ Liệu Mẫu
-- ================================================

USE real_estate_db;

-- ================================================
-- Xóa dữ liệu cũ
-- ================================================

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE transactions;
TRUNCATE TABLE reviews;
TRUNCATE TABLE inquiries;
TRUNCATE TABLE favorites;
TRUNCATE TABLE property_amenities;
TRUNCATE TABLE properties;
TRUNCATE TABLE sellers;
TRUNCATE TABLE users;

SET FOREIGN_KEY_CHECKS = 1;

-- ================================================
-- Thêm Users (48 người dùng)
-- ================================================

INSERT INTO users (name, email, password, role, phone) VALUES
('Quan Tri Vien', 'admin@example.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'admin', '0901234567'),
('Sieu Quan Tri', 'superadmin@example.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'admin', '0901234568'),
('Nguyen Van An', 'user@example.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345001'),
('Tran Thi Binh', 'tran.binh@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345002'),
('Le Van Cuong', 'le.cuong@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345003'),
('Pham Thi Dung', 'pham.dung@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345004'),
('Hoang Van Em', 'hoang.em@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345005'),
('Vu Thi Phuong', 'vu.phuong@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345006'),
('Dang Van Giang', 'dang.giang@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345007'),
('Bui Thi Hoa', 'bui.hoa@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345008'),
('Dinh Van Khoa', 'dinh.khoa@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345009'),
('Do Thi Lan', 'do.lan@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345010'),
('Mai Van Minh', 'mai.minh@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345011'),
('Ngo Thi Nga', 'ngo.nga@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345012'),
('Phan Van Oanh', 'phan.oanh@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345013'),
('Truong Thi Phuc', 'truong.phuc@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345014'),
('Ly Van Quan', 'ly.quan@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345015'),
('Vo Thi Rang', 'vo.rang@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345016'),
('Duong Van Son', 'duong.son@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345017'),
('Cao Thi Thao', 'cao.thao@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345018'),
('To Van Uy', 'to.uy@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345019'),
('Luong Thi Van', 'luong.van@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345020'),
('Ho Van Xuan', 'ho.xuan@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345021'),
('Thai Thi Yen', 'thai.yen@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345022'),
('Quach Van An', 'quach.an@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345023'),
('Ta Thi Bao', 'ta.bao@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345024'),
('Huynh Van Canh', 'huynh.canh@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345025'),
('Doan Thi Diem', 'doan.diem@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345026'),
('Tu Van Duc', 'tu.duc@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345027'),
('Ong Thi Hanh', 'ong.hanh@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345028'),
('Phung Van Hai', 'phung.hai@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345029'),
('Chau Thi Kim', 'chau.kim@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345030'),
('Lam Van Long', 'lam.long@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345031'),
('Trieu Thi Mai', 'trieu.mai@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345032'),
('Trinh Van Nam', 'trinh.nam@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345033'),
('Kim Thi Oanh', 'kim.oanh@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345034'),
('La Van Phong', 'la.phong@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345035'),
('Dien Thi Quynh', 'dien.quynh@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345036'),
('Tang Van Sang', 'tang.sang@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345037'),
('Luu Thi Trang', 'luu.trang@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345038'),
('Ha Van Ung', 'ha.ung@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345039'),
('Chu Thi Vu', 'chu.vu@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345040'),
('Khuc Van Vinh', 'khuc.vinh@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345041'),
('Ninh Thi Xuan', 'ninh.xuan@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345042'),
('Au Van Yen', 'au.yen@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345043'),
('Ung Thi Anh', 'ung.anh@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345044'),
('Nham Van Binh', 'nham.binh@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345045'),
('Lac Thi Cuc', 'lac.cuc@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345046'),
('Thi Van Duy', 'thi.duy@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345047'),
('Ma Thi Hang', 'ma.hang@email.com', '$2a$10$rPiVJwqZV8k3w0e5E4kk7OqFJ.HxUZwSQCYvLYB7z5GZ8FYvOJ7uy', 'user', '0912345048');

-- ================================================
-- Thêm Sellers - Môi giới (30 môi giới)
-- ================================================

INSERT INTO sellers (name, email, phone, company, address, website, license_number, rating, total_sales) VALUES
('Nguyen Minh Tuan', 'nguyen.tuan@batdongsan.vn', '0987654321', 'Tap Doan BDS Minh Tuan', '123 Nguyen Hue, Q.1, TP.HCM', 'www.minhtuan-realestate.vn', 'BDS-HCM-001', 4.80, 45),
('Tran Huong Giang', 'tran.giang@nhadat.vn', '0987654322', 'Cong Ty Nha Dat Huong Giang', '456 Le Loi, Q.1, TP.HCM', 'www.huonggiang-property.vn', 'BDS-HCM-002', 4.90, 52),
('Le Quoc Bao', 'le.bao@realty.vn', '0987654323', 'Bao An Real Estate', '789 Tran Hung Dao, Q.5, TP.HCM', 'www.baoan-realty.vn', 'BDS-HCM-003', 4.70, 38),
('Pham Thanh Ha', 'pham.ha@luxury.vn', '0987654324', 'Luxury Homes Viet Nam', '100 Dien Bien Phu, Q.3, TP.HCM', 'www.luxuryhomes.vn', 'BDS-HCM-004', 4.90, 61),
('Hoang Duc Long', 'hoang.long@vinhomes.vn', '0987654325', 'Vinhomes Real Estate', '200 Vo Van Tan, Q.3, TP.HCM', 'www.vinhomes-re.vn', 'BDS-HCM-005', 4.60, 33),
('Vu Thi Mai', 'vu.mai@dreamhome.vn', '0987654326', 'Dream Home Property', '300 Nguyen Thi Minh Khai, Q.1, TP.HCM', 'www.dreamhome.vn', 'BDS-HCM-006', 4.80, 41),
('Dang Van Hung', 'dang.hung@premier.vn', '0987654327', 'Premier Realty Viet Nam', '400 Pasteur, Q.1, TP.HCM', 'www.premier-vn.com', 'BDS-HCM-007', 4.70, 36),
('Bui Thu Huong', 'bui.huong@properties.vn', '0987654328', 'Thu Huong Properties', '500 Hai Ba Trung, Q.1, TP.HCM', 'www.thuhuong-prop.vn', 'BDS-HCM-008', 4.90, 48),
('Dinh Cong Son', 'dinh.son@elite.vn', '0987654329', 'Elite Real Estate VN', '600 Ly Tu Trong, Q.1, TP.HCM', 'www.elite-re.vn', 'BDS-HCM-009', 4.80, 44),
('Do Minh Phuong', 'do.phuong@invest.vn', '0987654330', 'Phuong Investment Group', '700 Nam Ky Khoi Nghia, Q.1, TP.HCM', 'www.phuong-invest.vn', 'BDS-HCM-010', 4.60, 29),
('Mai Xuan Thanh', 'mai.thanh@realty.vn', '0987654331', 'Xuan Thanh Realty', '800 Cach Mang Thang 8, Q.3, TP.HCM', 'www.xuanthanh-realty.vn', 'BDS-HCM-011', 4.70, 35),
('Ngo Thi Lan Anh', 'ngo.lananh@homes.vn', '0987654332', 'Lan Anh Home Solutions', '900 Vo Thi Sau, Q.3, TP.HCM', 'www.lananh-homes.vn', 'BDS-HCM-012', 4.90, 55),
('Phan Duc Minh', 'phan.minh@properties.vn', '0987654333', 'Duc Minh Properties LLC', '1000 Truong Son, Tan Binh, TP.HCM', 'www.ducminh-prop.vn', 'BDS-HCM-013', 4.80, 42),
('Truong Ngoc Han', 'truong.han@realestate.vn', '0987654334', 'Ngoc Han Real Estate Co', '1100 Hoang Van Thu, Tan Binh, TP.HCM', 'www.ngochan-re.vn', 'BDS-HCM-014', 4.70, 37),
('Ly Thanh Tung', 'ly.tung@luxury.vn', '0987654335', 'Thanh Tung Luxury Living', '1200 Cong Hoa, Tan Binh, TP.HCM', 'www.thanhtung-luxury.vn', 'BDS-HCM-015', 4.90, 50),
('Vo Hoai Thu', 'vo.thu@quality.vn', '0987654336', 'Quality Homes Viet Nam', '1300 Lac Long Quan, Q.11, TP.HCM', 'www.quality-homes.vn', 'BDS-HCM-016', 4.60, 31),
('Duong Quoc Tuan', 'duong.tuan@services.vn', '0987654337', 'Quoc Tuan Realty Services', '1400 Phan Van Tri, Go Vap, TP.HCM', 'www.quoctuan-realty.vn', 'BDS-HCM-017', 4.80, 46),
('Cao Thi Bich', 'cao.bich@premier.vn', '0987654338', 'Bich Premier Properties', '1500 Quang Trung, Go Vap, TP.HCM', 'www.bich-properties.vn', 'BDS-HCM-018', 4.70, 39),
('To Van Dat', 'to.dat@estate.vn', '0987654339', 'Van Dat Estate Management', '1600 Phan Huy Ich, Tan Binh, TP.HCM', 'www.vandat-estate.vn', 'BDS-HCM-019', 4.90, 53),
('Luong Thi Ngoc', 'luong.ngoc@pros.vn', '0987654340', 'Ngoc Real Estate Pros', '1700 Nguyen Oanh, Go Vap, TP.HCM', 'www.ngoc-repros.vn', 'BDS-HCM-020', 4.80, 43),
('Ho Quang Minh', 'ho.minh@experts.vn', '0987654341', 'Quang Minh Home Experts', '1800 Pham Van Dong, Thu Duc, TP.HCM', 'www.quangminh-experts.vn', 'BDS-HCM-021', 4.70, 34),
('Thai Bao Ngoc', 'thai.ngoc@luxury.vn', '0987654342', 'Bao Ngoc Luxury Estates', '1900 Vo Van Ngan, Thu Duc, TP.HCM', 'www.baongoc-luxury.vn', 'BDS-HCM-022', 4.90, 57),
('Quach Minh Tam', 'quach.tam@group.vn', '0987654343', 'Minh Tam Property Group', '2000 Kha Van Can, Thu Duc, TP.HCM', 'www.minhtam-properties.vn', 'BDS-HCM-023', 4.60, 28),
('Ta Thi Kim', 'ta.kim@associates.vn', '0987654344', 'Kim Realty Associates', '2100 Xa lo Ha Noi, Q.2, TP.HCM', 'www.kim-realty.vn', 'BDS-HCM-024', 4.80, 40),
('Huynh Van Thang', 'huynh.thang@solutions.vn', '0987654345', 'Thang Estate Solutions', '2200 Do Xuan Hop, Q.9, TP.HCM', 'www.thang-estates.vn', 'BDS-HCM-025', 4.70, 32),
('Doan Thi Hong', 'doan.hong@advisors.vn', '0987654346', 'Hong Home Advisors', '2300 Le Van Viet, Q.9, TP.HCM', 'www.hong-advisors.vn', 'BDS-HCM-026', 4.90, 49),
('Tu Quang Huy', 'tu.huy@partners.vn', '0987654347', 'Quang Huy Real Estate Partners', '2400 Nguyen Duy Trinh, Q.2, TP.HCM', 'www.quanghuy-partners.vn', 'BDS-HCM-027', 4.80, 47),
('Ong Thi Tuyet', 'ong.tuyet@network.vn', '0987654348', 'Tuyet Property Network', '2500 Tran Nao, Q.2, TP.HCM', 'www.tuyet-network.vn', 'BDS-HCM-028', 4.70, 36),
('Phung Duc Thinh', 'phung.thinh@luxury.vn', '0987654349', 'Duc Thinh Luxury Realty', '2600 Mai Chi Tho, Q.2, TP.HCM', 'www.ducthinh-luxury.vn', 'BDS-HCM-029', 4.90, 54),
('Chau Minh Nhat', 'chau.nhat@group.vn', '0987654350', 'Minh Nhat Estate Group', '2700 Nguyen Thi Dinh, Q.2, TP.HCM', 'www.minhnhat-estates.vn', 'BDS-HCM-030', 4.80, 45);

-- ================================================
-- Thêm Properties - Bất động sản (100 BDS)
-- ================================================

INSERT INTO properties (title, type, location, city, state, zip_code, area, price, bedrooms, bathrooms, floors, garage, year_built, status, description, seller_id, is_featured) VALUES
('Biet Thu Bien View Dep', 'villa', '1 Duong Ven Bien', 'Nha Trang', 'Khanh Hoa', '650000', 500, 25000000000.00, 6, 7, 3, 3, 2020, 'available', 'Biet thu view bien tuyet dep voi ho boi vo cuc.', 4, 1),
('Penthouse Landmark 81', 'apartment', 'Tang cao nhat Landmark 81', 'TP Ho Chi Minh', 'TP.HCM', '700000', 420, 150000000000.00, 4, 5, 1, 2, 2019, 'available', 'Penthouse sieu sang tai toa nha bieu tuong TP.HCM.', 1, 1),
('Dinh Thu Thao Dien', 'house', '9876 Xa Lo Ha Noi', 'TP Ho Chi Minh', 'TP.HCM', '700000', 800, 95000000000.00, 8, 10, 2, 4, 2021, 'available', 'Kiet tac kien truc tai khu Thao Dien cao cap.', 2, 1),
('Nha Pho Quan 1 Dep', 'house', '123 Nguyen Hue', 'TP Ho Chi Minh', 'TP.HCM', '700000', 120, 15000000000.00, 4, 3, 4, 1, 2015, 'available', 'Nha pho mat tien duong lon, vi tri vang Q.1.', 1, 0),
('Nha Mat Tien Phu Nhuan', 'house', '456 Phan Dang Luu', 'TP Ho Chi Minh', 'TP.HCM', '700000', 85, 12000000000.00, 4, 3, 3, 0, 2018, 'available', 'Nha mat tien kinh doanh sam uat.', 7, 0),
('Biet Thu Vuon Quan 2', 'villa', '789 Thao Dien', 'TP Ho Chi Minh', 'TP.HCM', '700000', 400, 35000000000.00, 5, 5, 2, 3, 2019, 'available', 'Biet thu vuon rong rai, yen tinh.', 2, 1),
('Nha Pho Tan Binh', 'house', '321 Hoang Van Thu', 'TP Ho Chi Minh', 'TP.HCM', '700000', 95, 9500000000.00, 4, 3, 3, 1, 2017, 'available', 'Nha dep gan san bay.', 7, 0),
('Nha Vuon Quan 9', 'house', '555 Do Xuan Hop', 'TP Ho Chi Minh', 'TP.HCM', '700000', 200, 8500000000.00, 4, 3, 2, 2, 2020, 'available', 'Nha vuon yen tinh.', 25, 0),
('Can Ho Vinhomes Central Park', 'apartment', 'Toa Landmark 2, Tang 25', 'TP Ho Chi Minh', 'TP.HCM', '700000', 100, 6500000000.00, 2, 2, 1, 1, 2019, 'available', 'Can ho cao cap view song Sai Gon.', 5, 1),
('Chung Cu Masteri Thao Dien', 'apartment', 'Tang 18, Toa T5', 'TP Ho Chi Minh', 'TP.HCM', '700000', 75, 4800000000.00, 2, 2, 1, 1, 2018, 'available', 'Can ho hien dai, view dep.', 2, 0),
('Can Ho Officetel Quan 1', 'apartment', 'Nguyen Hue, Tang 12', 'TP Ho Chi Minh', 'TP.HCM', '700000', 45, 3200000000.00, 1, 1, 1, 0, 2020, 'available', 'Officetel trung tam Q.1.', 1, 0),
('Chung Cu The Sun Avenue', 'apartment', 'Toa 3, Tang 10', 'TP Ho Chi Minh', 'TP.HCM', '700000', 68, 3800000000.00, 2, 1, 1, 1, 2017, 'available', 'Can ho 2PN thoang mat.', 9, 0),
('Penthouse Sunrise City', 'apartment', 'Tang cao Toa V5', 'TP Ho Chi Minh', 'TP.HCM', '700000', 180, 11000000000.00, 3, 3, 1, 2, 2019, 'available', 'Penthouse sang trong.', 9, 1),
('Dat Nen Van Phuc City', 'land', 'Phuong Hiep Binh Phuoc', 'TP Ho Chi Minh', 'TP.HCM', '700000', 120, 8500000000.00, 0, 0, 0, 0, NULL, 'available', 'Dat nen khu do thi cao cap.', 19, 0),
('Dat Mat Tien Quoc Lo 1A', 'land', 'Xa Binh Chanh', 'TP Ho Chi Minh', 'TP.HCM', '700000', 500, 25000000000.00, 0, 0, 0, 0, NULL, 'available', 'Dat mat tien duong lon.', 11, 0),
('Dat Vuon Long An', 'farm', 'Huyen Ben Luc', 'Long An', 'Long An', '850000', 5000, 12000000000.00, 0, 0, 0, 0, NULL, 'available', 'Dat vuon rong 5000m2.', 28, 0),
('Dat Nen Binh Duong', 'land', 'KCN Viet Nam Singapore', 'Binh Duong', 'Binh Duong', '820000', 200, 4500000000.00, 0, 0, 0, 0, NULL, 'available', 'Dat nen gan khu cong nghiep.', 23, 0),
('Mat Bang Kinh Doanh Q1', 'commercial', '900 Nguyen Trai', 'TP Ho Chi Minh', 'TP.HCM', '700000', 150, 18000000000.00, 0, 2, 1, 0, 2017, 'available', 'Mat bang mat tien.', 1, 0),
('Toa Nha Van Phong Q3', 'commercial', '1000 Dien Bien Phu', 'TP Ho Chi Minh', 'TP.HCM', '700000', 800, 65000000000.00, 0, 8, 8, 15, 2019, 'available', 'Toa nha van phong hien dai.', 10, 1),
('Shophouse Phu My Hung', 'commercial', '1100 Nguyen Luong Bang', 'TP Ho Chi Minh', 'TP.HCM', '700000', 200, 22000000000.00, 0, 3, 4, 2, 2018, 'available', 'Shophouse 4 tang.', 2, 0),
('Kho Xuong Binh Tan', 'commercial', '1200 Quoc Lo 1A', 'TP Ho Chi Minh', 'TP.HCM', '700000', 1000, 15000000000.00, 0, 2, 1, 0, 2016, 'available', 'Kho xuong dien tich lon.', 25, 0),
('Biet Thu Bien Phu Quoc', 'villa', 'Bai Truong', 'Phu Quoc', 'Kien Giang', '920000', 350, 28000000000.00, 4, 4, 2, 2, 2019, 'available', 'Biet thu nghi duong view bien.', 19, 1),
('Can Ho Resort Da Lat', 'apartment', 'Khu Ho Tuyen Lam', 'Da Lat', 'Lam Dong', '670000', 80, 3500000000.00, 2, 2, 1, 1, 2020, 'available', 'Can ho nghi duong view ho.', 15, 0),
('Homestay Sapa', 'house', 'Thi Tran Sa Pa', 'Sa Pa', 'Lao Cai', '330000', 150, 4200000000.00, 5, 3, 2, 1, 2018, 'available', 'Homestay view nui dep.', 20, 0),
('Chung Cu Binh Tan', 'apartment', 'Duong So 6', 'TP Ho Chi Minh', 'TP.HCM', '700000', 55, 1850000000.00, 2, 1, 1, 0, 2016, 'available', 'Can ho 2PN gia tot.', 11, 0),
('Chung Cu Quan 12', 'apartment', 'To Ky', 'TP Ho Chi Minh', 'TP.HCM', '700000', 50, 1650000000.00, 2, 1, 1, 0, 2015, 'sold', 'Can ho gia re.', 11, 0),
('Nha Pho Go Vap', 'house', 'Phan Van Tri', 'TP Ho Chi Minh', 'TP.HCM', '700000', 80, 7200000000.00, 3, 2, 3, 0, 2016, 'available', 'Nha 1 tret 2 lau.', 16, 0),
('Can Ho The Gold View', 'apartment', 'Ben Van Don Q4', 'TP Ho Chi Minh', 'TP.HCM', '700000', 82, 5300000000.00, 2, 2, 1, 1, 2017, 'available', 'Can ho view song.', 4, 0),
('Nha Mat Tien Quan 7', 'house', 'Nguyen Van Linh', 'TP Ho Chi Minh', 'TP.HCM', '700000', 100, 13500000000.00, 4, 3, 4, 1, 2019, 'available', 'Nha mat tien duong lon Q7.', 13, 0),
('Biet Thu Sala', 'villa', 'Khu Sala Dai Quang Minh', 'TP Ho Chi Minh', 'TP.HCM', '700000', 350, 42000000000.00, 5, 5, 3, 3, 2020, 'available', 'Biet thu don lap khu Sala.', 2, 1),
('Can Ho Estella Heights', 'apartment', 'Toa T1 Tang 15', 'TP Ho Chi Minh', 'TP.HCM', '700000', 105, 7200000000.00, 2, 2, 1, 1, 2019, 'available', 'Can ho 2PN view dep.', 2, 0),
('Dat Nen Nhon Trach', 'land', 'Duong 25C', 'Dong Nai', 'Dong Nai', '810000', 100, 2500000000.00, 0, 0, 0, 0, NULL, 'available', 'Dat nen so hong rieng.', 23, 0),
('Nha Pho Binh Thanh', 'house', 'Dinh Bo Linh', 'TP Ho Chi Minh', 'TP.HCM', '700000', 70, 9800000000.00, 3, 3, 4, 0, 2018, 'pending', 'Nha 1 tret 3 lau.', 16, 0),
('Can Ho Saigon Pearl', 'apartment', 'Toa Ruby Tang 20', 'TP Ho Chi Minh', 'TP.HCM', '700000', 135, 9500000000.00, 3, 2, 1, 1, 2016, 'available', 'Can ho 3PN view song.', 4, 0),
('Shophouse Viva Park', 'commercial', 'Duong D1', 'TP Ho Chi Minh', 'TP.HCM', '700000', 90, 8500000000.00, 0, 2, 4, 1, 2019, 'available', 'Shophouse 1 tret 3 lau.', 7, 0),
('Biet Thu Compound Thao Dien', 'villa', 'Compound An Phu', 'TP Ho Chi Minh', 'TP.HCM', '700000', 450, 55000000000.00, 6, 6, 2, 3, 2021, 'available', 'Biet thu trong compound cao cap.', 2, 1),
('Can Ho Citizen', 'apartment', 'Toa A Tang 8', 'TP Ho Chi Minh', 'TP.HCM', '700000', 62, 2650000000.00, 2, 1, 1, 0, 2017, 'available', 'Can ho gia tot khu Trung Son.', 13, 0),
('Nha Mat Tien Tan Phu', 'house', 'Luy Ban Bich', 'TP Ho Chi Minh', 'TP.HCM', '700000', 85, 11200000000.00, 4, 3, 3, 1, 2017, 'available', 'Nha mat tien kinh doanh.', 7, 0),
('Dat Nen Vung Tau', 'land', 'Phuong Thang Tam', 'Vung Tau', 'BR-VT', '790000', 150, 6500000000.00, 0, 0, 0, 0, NULL, 'available', 'Dat nen gan bien.', 19, 0),
('Can Ho River Gate', 'apartment', 'Toa B Tang 12', 'TP Ho Chi Minh', 'TP.HCM', '700000', 73, 4100000000.00, 2, 2, 1, 1, 2018, 'available', 'Can ho view song.', 4, 0),
('Nha Vuon Cu Chi', 'farm', 'Xa Phuoc Vinh An', 'TP Ho Chi Minh', 'TP.HCM', '700000', 1000, 5500000000.00, 3, 2, 1, 1, 2015, 'available', 'Nha vuon 1000m2.', 25, 0),
('Mat Bang Quan 10', 'commercial', 'Hung Vuong', 'TP Ho Chi Minh', 'TP.HCM', '700000', 60, 9500000000.00, 0, 1, 1, 0, 2016, 'available', 'Mat bang kinh doanh Q10.', 1, 0),
('Biet Thu Jamona Golden Silk', 'villa', 'Quan 7', 'TP Ho Chi Minh', 'TP.HCM', '700000', 200, 18500000000.00, 4, 4, 3, 2, 2019, 'available', 'Biet thu nha pho cao cap.', 13, 0),
('Can Ho Sky 9', 'apartment', 'Toa S1 Tang 18', 'TP Ho Chi Minh', 'TP.HCM', '700000', 68, 2950000000.00, 2, 2, 1, 1, 2018, 'available', 'Can ho Q9 view dep.', 9, 0),
('Nha Pho Quan 8', 'house', 'Pham Hung', 'TP Ho Chi Minh', 'TP.HCM', '700000', 75, 6800000000.00, 3, 2, 3, 0, 2016, 'available', 'Nha 1 tret 2 lau.', 13, 0),
('Dat Cong Nghiep Long An', 'commercial', 'KCN Tan Duc', 'Long An', 'Long An', '850000', 2000, 35000000000.00, 0, 0, 0, 0, NULL, 'available', 'Dat khu cong nghiep.', 28, 0),
('Can Ho Millennium', 'apartment', 'Toa A Tang 25', 'TP Ho Chi Minh', 'TP.HCM', '700000', 72, 4750000000.00, 1, 1, 1, 1, 2018, 'available', 'Can ho 1PN view Q1.', 4, 0),
('Nha Mat Tien Quan 6', 'house', 'Hau Giang', 'TP Ho Chi Minh', 'TP.HCM', '700000', 90, 10500000000.00, 4, 3, 4, 1, 2017, 'available', 'Nha mat tien Q6.', 13, 0),
('Biet Thu Swan Bay', 'villa', 'KDC Swan Bay', 'Dong Nai', 'Dong Nai', '810000', 280, 16500000000.00, 4, 4, 2, 2, 2020, 'available', 'Biet thu sinh thai.', 23, 0),
('Can Ho Kingdom 101', 'apartment', 'Toa K Tang 30', 'TP Ho Chi Minh', 'TP.HCM', '700000', 98, 7850000000.00, 2, 2, 1, 1, 2020, 'available', 'Can ho cao cap.', 1, 1),
('Dat Nen Binh Chanh', 'land', 'Xa Binh Hung', 'TP Ho Chi Minh', 'TP.HCM', '700000', 80, 3200000000.00, 0, 0, 0, 0, NULL, 'available', 'Dat nen so hong rieng.', 11, 0),
('Shophouse Celadon City', 'commercial', 'KDC Celadon City', 'TP Ho Chi Minh', 'TP.HCM', '700000', 110, 12500000000.00, 0, 2, 5, 1, 2019, 'available', 'Shophouse 5 tang.', 7, 0),
('Nha Pho Quan 11', 'house', 'Lac Long Quan', 'TP Ho Chi Minh', 'TP.HCM', '700000', 65, 7500000000.00, 3, 2, 3, 0, 2015, 'available', 'Nha 1 tret 2 lau.', 16, 0),
('Can Ho Hado Centrosa', 'apartment', 'Toa B Tang 14', 'TP Ho Chi Minh', 'TP.HCM', '700000', 86, 5650000000.00, 2, 2, 1, 1, 2018, 'available', 'Can ho view cong vien.', 10, 0),
('Biet Thu Thu Duc', 'villa', 'KDC Linh Dong', 'TP Ho Chi Minh', 'TP.HCM', '700000', 250, 19500000000.00, 5, 4, 2, 2, 2019, 'available', 'Biet thu moi xay.', 24, 0),
('Can Ho Sunwah Pearl', 'apartment', 'Toa W2 Tang 22', 'TP Ho Chi Minh', 'TP.HCM', '700000', 91, 6450000000.00, 2, 2, 1, 1, 2019, 'available', 'Can ho view song.', 4, 0),
('Dat Nen Thu Dau Mot', 'land', 'Phuong Chanh Nghia', 'Binh Duong', 'Binh Duong', '820000', 90, 3800000000.00, 0, 0, 0, 0, NULL, 'available', 'Dat nen trung tam.', 23, 0),
('Nha Mat Tien Thu Duc', 'house', 'Vo Van Ngan', 'TP Ho Chi Minh', 'TP.HCM', '700000', 95, 12800000000.00, 4, 3, 4, 1, 2018, 'available', 'Nha mat tien.', 24, 0),
('Can Ho D-Vela', 'apartment', 'Toa A Tang 9', 'TP Ho Chi Minh', 'TP.HCM', '700000', 60, 2350000000.00, 2, 1, 1, 0, 2017, 'available', 'Can ho gia re Q7.', 13, 0),
('Biet Thu Golf Tan My', 'villa', 'KDC Tan My', 'TP Ho Chi Minh', 'TP.HCM', '700000', 320, 38000000000.00, 5, 5, 2, 3, 2020, 'available', 'Biet thu san golf.', 2, 1),
('Shophouse Midtown', 'commercial', 'KDC Midtown', 'TP Ho Chi Minh', 'TP.HCM', '700000', 125, 24500000000.00, 0, 3, 5, 2, 2020, 'available', 'Shophouse mat tien.', 13, 0),
('Can Ho Newton Residence', 'apartment', 'Toa B Tang 16', 'TP Ho Chi Minh', 'TP.HCM', '700000', 78, 4850000000.00, 2, 2, 1, 1, 2018, 'available', 'Can ho view song.', 16, 0),
('Nha Pho Nam Sai Gon', 'house', 'KDC Nam Long', 'TP Ho Chi Minh', 'TP.HCM', '700000', 85, 9200000000.00, 3, 3, 3, 1, 2019, 'available', 'Nha pho KDC an ninh.', 13, 0),
('Dat Nen Can Tho', 'land', 'Quan Ninh Kieu', 'Can Tho', 'Can Tho', '900000', 100, 4500000000.00, 0, 0, 0, 0, NULL, 'available', 'Dat nen trung tam.', 20, 0),
('Can Ho New City', 'apartment', 'Toa T3 Tang 11', 'TP Ho Chi Minh', 'TP.HCM', '700000', 70, 3450000000.00, 2, 2, 1, 1, 2018, 'available', 'Can ho Thu Thiem.', 9, 0),
('Biet Thu Vinhomes Tan Cang', 'villa', 'KDC Vinhomes Tan Cang', 'TP Ho Chi Minh', 'TP.HCM', '700000', 380, 62000000000.00, 6, 6, 3, 3, 2020, 'available', 'Biet thu don lap.', 5, 1),
('Nha Mat Tien Binh Tan', 'house', 'Le Van Quoi', 'TP Ho Chi Minh', 'TP.HCM', '700000', 80, 8500000000.00, 3, 2, 3, 1, 2017, 'available', 'Nha mat tien.', 11, 0),
('Can Ho Orchard Garden', 'apartment', 'Toa O1 Tang 18', 'TP Ho Chi Minh', 'TP.HCM', '700000', 75, 5250000000.00, 2, 2, 1, 1, 2016, 'available', 'Can ho san bay.', 7, 0),
('Dat Nen Dong Nai', 'land', 'Huyen Long Thanh', 'Dong Nai', 'Dong Nai', '810000', 120, 5500000000.00, 0, 0, 0, 0, NULL, 'available', 'Dat nen gan san bay.', 23, 0),
('Shophouse Grand Park', 'commercial', 'KDC Grand Park', 'TP Ho Chi Minh', 'TP.HCM', '700000', 100, 15500000000.00, 0, 2, 5, 1, 2020, 'available', 'Shophouse sieu do thi.', 5, 1),
('Nha Pho Nha Be', 'house', 'Nguyen Binh', 'TP Ho Chi Minh', 'TP.HCM', '700000', 90, 8800000000.00, 4, 3, 3, 1, 2018, 'available', 'Nha pho KDC cao cap.', 13, 0),
('Can Ho Vista Verde', 'apartment', 'Toa T1 Tang 12', 'TP Ho Chi Minh', 'TP.HCM', '700000', 89, 5950000000.00, 2, 2, 1, 1, 2018, 'available', 'Can ho xanh.', 9, 0),
('Biet Thu Da Nang', 'villa', 'Khu An Thuong', 'Da Nang', 'Da Nang', '550000', 200, 18500000000.00, 4, 4, 2, 2, 2019, 'available', 'Biet thu gan bien.', 15, 0),
('Can Ho EhomeS', 'apartment', 'Toa E3 Tang 7', 'TP Ho Chi Minh', 'TP.HCM', '700000', 52, 1950000000.00, 2, 1, 1, 0, 2017, 'available', 'Can ho gia re.', 13, 0),
('Dat Nen Phan Thiet', 'land', 'Phuong Phu Hai', 'Phan Thiet', 'Binh Thuan', '800000', 200, 8500000000.00, 0, 0, 0, 0, NULL, 'available', 'Dat nen gan bien.', 19, 0),
('Nha Mat Tien Hoc Mon', 'house', 'Quoc Lo 22', 'TP Ho Chi Minh', 'TP.HCM', '700000', 110, 11500000000.00, 4, 3, 3, 2, 2018, 'available', 'Nha mat tien.', 25, 0),
('Can Ho Feliz En Vista', 'apartment', 'Toa C Tang 20', 'TP Ho Chi Minh', 'TP.HCM', '700000', 102, 8750000000.00, 3, 2, 1, 1, 2019, 'available', 'Can ho 3PN.', 9, 1),
('Biet Thu Khu Fideco', 'villa', 'KDC Fideco', 'TP Ho Chi Minh', 'TP.HCM', '700000', 300, 45000000000.00, 5, 5, 2, 3, 2019, 'available', 'Biet thu khu Thao Dien.', 2, 1),
('Shophouse Mizuki Park', 'commercial', 'KDC Mizuki Park', 'TP Ho Chi Minh', 'TP.HCM', '700000', 95, 11200000000.00, 0, 2, 5, 1, 2019, 'available', 'Shophouse KDC lon.', 13, 0),
('Nha Pho Quan 5', 'house', 'An Duong Vuong', 'TP Ho Chi Minh', 'TP.HCM', '700000', 75, 9500000000.00, 3, 2, 4, 0, 2016, 'available', 'Nha pho khu Hoa kieu.', 1, 0),
('Can Ho Gateway Thao Dien', 'apartment', 'Toa Madison Tang 16', 'TP Ho Chi Minh', 'TP.HCM', '700000', 118, 9250000000.00, 3, 2, 1, 1, 2017, 'available', 'Can ho 3PN.', 2, 0),
('Dat Nen Quan 9', 'land', 'Phuong Phuoc Long B', 'TP Ho Chi Minh', 'TP.HCM', '700000', 75, 4200000000.00, 0, 0, 0, 0, NULL, 'available', 'Dat nen so hong.', 24, 0),
('Biet Thu Saigon Pearl', 'villa', 'KDC Saigon Pearl', 'TP Ho Chi Minh', 'TP.HCM', '700000', 420, 75000000000.00, 6, 7, 3, 3, 2018, 'available', 'Biet thu penthouse.', 4, 1),
('Nha Mat Tien Tan Phuoc', 'house', 'Ly Thuong Kiet', 'TP Ho Chi Minh', 'TP.HCM', '700000', 85, 10800000000.00, 3, 2, 3, 1, 2017, 'available', 'Nha mat tien.', 11, 0),
('Can Ho Son Thinh 3', 'apartment', 'Toa ST3 Tang 25', 'Vung Tau', 'BR-VT', '790000', 68, 2850000000.00, 2, 2, 1, 1, 2019, 'available', 'Can ho view bien.', 19, 0),
('Shophouse Park Riverside', 'commercial', 'KDC Park Riverside', 'TP Ho Chi Minh', 'TP.HCM', '700000', 88, 9500000000.00, 0, 2, 4, 1, 2018, 'available', 'Shophouse Q9.', 9, 0),
('Nha Pho Vo Thi Sau', 'house', 'Vo Thi Sau Q3', 'TP Ho Chi Minh', 'TP.HCM', '700000', 100, 24500000000.00, 4, 4, 5, 1, 2019, 'available', 'Nha mat tien Q3.', 1, 1),
('Can Ho The Tresor', 'apartment', 'Toa TS Tang 28', 'TP Ho Chi Minh', 'TP.HCM', '700000', 88, 7450000000.00, 2, 2, 1, 1, 2017, 'available', 'Can ho cao cap.', 4, 0),
('Biet Thu Melosa Garden', 'villa', 'KDC Melosa Garden', 'TP Ho Chi Minh', 'TP.HCM', '700000', 150, 11500000000.00, 4, 3, 3, 2, 2019, 'available', 'Biet thu nha pho vuon.', 13, 0),
('Dat Nen Hoi An', 'land', 'Cam Chau', 'Hoi An', 'Quang Nam', '560000', 150, 7500000000.00, 0, 0, 0, 0, NULL, 'available', 'Dat nen Hoi An.', 15, 0),
('Can Ho Florita', 'apartment', 'Toa F Tang 10', 'TP Ho Chi Minh', 'TP.HCM', '700000', 68, 2950000000.00, 2, 2, 1, 1, 2017, 'available', 'Can ho Him Lam Q7.', 13, 0),
('Nha Mat Tien Le Van Sy', 'house', 'Le Van Sy Q3', 'TP Ho Chi Minh', 'TP.HCM', '700000', 95, 28500000000.00, 4, 4, 5, 1, 2018, 'available', 'Nha mat tien Q3.', 1, 1),
('Shophouse Lakeview City', 'commercial', 'KDC Lakeview City', 'TP Ho Chi Minh', 'TP.HCM', '700000', 105, 13500000000.00, 0, 2, 5, 1, 2019, 'available', 'Shophouse view ho.', 13, 0),
('Can Ho Hung Phat Silver Star', 'apartment', 'Toa S1 Tang 15', 'TP Ho Chi Minh', 'TP.HCM', '700000', 70, 3150000000.00, 2, 2, 1, 1, 2018, 'available', 'Can ho Nha Be.', 13, 0),
('Biet Thu Van Phuc City', 'villa', 'KDC Van Phuc City', 'TP Ho Chi Minh', 'TP.HCM', '700000', 220, 21500000000.00, 4, 4, 3, 2, 2019, 'available', 'Biet thu compound.', 19, 0),
('Can Ho Flora Anh Dao', 'apartment', 'Toa A Tang 8', 'TP Ho Chi Minh', 'TP.HCM', '700000', 56, 2250000000.00, 2, 1, 1, 0, 2017, 'available', 'Can ho gia re Q9.', 9, 0),
('Dat Nen Ha Noi', 'land', 'Huyen Dong Anh', 'Ha Noi', 'Ha Noi', '100000', 100, 6500000000.00, 0, 0, 0, 0, NULL, 'available', 'Dat nen ngoai thanh.', 18, 0),
('Lien Ke Gamuda', 'townhouse', 'KDT Gamuda Gardens', 'Ha Noi', 'Ha Noi', '100000', 110, 9800000000.00, 4, 3, 4, 1, 2019, 'available', 'Lien ke KDT hien dai.', 18, 0);

-- ================================================
-- Thêm Property Amenities
-- ================================================

INSERT INTO property_amenities (property_id, amenity) VALUES
(1, 'View Bien'), (1, 'Ho Boi Vo Cuc'), (1, 'Rap Chieu Phim'), (1, 'Ham Ruou'),
(2, 'View Thanh Pho'), (2, 'Concierge'), (2, 'Do Xe Valet'), (2, 'Thang May Rieng'),
(3, 'Ho Boi'), (3, 'Rap Phim'), (3, 'Ham Ruou'), (3, 'Phong Gym'),
(9, 'View Song'), (9, 'Concierge'), (9, 'Ho Boi'), (9, 'Gym'),
(22, 'View Bien'), (22, 'Ho Boi Rieng'), (22, 'BBQ'), (22, 'San Vuon');

-- ================================================
-- Thêm Favorites
-- ================================================

INSERT INTO favorites (user_id, property_id) VALUES
(3, 1), (3, 2), (3, 9), (3, 22),
(4, 1), (4, 3), (4, 6), (4, 9),
(5, 2), (5, 19), (5, 22), (5, 30),
(6, 4), (6, 5), (6, 7), (6, 8);

-- ================================================
-- Thêm Inquiries
-- ================================================

INSERT INTO inquiries (property_id, user_id, seller_id, subject, message, status) VALUES
(1, 3, 4, 'Dang ky xem nha', 'Toi muon xem biet thu nay vao cuoi tuan.', 'new'),
(2, 4, 1, 'Hoi gia', 'Gia nay co the thuong luong khong?', 'contacted'),
(3, 5, 2, 'Thong tin them', 'Cho toi biet them ve he thong smart home?', 'new'),
(9, 6, 5, 'Xem can ho', 'Toi muon xem can ho Vinhomes nay.', 'contacted'),
(22, 7, 19, 'Biet thu Phu Quoc', 'Cho thue theo ngay duoc khong?', 'new');

-- ================================================
-- Thêm Reviews
-- ================================================

INSERT INTO reviews (property_id, user_id, rating, comment) VALUES
(1, 3, 5, 'Biet thu tuyet voi! View bien dep khong the ta.'),
(2, 4, 5, 'Penthouse tot nhat TP.HCM!'),
(3, 5, 5, 'Dinh thu dep voi he thong smart home hien dai.'),
(9, 7, 5, 'Can ho Vinhomes rat tuyet! Tien ich day du.'),
(22, 9, 5, 'Biet thu bien hoan hao! Nghi duong tuyet voi.');

-- ================================================
-- Thêm Transactions
-- ================================================

INSERT INTO transactions (property_id, buyer_id, seller_id, sale_price, commission_rate, transaction_date, status, notes) VALUES
(26, 8, 11, 1650000000.00, 5.00, '2024-01-15', 'completed', 'Giao dich suon se.'),
(33, 9, 16, 9800000000.00, 5.00, '2024-02-01', 'pending', 'Dang cho hoan tat giay to.'),
(17, 10, 23, 4500000000.00, 5.00, '2024-03-01', 'completed', 'Giao dich nhanh gon.');

-- ================================================
-- Hiển thị tổng kết
-- ================================================

SELECT 'Da them du lieu mau thanh cong!' as Status;
SELECT 
    (SELECT COUNT(*) FROM users) as 'Nguoi dung',
    (SELECT COUNT(*) FROM sellers) as 'Moi gioi',
    (SELECT COUNT(*) FROM properties) as 'BDS',
    (SELECT COUNT(*) FROM property_amenities) as 'Tien ich',
    (SELECT COUNT(*) FROM favorites) as 'Yeu thich',
    (SELECT COUNT(*) FROM inquiries) as 'Yeu cau',
    (SELECT COUNT(*) FROM reviews) as 'Danh gia',
    (SELECT COUNT(*) FROM transactions) as 'Giao dich';