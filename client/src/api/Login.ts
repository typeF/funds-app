import axios from "axios";

const url = "http://localhost:8020/auth/login";

export default axios({
  method: "post",
  url,
  data: {
    email: "john@funds.com",
    password: "1"
  }
});
