# เลือกเวอร์ชันของ Node.js เบื้องต้น
FROM node:20

# ตั้งค่าโฟลเดอร์ทำงานใน Docker container
WORKDIR /app

# คัดลอกไฟล์ package.json และ package-lock.json เพื่อติดตั้ง dependencies
COPY package*.json ./

# ติดตั้ง dependencies โดยใช้ npm
RUN npm install

# คัดลอกโค้ดและไฟล์ของโปรเจคเข้าไปใน Docker container
COPY . .

# สร้างโค้ด TypeScript เป็น JavaScript
RUN npm run build

# โปรดตรวจสอบว่าพอร์ตที่กำหนดใช้งานได้
EXPOSE 4000

# เริ่มต้นแอปพลิเคชัน
CMD [ "node", "./dist/server.js" ]