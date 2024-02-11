import { CommentUser } from "./commentuser";
import { LikeUser } from "./likeuser";
import { Post } from "./post";

export interface PostResponse {
    post?:Post,
    countlike?:number,
    likt?:LikeUser,
    countcomment?:number,
    comment?:CommentUser
}