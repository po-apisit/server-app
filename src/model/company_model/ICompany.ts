export interface ICompany {
    ID_COMPANY: string;
    ID_USER: string;
    COMPANY_NAME: string;
    TAG_URL: string;
    EMAIL: string;
    PHONE_NUMBER: string;
    WEBPAGE: string;
    ID_LINE: string;
    IMAGE_PROFILE: string;
    IMAGE_COVER: string;
    TITLE: string;
    META_DESCRIPTION: string;
    META_KEYWORDS: string;
    OPENGRAPH_TITLE: string;
    OPENGRAPH_DESCRIPTION: string;
    OPENGRAPH_URL_IMAGES: string;
    TWITTER_TITLE: string;
    TWITTER_DESCRIPTION: string;
    TWITTER_URL_IMAGES: string;
    STATUS_COMPANY: "PENDING" | "NORMAL" | "VERIFY" | "PREMIER";
    STATUS: "PUBLIC" | "PRIVATE";
    CREATED_AT: Date;
    UPDATED_AT: Date;
    DELETED_AT: Date | null;
  }
  