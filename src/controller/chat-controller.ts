import { Server as SocketIOServer, Socket } from 'socket.io';

// สร้างห้องแชทแยกตาม idroom
const setupSocketIO = (idroom: string) => {
  return (server: any) => {
    const io = new SocketIOServer(server, { path: `/api/chat/${idroom}` });

    io.on('connection', (socket: Socket) => {
      console.log(`a user connected to room ${idroom}`);

      socket.on('chat message', (msg: string) => {
        console.log(`message in room ${idroom}: ${msg}`);
        io.emit('chat message', msg);
      });

      socket.on('disconnect', () => {
        console.log(`user disconnected from room ${idroom}`);
      });
    });
  };
};

export { setupSocketIO };
