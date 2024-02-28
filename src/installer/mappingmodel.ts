

export function mappingobj<T>(obj: T): T {
    return obj;
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


