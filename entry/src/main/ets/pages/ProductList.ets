
class Item {
  name:string
  image:ResourceStr
  price:number
  discount:number

  constructor(name:string,image:ResourceStr,price:number,discount:number=0) {
    this.name = name;
    this.image = image;
    this.price = price
    this.discount = discount
  }
}

@Entry
@Component
struct ProductList {
  //商品数据
  // 商品数据
  private items: Array<Item> = [
    new Item('华为Mate60', $r('app.media.mate60'),6999,500),
    new Item('MateBookProX', $r('app.media.mateBookProX'),13999),
    new Item('WatchGT4', $r('app.media.watchGT4'),1438),
    new Item('FreeBuds Pro3', $r('app.media.freeBudsPro3'),1499),
    new Item('Mate X5', $r('app.media.mateX5'),12999)
  ]

  build() {
    Column({ space: 8 }) {
      //标题
      Row() {
        Text('商品列表').fontSize(35).fontWeight(FontWeight.Bold)
      }
      .margin({ bottom: 20 })
      .width('100%')
      
      ForEach(this.items,(item:Item,index)=>{
        //商品列表Item
        Row({ space: 10 }) {
          Image(item.image)
            .width(100)
            .objectFit(ImageFit.Cover)

          Column({space:4}) {
            if (item.discount) {
              //有折扣
              Text(item.name).fontSize(18).fontWeight(FontWeight.Bold)
              Text('原价：¥'+item.price).fontSize(14).fontColor('#CCC').decoration({type:TextDecorationType.LineThrough})
              Text('折扣价：¥'+(item.price - item.discount)).fontSize(18).fontColor('#F36')
              Text('补贴：¥'+item.discount).fontSize(18).fontColor('#F36')
            } else {
              //没有折扣
              Text(item.name).fontSize(18).fontWeight(FontWeight.Bold)
              Text('¥'+item.price).fontSize(18).fontColor('#F36')
            }
          }
          .height('100%')
          .alignItems(HorizontalAlign.Start)

        }
        .width('100%')
        .backgroundColor('#FFF')
        .borderRadius(10)
        .height(120)
        .padding(10)
      })

    }
    .height('100%')
    .width('100%')
    .backgroundColor('#EFEFEF')
    .padding(20)

  }
}