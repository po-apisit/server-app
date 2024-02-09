

export function mappingobj<T>(obj: T): T {
    const result: Partial<T> = {}; // สร้างอ็อบเจ็กต์ผลลัพธ์โดยใช้ Partial เพื่อให้ทุกค่าเริ่มต้นเป็น undefined
    if (obj !== null && typeof obj === 'object') { // ตรวจสอบว่า obj ไม่เป็น null และเป็นอ็อบเจ็กต์
        const keys = Object.keys(obj) as (keyof T)[]; // ดึง key ของ obj และระบุให้มันเป็น keyof T

        keys.forEach(key => {
            // ตรวจสอบว่า key อยู่ใน obj หรือไม่ ถ้าอยู่จะนำค่ามาใส่ใน result
            if (key in obj) {
                result[key] = obj[key];
            }
        });
    }

    // แปลงผลลัพธ์ให้เป็นประเภท T
    return result as T;
}

export function mappingarray<T>(obj: T | T[]): T[] {
    if (Array.isArray(obj)) {
        let result: T[] = [];
        obj.forEach(item => {
            result = result.concat(mappingarray(item));
        });
        return result;
    } else {
        const result: Partial<T> = {};
        if (obj !== null && typeof obj === 'object') {
            const keys = Object.keys(obj) as (keyof T)[];
            keys.forEach(key => {
                if (key in obj) {
                    result[key] = obj[key];
                }
            });
        }
        return [result as T];
    }
}


