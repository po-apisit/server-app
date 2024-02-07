import app from "./configuration";
import dotenv from 'dotenv';
dotenv.config();
const server = app;
const PORT = process.env.PORT || 4000
server.listen(PORT, () => {console.log("Server is running")})
