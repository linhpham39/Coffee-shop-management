# Các chức năng đã làm
1.  order: thêm/ xóa order
- hiện các sản phẩm có trong 1 order
- khi thêm 1 orderline thì tự động cập nhật total price
- thao tác với order: tính doanh thu từ ngày a -> ngày b

2. customers
- đăng kí tài khoản
- login
-  đổi mật khẩu
- cập nhật lại rank khi insert data và khi order

3. products
- hiện ra recipe của từng product
- 

# Chưa làm
- tính lợi nhuận từ ngày a đến ngày b           => done
- xóa tài khoản
- fix lỗi hàm post, put của products            => done
- tạo các hàm với orderlines
- tạo các hàm với recipes
- bị lỗi khi insert orderlines có product_id = HC001, tính total_price bị sai, delete orderlines bị tính sai total_price
- Phân quyền admin, employee, customers bằng create view 
