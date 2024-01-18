import Article from '../model/Article'

@Entry
@Component
struct ListArticlePage {
  @State message: string = 'Hello World'
  @State articleList: Article[] = [
    new Article(
      1,
      "新手攻略|开启关怀模式，与家人更亲近~",
      "https://www.itying.com/images/listimg/article/01.png",
      "国家电网",
      "2024-12-2"
    ),
    new Article(
      2,
      "反诈课堂|光伏骗局套路多听我给您细细说!",
      "https://www.itying.com/images/listimg/article/02.png",
      "国家电网",
      "2024-4-2"
    ),
    new Article(
      3,
      "新手攻略| 联合办、网上办一次办，这些地方的用户注",
      "https://www.itying.com/images/listimg/article/03.png",
      "国家电网",
      "2024-1-12"
    ),
    new Article(
      4,
      "新手攻略|轻轻一点，电费一键查询",
      "https://www.itying.com/images/listimg/article/04.png",
      "国家电网",
      "2024-12-2"
    ),
    new Article(
      5,
      "关注|局地降温超16C!寒潮天气来袭，注意防寒保暖!",
      "https://www.itying.com/images/listimg/article/05.png",
      "国家电网",
      "2024-2-6"
    )
  ]

  build() {
    Column() {
      List() {
        ForEach(
          this.articleList,
          (item: Article, index) => {
            ListItem() {
              Row() {
                Column() { //自适应
                  Text(`${item.title}`).fontSize(16).fontWeight(FontWeight.Bold)
                  Text(`${item.author}  ${item.date}`).fontSize(14)
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start)
                .justifyContent(FlexAlign.SpaceBetween)
                .height(68)
                //图片固定宽度
                Image(`${item.img}`)
                  .width(100)
                  .height(68)
                  .margin({ left: 5 })
                  .borderRadius(10)
              }
            }
            .padding({
              top: 8,
              bottom: 8
            })

          },
          (item:Article) => item.id.toString()
        )

      }
      .backgroundColor(0xffffff)
      .borderRadius(10)
      .padding(10)
      .divider({
        strokeWidth: 1,
        color: "#eee"
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xeeeeee)
    .padding(10)
  }
}