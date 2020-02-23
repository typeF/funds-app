import axios from "axios";

const productionDomain = "https://production";
const local = "http://localhost:8020";
const baseURL = local;
const token = localStorage.getItem("token");

export default axios.create({
  baseURL,
  headers: { Authorization: `Bearer ${token}` }
});
