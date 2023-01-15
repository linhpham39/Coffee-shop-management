﻿# Coffee-shop-management
# Coffee-shop-management
# để chạy được chương trình => cài nodejs. cài thêm postMan
- sau đó pull code từ github về. Mở terminal gõ "npm install"
- cài thư viện Express => gõ ở terminal "npm i --save express"
- file server.js: máy sẽ chạy file này và chạy ở link: "localhost:8000" 

# Route.js:
- định nghĩa các tuyến đường, ví dụ: router.get('/abc', controller.X) => khi nào đường link rơi vào localhost:8000/abc thì sẽ dùng hàm controller.X để xử lí.

# Controller.js
- Dùng để viết các hàm xử lí khi rơi vào các tuyến đường nào trong route.js
- biến pool là biến lưu các câu query (được xử lí ở file queries.js) 
- ví dụ: const getEmployees = (req, res) => {
      pool.query(queries.getEmployees, (error, results) =>{
          if(error) throw error;
          res.status(200).json(results.rows);
         });
        }
 - req: request- là yêu cầu mà mình gửi lên server
 - res: là response mà server trả về cho mình
 - queries.getEmployees = 'SELECT * FROM employees'  (viết ở file queries.js)
 - hàm pool.query truyền vào 2 tham số: câu query và 1 hàm có biến error và results. Nếu thực thi câu query thất bại trả giá trị cho biến error. Nếu thành công server trả res(respone) về cho mình
.json() : chuyển cái trả về dưới dạng json. results.rows: trả về các hàng của kết quả nhận đc

# queries.js: lưu trữ các câu query để dùng cho hàm xử lí tại controller.js
