use QL_RapChieuPhim;
-- 1. Lấy thông tin tất cả các bộ phim của một diễn viên cụ thể
-- 2. Lấy danh sách các bộ phim chiếu vào ngày cụ thể
-- 3. Lấy danh sách số phòng, ghế, thời gian đặt và tên bộ phim mà 1 tài khoản cụ thể đã đặt

Select TaiKhoan.ID, TaiKhoan.Ten, CONCAT( Ghe.SoHang, Ghe.SoGhe) as 'So Ghe',Phong.ID as'So Phong', ThoiGian.TGBatDau as 'TG bat dau chieu'
from TaiKhoan
Inner join VeDat on TaiKhoan.ID=VeDat.TaiKhoan_id
inner join ThoiGian on ThoiGian.ID=VeDat.ThoiGian_id
inner join Phong on Phong.ID=ThoiGian.Phong_id
inner join Ghe on Ghe.Phong_id=Phong.ID
inner join VeDat_Ghe on VeDat_Ghe.Ghe_id=Ghe.ID
Where TaiKhoan.Ten='Davis'; 

select  Phim.ID, Phim.Ten as'Ten phim', TheLoai.Ten as 'Loai Phim', DienVien.Ten as 'Ten Dien Vien'
from Phim
inner join Phim_TheLoai on Phim_TheLoai.Phim_id = Phim.ID
inner join TheLoai on Phim_TheLoai.TheLoai_id= TheLoai.ID
inner join DienVien_TheLoai on DienVien_TheLoai.TheLoai_id=TheLoai.ID
inner join DienVien on DienVien_TheLoai.DienVien_id-DienVien.ID
where Phim.ID =8;




