import express from 'express';
import { setupSocketIO } from '../controller/chat-controller'; // เรียกใช้ฟังก์ชัน setupSocketIO จากไฟล์ socket.ts

const chatRoom = express.Router();

// เส้นทาง API สำหรับเชื่อมต่อ Socket.io
chatRoom.get('/:idroom', (req, res) => {
  const idroom = req.params.idroom;
  res.status(200).send(`Connected to room ${idroom}`);

  // เชื่อมต่อ Socket.io เมื่อมีการเรียกใช้งานเส้นทาง API นี้
  setupSocketIO(idroom);
});

export default chatRoom;
