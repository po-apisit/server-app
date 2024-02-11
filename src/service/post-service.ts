import { Post } from "../model/post";
import * as postRepositorie from "../repositorie/post-repositorie"


export const nonauthen_findrandom = async ():Promise<Post[]> => 
                    await postRepositorie.nonauthen_findrandom();