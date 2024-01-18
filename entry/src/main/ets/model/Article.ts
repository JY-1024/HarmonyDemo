//模型类约束数组
export default class Article {
  id: number;
  title: string;
  img: string;
  author: string;
  date: string;

  constructor(id: number, title: string, img: string, author: string, date: string) {
    this.id = id;
    this.title = title;
    this.img = img;
    this.author = author;
    this.date = date;
  }
}