create database EduSys
go
if OBJECT_ID('NhanVien') is not null
drop table NhanVien
go
create table NhanVien (
MaNV nvarchar(50) not null,
MatKhau nvarchar(50) ,
Hoten nvarchar(50),
VaiTro Bit not null,
gmail nvarchar(50),
constraint pk_NhanVien primary key(MaNV )
)
if OBJECT_ID('ChuyenDe') is not null
 drop table ChuyenDe
 go 
 create table ChuyenDe(
 MaCD Nvarchar(10) not null,
 TenCD nvarchar(50)  not null,
 HocPhi Float not null,
 ThoiLuong int not null,
 Hinh nvarchar(50) not null,
 MoTa nvarchar(200) not null,
 constraint pk_ChuyenDe primary key(MaCD)
 )
 if OBJECT_ID('KhoaHoc') is not null
 drop table KhoaHoc
 go
 create table KhoaHoc(
 MaKH int IDENTITY(1,1) not null,
 MaCD Nvarchar(10) not null,
 HocPhi Float not null,
 ThoiLuong int not null,
 NgayKg date not null,
 GhiChu nvarchar(50) not null,
 MaNV nvarchar(50) not null,
 NgayTao Date not null,
 constraint pk_KhoaHoc primary key(MaKH),
 constraint fk_ChuyenDe_KhoaHoc foreign key(MaCD) references ChuyenDe on delete no action on update cascade,
 constraint fk_NhanVien_KhoaHoc foreign key(MaNV) references NhanVien on delete no action on update cascade,

 )
 if OBJECT_ID('NguoiHoc') is not null
 drop table NguoiHoc
 go
 create table NguoiHoc(
 MaNH nchar(7) not null,
 HoTen nvarchar(50) not null,
 NgaySinh date not null,
 GioiTinh Bit not null,
 DienThoai nvarchar(50) not null,
 Email Nvarchar(50) not null,
 Ghichu nvarchar(max) null,
 MaNV nvarchar(50) not null,
 NgayDK Date not null,
 constraint pk_NguoiHoc primary key( MaNH),
 Constraint fk_NhanVien_NguoiHoc foreign key(MaNV) references NhanVien on delete no action on update cascade,
 
 )
 if OBJECT_ID('HocVien') is not null 
 drop table HocVien
 go 
 create table HocVien(
 MaHV INT identity(1,1) not null, 
 MaKH INT  not null,
 MaNH nchar(7) not null,
 Diem Float not null,
 foreign key(MaNH) references NguoiHoc(MaNH) on delete no action on update cascade,
 foreign key(MaKH) references KhoaHoc(MaKH) on delete cascade on update no action,
 primary key (MaHV),
 )
select * from NhanVien
select * from ChuyenDe
select * from HocVien
select * from KhoaHoc
select * from NguoiHoc

delete from NhanVien
insert into NhanVien values(N'NV1',N'123',N'ngo ngoc anh','1',N'anhnnph11847@fpt.edu.vn')
insert into NhanVien values(N'NV2',N'123',N'ngo ngoc anh','0',N'anhnnph11847@fpt.edu.vn')
insert into NhanVien values(N'NV3',N'123',N'ngo ngoc anh','1',N'anhnnph11847@fpt.edu.vn')
insert into NhanVien values(N'NV4',N'123',N'ngo ngoc anh','0',N'anhnnph11847@fpt.edu.vn')

delete from ChuyenDe
delete from HocVien
delete from KhoaHoc
delete from NhanVien
delete from NguoiHoc

insert into ChuyenDe values (N'JAV01', N'Lập trình Java cơ bản', 300, 90, N'GAME.png', N'JAV01 - Lập trình Java cơ bản')
insert into ChuyenDe values (N'JAV02', N'Lập trình Java nâng cao', 300, 90, N'HTCS.jpg', N'JAV02 - Lập trình Java nâng cao')
insert into ChuyenDe values (N'PRO01', N'Dự án với công nghệ MS.NET MVC', 300, 90, N'MOWE.png', N'PRO01 - Dự án với công nghệ MS.NET MVC')
insert into ChuyenDe values (N'PRO02', N'Dự án với công nghệ Spring MVC', 300, 90, N'Subject.png', N'PRO02 - Dự án với công nghệ Spring MVC')
insert into ChuyenDe values (N'RDB01', N'Cơ sở dữ liệu SQL Server', 100, 50, N'MOWE.png', N'RDB01 - Cơ sở dữ liệu SQL Server')
insert into ChuyenDe values (N'RDB02', N'Lập trình JDBC', 150, 60, N'Subject.png', N'RDB02 - Lập trình JDBC')

SET IDENTITY_INSERT KhoaHoc ON 
INSERT KhoaHoc ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (1, N'JAV01', 300, 90, CAST(0xBF3D0B00 AS Date), N'', N'NV1', CAST(0xB53D0B00 AS Date))
INSERT KhoaHoc ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (2, N'JAV02', 300, 90, CAST(0xBF3D0B00 AS Date), N'', N'NV2', CAST(0xB53D0B00 AS Date))
INSERT KhoaHoc ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (3, N'RDB01', 100, 50, CAST(0xBF3D0B00 AS Date), N'', N'NV3', CAST(0xB53D0B00 AS Date))
INSERT KhoaHoc ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (4, N'JAV01', 250, 80, CAST(0xBF3D0B00 AS Date), N'', N'NV4', CAST(0xB53D0B00 AS Date))
SET IDENTITY_INSERT KhoaHoc OFF


INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS01638', N'LỮ HUY CƯỜNG', CAST(0xAF170B00 AS Date), 1, N'0928768265', N'PS01638@fpt.edu.vn', N'0928768265 - LỮ HUY CƯỜNG', N'NV1', CAST(0xAF170B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS02037', N'ĐỖ VĂN MINH', CAST(0xC6190B00 AS Date), 1, N'0968095685', N'PS02037@fpt.edu.vn', N'0968095685 - ĐỖ VĂN MINH', N'NV2', CAST(0xC6190B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS02771', N'NGUYỄN TẤN HIẾU', CAST(0x2E220B00 AS Date), 1, N'0927594734', N'PS02771@fpt.edu.vn', N'0927594734 - NGUYỄN TẤN HIẾU', N'NV1', CAST(0x2E220B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS02867', N'NGUYỄN HỮU TRÍ', CAST(0xEB200B00 AS Date), 1, N'0946984711', N'PS02867@fpt.edu.vn', N'0946984711 - NGUYỄN HỮU TRÍ', N'NV1', CAST(0xEB200B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS02930', N'TRẦN VĂN NAM', CAST(0xA1240B00 AS Date), 1, N'0924774498', N'PS02930@fpt.edu.vn', N'0924774498 - TRẦN VĂN NAM', N'NV1', CAST(0xA1240B00 AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS02979', N'ĐOÀN TRẦN NHẬT VŨ', CAST(0x671C0B00 AS Date), 1, N'0912374818', N'PS02979@fpt.edu.vn', N'0912374818 - ĐOÀN TRẦN NHẬT VŨ', N'NV1', CAST(0x671C0B00 AS Date))


SET IDENTITY_INSERT [dbo].[HocVien] ON 
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1, 2, N'PS01638', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (2, 2, N'PS02037', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (3, 2, N'PS02771', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (5, 2, N'PS02930', -1)
SET IDENTITY_INSERT [dbo].[HocVien] OFF