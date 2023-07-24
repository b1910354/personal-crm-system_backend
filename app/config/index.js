const Sequelize = require("sequelize");

const config = {
  app: {
    port: process.env.PORT || 3000,
  },
};

// Khởi tạo kết nối database
const sequelize = new Sequelize("personal_crm_system_5", "root", "Quyber2015", {
  host: "localhost",
  dialect: "mysql",
  // port: 6000,
});

/**
 *    
    "personal_crm_system_2": Đây là tên cơ sở dữ liệu mà bạn muốn kết nối đến hoặc tạo (nếu chưa tồn tại). 
     -> Trong trường hợp này, tên cơ sở dữ liệu là "personal_crm_system_2".

    "root": Đây là tên người dùng MySQL mà bạn sử dụng để truy cập vào cơ sở dữ liệu. 
     -> Trong trường hợp này, tên người dùng là "root".

    "Phuc#0122": Đây là mật khẩu của người dùng MySQL được sử dụng để xác thực quyền truy cập vào cơ sở dữ liệu. 
     -> Trong trường hợp này, mật khẩu là "Phuc#0122". Lưu ý rằng đoạn mã hiển thị mật khẩu của bạn, nhưng trong thực tế, 
        bạn nên tránh hiển thị mật khẩu công khai như vậy.

    "localhost": Đây là địa chỉ máy chủ MySQL. 
     -> Trong trường hợp này, máy chủ MySQL đang chạy trên cùng máy tính mà ứng dụng Node.js của bạn đang chạy, 
        nên bạn sử dụng "localhost" để chỉ đến máy chủ cục bộ.

    "mysql": Đây là loại cơ sở dữ liệu mà Sequelize sẽ sử dụng. 
     -> Trong trường hợp này, loại cơ sở dữ liệu là "mysql".

    port: 6000: Đây là số cổng kết nối của MySQL. 
     -> Trong trường hợp này, số cổng là 6000. Mặc định, MySQL sử dụng cổng 3306, 
        vì vậy bạn cần chắc chắn rằng cổng 6000 đã được cấu hình đúng cho cài đặt MySQL của bạn.
 * 
 */


// connect to the database
const connection = async () => {
  try {
    await sequelize.authenticate();
    console.log("Connection has been established successfully.");
  } catch (error) {
    console.error("Unable to connect to the database:", error);
  }
};

// auto create table
const createTable = () => {
  try {
    sequelize.sync();
    console.log("Tables created successfully");
  } catch (error) {
    console.error("Error creating tables:", error);
  }
};

module.exports = { config, connection, sequelize, createTable };
