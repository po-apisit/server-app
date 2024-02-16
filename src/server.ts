import { Server as SocketIOServer, Socket } from 'socket.io';
import http from 'http'
import app from "./configuration";
import dotenv from 'dotenv';
const server = http.createServer(app);

dotenv.config();


const PORT = process.env.PORT || 4000

server.listen(PORT, () => {console.log("Server is running")})
