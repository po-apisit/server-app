import { PostUser } from "../model/postuser";
import * as postuserRepositorie from "../repositorie/postuser-repositorie"


export const nonauthen_findrandom = async ():Promise<PostUser[]> => 
                    await postuserRepositorie.nonauthen_findrandom();