-- ================================================
-- Hệ Thống Quản Lý Bất Động Sản - Dữ Liệu Mẫu
-- Tiếng Việt có dấu + Tọa độ thực tế Việt Nam
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
-- Thêm Users (50 người dùng)
-- ================================================

INSERT INTO users (name, email, password, role, phone) VALUES
-- Admin accounts
('Quản Trị Viên', 'admin@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'admin', '0901234567'),
('Siêu Quản Trị', 'superadmin@example.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'admin', '0901234568'),

-- Regular users
('Nguyễn Văn An', 'nguyenvanan@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345001'),
('Trần Thị Bình', 'tranthihinh@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345002'),
('Lê Văn Cường', 'levancuong@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345003'),
('Phạm Thị Dung', 'phamthidung@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345004'),
('Hoàng Văn Em', 'hoangvanem@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345005'),
('Vũ Thị Phương', 'vuthiphuong@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345006'),
('Đặng Văn Giang', 'dangvangiang@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345007'),
('Bùi Thị Hoa', 'buithihoa@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345008'),
('Đinh Văn Khoa', 'dinhvankhoa@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345009'),
('Đỗ Thị Lan', 'dothilan@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345010'),
('Mai Văn Minh', 'maivanminh@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345011'),
('Ngô Thị Nga', 'ngothinga@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345012'),
('Phan Văn Oanh', 'phanvanoanh@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345013'),
('Trương Thị Phúc', 'truongthiphuc@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345014'),
('Lý Văn Quân', 'lyvanquan@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345015'),
('Võ Thị Rạng', 'vothirang@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345016'),
('Dương Văn Sơn', 'duongvanson@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345017'),
('Cao Thị Thảo', 'caothithao@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345018'),
('Tô Văn Uy', 'tovanuy@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345019'),
('Lương Thị Vân', 'luongthivan@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345020'),
('Hồ Văn Xuân', 'hovanxuan@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345021'),
('Thái Thị Yến', 'thaithiyen@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345022'),
('Quách Văn An', 'quachvanan@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345023'),
('Tạ Thị Bảo', 'tathibao@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345024'),
('Huỳnh Văn Cảnh', 'huynhvancanh@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345025'),
('Đoàn Thị Điểm', 'doanthidiem@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345026'),
('Từ Văn Đức', 'tuvanduc@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345027'),
('Ông Thị Hạnh', 'ongthihanh@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345028'),
('Phùng Văn Hải', 'phungvanhai@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345029'),
('Châu Thị Kim', 'chauthikim@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345030'),
('Lâm Văn Long', 'lamvanlong@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345031'),
('Triệu Thị Mai', 'trieuthimai@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345032'),
('Trịnh Văn Nam', 'trinhvannam@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345033'),
('Kim Thị Oanh', 'kimthioanh@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345034'),
('La Văn Phong', 'lavanphong@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345035'),
('Diên Thị Quỳnh', 'dienthiquynh@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345036'),
('Tăng Văn Sang', 'tangvansang@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345037'),
('Lưu Thị Trang', 'luuthitrang@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345038'),
('Hà Văn Ứng', 'havanunq@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345039'),
('Chu Thị Vũ', 'chuthivu@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345040'),
('Khúc Văn Vinh', 'khucvanvinh@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345041'),
('Ninh Thị Xuân', 'ninhthixuan@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345042'),
('Âu Văn Yên', 'auvanyen@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345043'),
('Ung Thị Ánh', 'ungthianh@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345044'),
('Nhâm Văn Bình', 'nhamvanbinh@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345045'),
('Lạc Thị Cúc', 'lacthicuc@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345046'),
('Thi Văn Duy', 'thivanduy@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345047'),
('Mã Thị Hằng', 'mathihang@gmail.com', '$2b$10$8l2K75553aYIhx7SyUAziu5oT78NlNhYSFeQTWSmt.jRCnU8pxEqy', 'user', '0912345048');

-- ================================================
-- Thêm Sellers - Môi giới (30 môi giới)
-- ================================================

INSERT INTO sellers (name, email, phone, company, address, website, license_number, rating, total_sales) VALUES
('Nguyễn Minh Tuấn', 'nguyen.tuan@batdongsan.vn', '0987654321', 'Tập Đoàn BĐS Minh Tuấn', '123 Nguyễn Huệ, Quận 1, TP.HCM', 'www.minhtuan-realestate.vn', 'BDS-HCM-001', 4.80, 45),
('Trần Hương Giang', 'tran.giang@nhadat.vn', '0987654322', 'Công Ty Nhà Đất Hương Giang', '456 Lê Lợi, Quận 1, TP.HCM', 'www.huonggiang-property.vn', 'BDS-HCM-002', 4.90, 52),
('Lê Quốc Bảo', 'le.bao@realty.vn', '0987654323', 'Bảo An Real Estate', '789 Trần Hưng Đạo, Quận 5, TP.HCM', 'www.baoan-realty.vn', 'BDS-HCM-003', 4.70, 38),
('Phạm Thanh Hà', 'pham.ha@luxury.vn', '0987654324', 'Luxury Homes Việt Nam', '100 Điện Biên Phủ, Quận 3, TP.HCM', 'www.luxuryhomes.vn', 'BDS-HCM-004', 4.90, 61),
('Hoàng Đức Long', 'hoang.long@vinhomes.vn', '0987654325', 'Vinhomes Real Estate', '200 Võ Văn Tần, Quận 3, TP.HCM', 'www.vinhomes-re.vn', 'BDS-HCM-005', 4.60, 33),
('Vũ Thị Mai', 'vu.mai@dreamhome.vn', '0987654326', 'Dream Home Property', '300 Nguyễn Thị Minh Khai, Quận 1, TP.HCM', 'www.dreamhome.vn', 'BDS-HCM-006', 4.80, 41),
('Đặng Văn Hùng', 'dang.hung@premier.vn', '0987654327', 'Premier Realty Việt Nam', '400 Pasteur, Quận 1, TP.HCM', 'www.premier-vn.com', 'BDS-HCM-007', 4.70, 36),
('Bùi Thu Hương', 'bui.huong@properties.vn', '0987654328', 'Thu Hương Properties', '500 Hai Bà Trưng, Quận 1, TP.HCM', 'www.thuhuong-prop.vn', 'BDS-HCM-008', 4.90, 48),
('Đinh Công Sơn', 'dinh.son@elite.vn', '0987654329', 'Elite Real Estate VN', '600 Lý Tự Trọng, Quận 1, TP.HCM', 'www.elite-re.vn', 'BDS-HCM-009', 4.80, 44),
('Đỗ Minh Phương', 'do.phuong@invest.vn', '0987654330', 'Phương Investment Group', '700 Nam Kỳ Khởi Nghĩa, Quận 1, TP.HCM', 'www.phuong-invest.vn', 'BDS-HCM-010', 4.60, 29),
('Mai Xuân Thành', 'mai.thanh@realty.vn', '0987654331', 'Xuân Thành Realty', '800 Cách Mạng Tháng 8, Quận 3, TP.HCM', 'www.xuanthanh-realty.vn', 'BDS-HCM-011', 4.70, 35),
('Ngô Thị Lan Anh', 'ngo.lananh@homes.vn', '0987654332', 'Lan Anh Home Solutions', '900 Võ Thị Sáu, Quận 3, TP.HCM', 'www.lananh-homes.vn', 'BDS-HCM-012', 4.90, 55),
('Phan Đức Minh', 'phan.minh@properties.vn', '0987654333', 'Đức Minh Properties LLC', '1000 Trường Sơn, Tân Bình, TP.HCM', 'www.ducminh-prop.vn', 'BDS-HCM-013', 4.80, 42),
('Trương Ngọc Hân', 'truong.han@realestate.vn', '0987654334', 'Ngọc Hân Real Estate Co', '1100 Hoàng Văn Thụ, Tân Bình, TP.HCM', 'www.ngochan-re.vn', 'BDS-HCM-014', 4.70, 37),
('Lý Thanh Tùng', 'ly.tung@luxury.vn', '0987654335', 'Thanh Tùng Luxury Living', '1200 Cộng Hòa, Tân Bình, TP.HCM', 'www.thanhtung-luxury.vn', 'BDS-HCM-015', 4.90, 50),
('Võ Hoài Thu', 'vo.thu@quality.vn', '0987654336', 'Quality Homes Việt Nam', '1300 Lạc Long Quân, Quận 11, TP.HCM', 'www.quality-homes.vn', 'BDS-HCM-016', 4.60, 31),
('Dương Quốc Tuấn', 'duong.tuan@services.vn', '0987654337', 'Quốc Tuấn Realty Services', '1400 Phan Văn Trị, Gò Vấp, TP.HCM', 'www.quoctuan-realty.vn', 'BDS-HCM-017', 4.80, 46),
('Cao Thị Bích', 'cao.bich@premier.vn', '0987654338', 'Bích Premier Properties', '1500 Quang Trung, Gò Vấp, TP.HCM', 'www.bich-properties.vn', 'BDS-HCM-018', 4.70, 39),
('Tô Văn Đạt', 'to.dat@estate.vn', '0987654339', 'Văn Đạt Estate Management', '1600 Phan Huy Ích, Tân Bình, TP.HCM', 'www.vandat-estate.vn', 'BDS-HCM-019', 4.90, 53),
('Lương Thị Ngọc', 'luong.ngoc@pros.vn', '0987654340', 'Ngọc Real Estate Pros', '1700 Nguyễn Oanh, Gò Vấp, TP.HCM', 'www.ngoc-repros.vn', 'BDS-HCM-020', 4.80, 43),
('Hồ Quang Minh', 'ho.minh@experts.vn', '0987654341', 'Quang Minh Home Experts', '1800 Phạm Văn Đồng, Thủ Đức, TP.HCM', 'www.quangminh-experts.vn', 'BDS-HCM-021', 4.70, 34),
('Thái Bảo Ngọc', 'thai.ngoc@luxury.vn', '0987654342', 'Bảo Ngọc Luxury Estates', '1900 Võ Văn Ngân, Thủ Đức, TP.HCM', 'www.baongoc-luxury.vn', 'BDS-HCM-022', 4.90, 57),
('Quách Minh Tâm', 'quach.tam@group.vn', '0987654343', 'Minh Tâm Property Group', '2000 Kha Vạn Cân, Thủ Đức, TP.HCM', 'www.minhtam-properties.vn', 'BDS-HCM-023', 4.60, 28),
('Tạ Thị Kim', 'ta.kim@associates.vn', '0987654344', 'Kim Realty Associates', '2100 Xa Lộ Hà Nội, Quận 2, TP.HCM', 'www.kim-realty.vn', 'BDS-HCM-024', 4.80, 40),
('Huỳnh Văn Thắng', 'huynh.thang@solutions.vn', '0987654345', 'Thắng Estate Solutions', '2200 Đỗ Xuân Hợp, Quận 9, TP.HCM', 'www.thang-estates.vn', 'BDS-HCM-025', 4.70, 32),
('Đoàn Thị Hồng', 'doan.hong@advisors.vn', '0987654346', 'Hồng Home Advisors', '2300 Lê Văn Việt, Quận 9, TP.HCM', 'www.hong-advisors.vn', 'BDS-HCM-026', 4.90, 49),
('Từ Quang Huy', 'tu.huy@partners.vn', '0987654347', 'Quang Huy Real Estate Partners', '2400 Nguyễn Duy Trinh, Quận 2, TP.HCM', 'www.quanghuy-partners.vn', 'BDS-HCM-027', 4.80, 47),
('Ông Thị Tuyết', 'ong.tuyet@network.vn', '0987654348', 'Tuyết Property Network', '2500 Trần Não, Quận 2, TP.HCM', 'www.tuyet-network.vn', 'BDS-HCM-028', 4.70, 36),
('Phùng Đức Thịnh', 'phung.thinh@luxury.vn', '0987654349', 'Đức Thịnh Luxury Realty', '2600 Mai Chí Thọ, Quận 2, TP.HCM', 'www.ducthinh-luxury.vn', 'BDS-HCM-029', 4.90, 54),
('Châu Minh Nhật', 'chau.nhat@group.vn', '0987654350', 'Minh Nhật Estate Group', '2700 Nguyễn Thị Định, Quận 2, TP.HCM', 'www.minhnhat-estates.vn', 'BDS-HCM-030', 4.80, 45);

-- ================================================
-- Thêm Properties - Bất động sản (100 BĐS)
-- Với tọa độ thực tế tại Việt Nam
-- ================================================

INSERT INTO properties (title, type, location, address, city, district, ward, state, zip_code, latitude, longitude, area, price, bedrooms, bathrooms, floors, garage, year_built, status, description, seller_id, is_featured) VALUES

-- ===================== HỒ CHÍ MINH =====================

-- Quận 1 - Trung tâm TP.HCM
('Penthouse Landmark 81 View Sông Sài Gòn', 'apartment', 'Tầng 75 Landmark 81, Bình Thạnh', '720A Điện Biên Phủ, Phường 22', 'Hồ Chí Minh', 'Bình Thạnh', 'Phường 22', 'TP.HCM', '700000', 10.7950, 106.7220, 420, 150000000000.00, 4, 5, 1, 2, 2019, 'available', 'Penthouse siêu sang tại tòa nhà biểu tượng TP.HCM, view 360 độ toàn thành phố và sông Sài Gòn.', 1, 1),

('Nhà Phố Mặt Tiền Nguyễn Huệ', 'house', '123 Nguyễn Huệ, Quận 1', '123 Nguyễn Huệ, Phường Bến Nghé', 'Hồ Chí Minh', 'Quận 1', 'Phường Bến Nghé', 'TP.HCM', '700000', 10.7735, 106.7019, 120, 85000000000.00, 4, 3, 5, 1, 2015, 'available', 'Nhà phố mặt tiền phố đi bộ Nguyễn Huệ, vị trí vàng trung tâm Quận 1, kinh doanh đắc địa.', 1, 1),

('Căn Hộ Saigon Royal Quận 4', 'apartment', '34-35 Bến Vân Đồn, Quận 4', 'Tầng 25, Tòa A, 34-35 Bến Vân Đồn', 'Hồ Chí Minh', 'Quận 4', 'Phường 12', 'TP.HCM', '700000', 10.7610, 106.7045, 88, 6500000000.00, 2, 2, 1, 1, 2018, 'available', 'Căn hộ cao cấp view sông Sài Gòn, nội thất nhập khẩu châu Âu, tiện ích 5 sao.', 4, 0),

('Officetel Masteri Millennium Quận 4', 'apartment', '132 Bến Vân Đồn, Quận 4', 'Tầng 12, Tòa B, 132 Bến Vân Đồn', 'Hồ Chí Minh', 'Quận 4', 'Phường 6', 'TP.HCM', '700000', 10.7590, 106.7025, 45, 3200000000.00, 1, 1, 1, 0, 2020, 'available', 'Officetel vừa ở vừa làm văn phòng, view Bitexco Financial Tower.', 1, 0),

-- Quận 2 - Thủ Thiêm, Thảo Điền
('Biệt Thự Thảo Điền Compound An Phú', 'villa', 'Compound An Phú, Thảo Điền', '15 Đường số 5, Thảo Điền', 'Hồ Chí Minh', 'Thủ Đức', 'Thảo Điền', 'TP.HCM', '700000', 10.8030, 106.7350, 450, 55000000000.00, 6, 6, 2, 3, 2021, 'available', 'Biệt thự trong compound an ninh 24/7, hồ bơi riêng, sân vườn rộng, gần trường quốc tế.', 2, 1),

('Căn Hộ Vinhomes Central Park Landmark 2', 'apartment', 'Vinhomes Central Park, Bình Thạnh', 'Tầng 25, Tòa Landmark 2, Vinhomes Central Park', 'Hồ Chí Minh', 'Bình Thạnh', 'Phường 22', 'TP.HCM', '700000', 10.7935, 106.7215, 100, 6500000000.00, 2, 2, 1, 1, 2019, 'available', 'Căn hộ cao cấp view sông Sài Gòn và công viên 14ha, đầy đủ tiện ích đẳng cấp.', 5, 1),

('Căn Hộ Masteri Thảo Điền', 'apartment', 'Masteri Thảo Điền, Quận 2', 'Tầng 18, Tòa T5, 159 Xa Lộ Hà Nội', 'Hồ Chí Minh', 'Thủ Đức', 'Thảo Điền', 'TP.HCM', '700000', 10.8020, 106.7420, 75, 4800000000.00, 2, 2, 1, 1, 2018, 'available', 'Căn hộ hiện đại tại khu Thảo Điền sầm uất, gần Metro, tiện ích đầy đủ.', 2, 0),

('Biệt Thự Sala Đại Quang Minh', 'villa', 'Khu đô thị Sala, Quận 2', '25 Đường Sala, Khu đô thị Sala', 'Hồ Chí Minh', 'Thủ Đức', 'An Lợi Đông', 'TP.HCM', '700000', 10.7720, 106.7520, 350, 42000000000.00, 5, 5, 3, 3, 2020, 'available', 'Biệt thự đơn lập khu Sala cao cấp, thiết kế sang trọng, an ninh tuyệt đối.', 2, 1),

('Căn Hộ Estella Heights Quận 2', 'apartment', 'Estella Heights, Quận 2', 'Tầng 15, Tòa T1, 88 Song Hành', 'Hồ Chí Minh', 'Thủ Đức', 'An Phú', 'TP.HCM', '700000', 10.7980, 106.7480, 105, 7200000000.00, 2, 2, 1, 1, 2019, 'available', 'Căn hộ 2PN+1 view hồ bơi và sông, nội thất cao cấp Kohler, Bosch.', 2, 0),

('Nhà Phố Thảo Điền Village', 'house', 'Thảo Điền, Quận 2', '45 Nguyễn Văn Hưởng, Thảo Điền', 'Hồ Chí Minh', 'Thủ Đức', 'Thảo Điền', 'TP.HCM', '700000', 10.8050, 106.7380, 200, 25000000000.00, 4, 4, 3, 2, 2018, 'available', 'Nhà phố khu Thảo Điền yên tĩnh, gần trường quốc tế, thiết kế hiện đại.', 2, 0),

-- Quận 3
('Căn Hộ Serenity Sky Villas Quận 3', 'apartment', '259 Điện Biên Phủ, Quận 3', 'Tầng 20, 259 Điện Biên Phủ', 'Hồ Chí Minh', 'Quận 3', 'Phường 7', 'TP.HCM', '700000', 10.7850, 106.6920, 150, 25000000000.00, 3, 3, 1, 2, 2019, 'available', 'Sky Villa siêu sang có hồ bơi riêng trên không, view toàn thành phố.', 4, 1),

('Nhà Mặt Tiền Võ Thị Sáu Quận 3', 'house', '100 Võ Thị Sáu, Quận 3', '100 Võ Thị Sáu, Phường 7', 'Hồ Chí Minh', 'Quận 3', 'Phường 7', 'TP.HCM', '700000', 10.7890, 106.6890, 95, 28500000000.00, 4, 4, 5, 1, 2018, 'available', 'Nhà mặt tiền đường lớn Quận 3, vị trí kinh doanh đắc địa.', 1, 1),

-- Quận 7 - Phú Mỹ Hưng
('Biệt Thự Phú Mỹ Hưng View Sông', 'villa', 'Khu Cảnh Đồi, Phú Mỹ Hưng', '88 Đường số 6, Khu Cảnh Đồi', 'Hồ Chí Minh', 'Quận 7', 'Tân Phú', 'TP.HCM', '700000', 10.7290, 106.7100, 500, 65000000000.00, 6, 7, 3, 3, 2020, 'available', 'Biệt thự view sông tại khu Cảnh Đồi cao cấp, sân golf mini, hồ bơi.', 4, 1),

('Căn Hộ Sunrise City Quận 7', 'apartment', 'Sunrise City, Quận 7', 'Tầng 25, Tòa V5, Sunrise City', 'Hồ Chí Minh', 'Quận 7', 'Tân Hưng', 'TP.HCM', '700000', 10.7350, 106.7150, 98, 5500000000.00, 2, 2, 1, 1, 2019, 'available', 'Căn hộ view hồ bơi và công viên Sunrise, nội thất đầy đủ cao cấp.', 9, 0),

('Shophouse Midtown Phú Mỹ Hưng', 'commercial', 'Midtown, Phú Mỹ Hưng', '15 Đường M2, Midtown', 'Hồ Chí Minh', 'Quận 7', 'Tân Phong', 'TP.HCM', '700000', 10.7310, 106.7180, 200, 35000000000.00, 0, 3, 5, 2, 2020, 'available', 'Shophouse mặt tiền 5 tầng tại Midtown sầm uất, kinh doanh đắc địa.', 13, 1),

('Căn Hộ Sky Garden 3 Quận 7', 'apartment', 'Sky Garden 3, Phú Mỹ Hưng', 'Tầng 12, Block A, Sky Garden 3', 'Hồ Chí Minh', 'Quận 7', 'Tân Phong', 'TP.HCM', '700000', 10.7320, 106.7120, 68, 3200000000.00, 2, 2, 1, 1, 2016, 'available', 'Căn hộ 2PN full nội thất, view công viên, tiện ích đầy đủ.', 13, 0),

-- Quận 9 - Quận 9 cũ (nay là TP.Thủ Đức)
('Biệt Thự Vinhomes Grand Park', 'villa', 'Vinhomes Grand Park, Quận 9', '15 Đường số 1, Vinhomes Grand Park', 'Hồ Chí Minh', 'Thủ Đức', 'Long Bình', 'TP.HCM', '700000', 10.8450, 106.8350, 250, 18500000000.00, 4, 4, 3, 2, 2021, 'available', 'Biệt thự trong siêu đô thị 271ha, công viên 36ha, hồ bơi, sân golf.', 5, 1),

('Căn Hộ Vinhomes Grand Park The Rainbow', 'apartment', 'The Rainbow, Vinhomes Grand Park', 'Tầng 18, Tòa R1, Vinhomes Grand Park', 'Hồ Chí Minh', 'Thủ Đức', 'Long Thạnh Mỹ', 'TP.HCM', '700000', 10.8470, 106.8380, 69, 2850000000.00, 2, 2, 1, 1, 2021, 'available', 'Căn hộ 2PN view công viên 36ha, tiện ích đầy đủ, gần Metro.', 5, 0),

('Căn Hộ Safira Khang Điền Quận 9', 'apartment', 'Safira Khang Điền, Quận 9', 'Tầng 15, Block B, Safira', 'Hồ Chí Minh', 'Thủ Đức', 'Phú Hữu', 'TP.HCM', '700000', 10.8280, 106.8150, 67, 2650000000.00, 2, 2, 1, 1, 2020, 'available', 'Căn hộ view sông, nội thất cơ bản, gần Vincity Grand Park.', 9, 0),

-- Bình Thạnh
('Căn Hộ The Manor Bình Thạnh', 'apartment', 'The Manor, Bình Thạnh', 'Tầng 20, Tòa B, 91 Nguyễn Hữu Cảnh', 'Hồ Chí Minh', 'Bình Thạnh', 'Phường 22', 'TP.HCM', '700000', 10.7920, 106.7180, 125, 8500000000.00, 3, 2, 1, 1, 2015, 'available', 'Căn hộ 3PN view sông, nội thất cao cấp, tiện ích đầy đủ.', 4, 0),

('Nhà Phố Bình Thạnh Gần Landmark', 'house', 'Phường 22, Bình Thạnh', '55 Đường số 1, Phường 22', 'Hồ Chí Minh', 'Bình Thạnh', 'Phường 22', 'TP.HCM', '700000', 10.7940, 106.7200, 85, 12500000000.00, 4, 3, 4, 1, 2019, 'available', 'Nhà phố mới xây gần Landmark 81, thiết kế hiện đại.', 16, 0),

-- Gò Vấp
('Căn Hộ Cityland Park Hills Gò Vấp', 'apartment', 'Cityland Park Hills, Gò Vấp', 'Tầng 10, Block P1, Cityland', 'Hồ Chí Minh', 'Gò Vấp', 'Phường 10', 'TP.HCM', '700000', 10.8380, 106.6650, 75, 3200000000.00, 2, 2, 1, 1, 2019, 'available', 'Căn hộ view công viên, an ninh 24/7, tiện ích đầy đủ.', 17, 0),

('Nhà Phố Phan Văn Trị Gò Vấp', 'house', '123 Phan Văn Trị, Gò Vấp', '123 Phan Văn Trị, Phường 11', 'Hồ Chí Minh', 'Gò Vấp', 'Phường 11', 'TP.HCM', '700000', 10.8350, 106.6680, 80, 7200000000.00, 3, 2, 3, 0, 2016, 'available', 'Nhà 1 trệt 2 lầu, mặt tiền đường lớn, tiện kinh doanh.', 17, 0),

-- Tân Bình
('Căn Hộ Kingston Residence Tân Bình', 'apartment', 'Kingston Residence, Tân Bình', 'Tầng 15, 146 Nguyễn Văn Trỗi', 'Hồ Chí Minh', 'Tân Bình', 'Phường 8', 'TP.HCM', '700000', 10.8020, 106.6720, 82, 4800000000.00, 2, 2, 1, 1, 2018, 'available', 'Căn hộ gần sân bay, view đẹp, nội thất cao cấp.', 7, 0),

('Nhà Mặt Tiền Hoàng Văn Thụ Tân Bình', 'house', '456 Hoàng Văn Thụ, Tân Bình', '456 Hoàng Văn Thụ, Phường 4', 'Hồ Chí Minh', 'Tân Bình', 'Phường 4', 'TP.HCM', '700000', 10.8000, 106.6650, 110, 18500000000.00, 4, 4, 5, 1, 2017, 'available', 'Nhà mặt tiền đường lớn gần sân bay, kinh doanh đắc địa.', 7, 0),

-- Tân Phú
('Căn Hộ Celadon City Tân Phú', 'apartment', 'Celadon City, Tân Phú', 'Tầng 12, Block D, Celadon City', 'Hồ Chí Minh', 'Tân Phú', 'Sơn Kỳ', 'TP.HCM', '700000', 10.8010, 106.6180, 72, 3150000000.00, 2, 2, 1, 1, 2020, 'available', 'Căn hộ trong đô thị sinh thái lớn nhất Tân Phú, không khí trong lành.', 7, 0),

-- Bình Tân
('Căn Hộ Aio City Bình Tân', 'apartment', 'Aio City, Bình Tân', 'Tầng 8, Block A, Aio City', 'Hồ Chí Minh', 'Bình Tân', 'An Lạc', 'TP.HCM', '700000', 10.7450, 106.6120, 55, 1850000000.00, 2, 1, 1, 0, 2021, 'available', 'Căn hộ giá tốt cho gia đình trẻ, gần Aeon Mall.', 11, 0),

('Nhà Phố Bình Tân Gần Metro', 'house', 'Đường An Dương Vương, Bình Tân', '789 An Dương Vương', 'Hồ Chí Minh', 'Bình Tân', 'An Lạc A', 'TP.HCM', '700000', 10.7480, 106.6080, 85, 6500000000.00, 3, 2, 3, 1, 2018, 'available', 'Nhà phố gần trạm Metro, tiện di chuyển, khu dân cư an ninh.', 11, 0),

-- Nhà Bè
('Căn Hộ Sunrise Riverside Nhà Bè', 'apartment', 'Sunrise Riverside, Nhà Bè', 'Tầng 15, Block G2, Sunrise Riverside', 'Hồ Chí Minh', 'Nhà Bè', 'Phước Kiển', 'TP.HCM', '700000', 10.7180, 106.7320, 70, 2950000000.00, 2, 2, 1, 1, 2019, 'available', 'Căn hộ view sông, không gian xanh, không khí trong lành.', 13, 0),

-- ===================== HÀ NỘI =====================

-- Quận Hoàn Kiếm
('Nhà Mặt Tiền Phố Cổ Hàng Bạc', 'house', '88 Hàng Bạc, Hoàn Kiếm', '88 Hàng Bạc, Phường Hàng Bạc', 'Hà Nội', 'Hoàn Kiếm', 'Hàng Bạc', 'Hà Nội', '100000', 21.0335, 105.8530, 65, 45000000000.00, 3, 2, 4, 0, 1990, 'available', 'Nhà phố cổ Hà Nội, vị trí đắc địa, phù hợp kinh doanh du lịch.', 18, 1),

-- Quận Ba Đình
('Căn Hộ Vinhomes Metropolis Ba Đình', 'apartment', 'Vinhomes Metropolis, Ba Đình', 'Tầng 30, Tòa M1, 29 Liễu Giai', 'Hà Nội', 'Ba Đình', 'Ngọc Khánh', 'Hà Nội', '100000', 21.0310, 105.8150, 120, 12500000000.00, 3, 2, 1, 1, 2019, 'available', 'Căn hộ cao cấp view Hồ Tây và lăng Bác, tiện ích 5 sao.', 18, 1),

-- Quận Tây Hồ
('Biệt Thự View Hồ Tây', 'villa', '10 Đường Thanh Niên, Tây Hồ', '10 Đường Thanh Niên, Quảng An', 'Hà Nội', 'Tây Hồ', 'Quảng An', 'Hà Nội', '100000', 21.0520, 105.8280, 400, 85000000000.00, 5, 6, 3, 3, 2018, 'available', 'Biệt thự mặt tiền view Hồ Tây, kiến trúc Pháp cổ điển, sân vườn rộng.', 18, 1),

('Căn Hộ Sun Grand City Thụy Khuê', 'apartment', 'Sun Grand City, Tây Hồ', 'Tầng 25, Tòa S1, 69 Thụy Khuê', 'Hà Nội', 'Tây Hồ', 'Thụy Khuê', 'Hà Nội', '100000', 21.0450, 105.8200, 95, 7500000000.00, 2, 2, 1, 1, 2020, 'available', 'Căn hộ view Hồ Tây, nội thất cao cấp, tiện ích đầy đủ.', 18, 0),

-- Quận Cầu Giấy
('Căn Hộ Vinhomes D.Capitale Cầu Giấy', 'apartment', 'Vinhomes D.Capitale, Cầu Giấy', 'Tầng 20, Tòa C7, Vinhomes D.Capitale', 'Hà Nội', 'Cầu Giấy', 'Trung Hòa', 'Hà Nội', '100000', 21.0150, 105.7950, 85, 5500000000.00, 2, 2, 1, 1, 2019, 'available', 'Căn hộ view công viên, gần trung tâm thương mại, tiện ích đầy đủ.', 18, 0),

-- Quận Nam Từ Liêm
('Biệt Thự Vinhomes The Harmony', 'villa', 'Vinhomes The Harmony, Nam Từ Liêm', '55 Đường số 3, Vinhomes The Harmony', 'Hà Nội', 'Nam Từ Liêm', 'Phúc Đồng', 'Hà Nội', '100000', 20.9950, 105.7550, 280, 25000000000.00, 5, 5, 3, 2, 2020, 'available', 'Biệt thự đơn lập trong khu đô thị đẳng cấp, an ninh 24/7.', 18, 0),

-- Quận Đống Đa
('Nhà Phố Tây Sơn Đống Đa', 'house', '123 Tây Sơn, Đống Đa', '123 Tây Sơn, Phường Trung Liệt', 'Hà Nội', 'Đống Đa', 'Trung Liệt', 'Hà Nội', '100000', 21.0120, 105.8220, 75, 12000000000.00, 4, 3, 4, 0, 2015, 'available', 'Nhà phố mặt tiền gần Đại học Thủy Lợi, tiện kinh doanh.', 18, 0),

-- Quận Long Biên
('Căn Hộ Vinhomes Riverside Long Biên', 'apartment', 'Vinhomes Riverside, Long Biên', 'Tầng 18, Tòa The Sapphire', 'Hà Nội', 'Long Biên', 'Phúc Đồng', 'Hà Nội', '100000', 21.0580, 105.9120, 110, 6500000000.00, 3, 2, 1, 1, 2018, 'available', 'Căn hộ trong khu đô thị sinh thái ven sông Hồng, view golf course.', 18, 0),

('Biệt Thự Vinhomes Riverside Hoa Lan', 'villa', 'Khu Hoa Lan, Vinhomes Riverside', '15 Đường Hoa Lan, Vinhomes Riverside', 'Hà Nội', 'Long Biên', 'Việt Hưng', 'Hà Nội', '100000', 21.0620, 105.9080, 350, 32000000000.00, 5, 5, 3, 3, 2016, 'available', 'Biệt thự song lập view sông Hồng, sân vườn rộng, hồ bơi.', 18, 1),

-- Hà Đông
('Căn Hộ Vinhomes Smart City', 'apartment', 'Vinhomes Smart City, Hà Đông', 'Tầng 22, Tòa S2, Vinhomes Smart City', 'Hà Nội', 'Hà Đông', 'Đại Mỗ', 'Hà Nội', '100000', 20.9880, 105.7450, 72, 3200000000.00, 2, 2, 1, 1, 2021, 'available', 'Căn hộ trong đại đô thị thông minh, tiện ích đầy đủ, gần Metro.', 18, 0),

('Liền Kề Gamuda Gardens', 'townhouse', 'Gamuda Gardens, Hoàng Mai', 'ST5, Gamuda Gardens', 'Hà Nội', 'Hoàng Mai', 'Yên Sở', 'Hà Nội', '100000', 20.9750, 105.8650, 120, 12500000000.00, 4, 4, 4, 1, 2019, 'available', 'Liền kề trong khu đô thị sinh thái, công viên rộng, hồ điều hòa.', 18, 0),

-- ===================== ĐÀ NẴNG =====================

('Biệt Thự Biển The Point Đà Nẵng', 'villa', 'The Point, Ngũ Hành Sơn', '88 Võ Nguyên Giáp, Phước Mỹ', 'Đà Nẵng', 'Ngũ Hành Sơn', 'Phước Mỹ', 'Đà Nẵng', '550000', 16.0470, 108.2450, 300, 35000000000.00, 5, 5, 2, 2, 2020, 'available', 'Biệt thự mặt biển Mỹ Khê, hồ bơi vô cực, nội thất cao cấp.', 15, 1),

('Căn Hộ Azura Sơn Trà', 'apartment', 'Azura, Sơn Trà', 'Tầng 25, Tòa A, 01 Trần Hưng Đạo', 'Đà Nẵng', 'Sơn Trà', 'An Hải Tây', 'Đà Nẵng', '550000', 16.0750, 108.2280, 85, 4500000000.00, 2, 2, 1, 1, 2019, 'available', 'Căn hộ view biển và sông Hàn, nội thất cao cấp.', 15, 0),

('Căn Hộ Monarchy Đà Nẵng', 'apartment', 'Monarchy, Sơn Trà', 'Tầng 18, Block B, 4 Trần Hưng Đạo', 'Đà Nẵng', 'Sơn Trà', 'An Hải Tây', 'Đà Nẵng', '550000', 16.0720, 108.2320, 75, 3200000000.00, 2, 2, 1, 1, 2020, 'available', 'Căn hộ view sông Hàn, hồ bơi vô cực trên tầng thượng.', 15, 0),

('Nhà Phố Hải Châu Đà Nẵng', 'house', '45 Nguyễn Văn Linh, Hải Châu', '45 Nguyễn Văn Linh, Nam Dương', 'Đà Nẵng', 'Hải Châu', 'Nam Dương', 'Đà Nẵng', '550000', 16.0620, 108.2120, 120, 15000000000.00, 4, 3, 4, 1, 2018, 'available', 'Nhà phố trung tâm thành phố, gần chợ Hàn, tiện kinh doanh.', 15, 0),

('Đất Nền Hòa Xuân Đà Nẵng', 'land', 'Khu đô thị Hòa Xuân, Cẩm Lệ', 'Lô B25, Khu đô thị Hòa Xuân', 'Đà Nẵng', 'Cẩm Lệ', 'Hòa Xuân', 'Đà Nẵng', '550000', 16.0180, 108.2050, 100, 4500000000.00, 0, 0, 0, 0, NULL, 'available', 'Đất nền khu đô thị mới, hạ tầng hoàn thiện, view sông Cổ Cò.', 15, 0),

-- ===================== NHA TRANG =====================

('Biệt Thự Biển Vinpearl Nha Trang', 'villa', 'Vinpearl Nha Trang, Hòn Tre', 'Villa B05, Vinpearl Resort', 'Nha Trang', 'Vĩnh Nguyên', 'Hòn Tre', 'Khánh Hòa', '650000', 12.2130, 109.2480, 350, 45000000000.00, 4, 5, 2, 2, 2019, 'available', 'Biệt thự nghỉ dưỡng mặt biển, có hồ bơi riêng, tiện ích 5 sao.', 4, 1),

('Căn Hộ Gold Coast Nha Trang', 'apartment', 'Gold Coast, Trần Phú', 'Tầng 35, Tòa B, 01 Trần Hưng Đạo', 'Nha Trang', 'Lộc Thọ', 'Phường Lộc Thọ', 'Khánh Hòa', '650000', 12.2450, 109.1950, 75, 3500000000.00, 2, 2, 1, 1, 2019, 'available', 'Căn hộ view biển 180 độ, ngay trung tâm thành phố.', 19, 0),

('Căn Hộ Scenia Bay Nha Trang', 'apartment', 'Scenia Bay, Phạm Văn Đồng', 'Tầng 22, 02 Phạm Văn Đồng', 'Nha Trang', 'Vĩnh Hòa', 'Vĩnh Hòa', 'Khánh Hòa', '650000', 12.2680, 109.2020, 60, 2500000000.00, 1, 1, 1, 0, 2020, 'available', 'Căn hộ condotel view biển, quản lý bởi tập đoàn quốc tế.', 19, 0),

('Đất Nền Bãi Dài Cam Ranh', 'land', 'Bãi Dài, Cam Ranh', 'Lô A15, Khu du lịch Bãi Dài', 'Cam Ranh', 'Cam Hải Đông', 'Xã Cam Hải Đông', 'Khánh Hòa', '650000', 11.9850, 109.1720, 200, 8500000000.00, 0, 0, 0, 0, NULL, 'available', 'Đất nền view biển Bãi Dài, gần sân bay Cam Ranh.', 19, 0),

-- ===================== PHÚ QUỐC =====================

('Biệt Thự Biển Sunset Sanato', 'villa', 'Sunset Sanato, Dương Tơ', 'Villa 15, Sunset Sanato Resort', 'Phú Quốc', 'Dương Tơ', 'Xã Dương Tơ', 'Kiên Giang', '920000', 10.2120, 103.9580, 280, 28000000000.00, 4, 4, 2, 2, 2020, 'available', 'Biệt thự view hoàng hôn Sunset Sanato, hồ bơi riêng, nội thất cao cấp.', 19, 1),

('Condotel Premier Residences Phú Quốc', 'apartment', 'Premier Residences, Bãi Dài','Tầng 20, Tòa A, Premier Residences', 'Phú Quốc', 'Gành Dầu', 'Bãi Dài', 'Kiên Giang', '920000', 10.2200, 103.9500, 65, 3500000000.00, 1, 1, 1, 0, 2019, 'available', 'Căn hộ condotel view biển Bãi Dài, tiện ích đầy đủ.', 19, 0),

('Căn Hộ Vinpearl Condotel Phú Quốc', 'apartment', 'Vinpearl Condotel, Gành Dầu', 'Tầng 25, Tòa B, Vinpearl Resort', 'Phú Quốc', 'Gành Dầu', 'Xã Gành Dầu', 'Kiên Giang', '920000', 10.2300, 103.9400, 70, 3200000000.00, 2, 2, 1, 1, 2020, 'available', 'Căn hộ condotel trong khu nghỉ dưỡng đẳng cấp quốc tế.', 19, 0),

('Đất Nền Khu Đô Thị An Thới Phú Quốc', 'land', 'Khu đô thị An Thới, Phú Quốc', 'Lô C10, Khu đô thị An Thới', 'Phú Quốc', 'An Thới', 'Xã An Thới', 'Kiên Giang', '920000', 10.1500, 103.9000, 150, 4500000000.00, 0, 0, 0, 0, NULL, 'available', 'Đất nền khu đô thị mới An Thới gần bãi biển đẹp nhất Phú Quốc.', 19, 0);