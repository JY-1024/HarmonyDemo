class Item3 {
  name: string
  image: ResourceStr
  price: number
  discount: number

  constructor(name: string, image: ResourceStr, price: number, discount: number = 0) {
    this.name = name;
    this.image = image;
    this.price = price
    this.discount = discount
  }
}

/*//全局自定义构建函数，在文件内都可以使用
@Builder function itemCard(item:Item3) {
  Row({ space: 10 }) {
    Image(item.image)
      .width(100)
      .objectFit(ImageFit.Cover)

    Column({ space: 4 }) {
      if (item.discount) {
        //有折扣
        Text(item.name).fontSize(18).fontWeight(FontWeight.Bold)
        Text('原价：¥' + item.price)
          .fontSize(14)
          .fontColor('#CCC')
          .decoration({ type: TextDecorationType.LineThrough })
        Text('折扣价：¥' + (item.price - item.discount)).fontSize(18).fontColor('#F36')
        Text('补贴：¥' + item.discount).fontSize(18).fontColor('#F36')
      } else {
        //没有折扣
        Text(item.name).fontSize(18).fontWeight(FontWeight.Bold)
        Text('¥' + item.price).fontSize(18).fontColor('#F36')
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
}*/


/*
//自定义公共样式
//全局公共样式函数
@Styles function fillScreen(){
  .width('100%')
  .height('100%')
  .backgroundColor('#EFEFEF')
  .padding(20)
}
*/

// 继承模式，只能写在全局
@Extend(Text) function priceText(){
  .fontColor('#F36')
  .fontSize(18)
}

import { Header } from '../components/CommonComponents'

@Entry
@Component
struct ProductList3 {
  //商品数据
  // 商品数据
  private items: Array<Item3> = [
    new Item3('华为Mate60', $r('app.media.mate60'), 6999, 500),
    new Item3('MateBookProX', $r('app.media.mateBookProX'), 13999),
    new Item3('WatchGT4', $r('app.media.watchGT4'), 1438),
    new Item3('FreeBuds Pro3', $r('app.media.freeBudsPro3'), 1499),
    new Item3('Mate X5', $r('app.media.mateX5'), 12999),
    new Item3('华为Mate60', $r('app.media.mate60'), 6999, 500),
    new Item3('MateBookProX', $r('app.media.mateBookProX'), 13999),
    new Item3('WatchGT4', $r('app.media.watchGT4'), 1438),
    new Item3('FreeBuds Pro3', $r('app.media.freeBudsPro3'), 1499),
    new Item3('Mate X5', $r('app.media.mateX5'), 12999)

  ]

  //局部公共样式函数
  @Styles fillScreen(){
    .width('100%')
    .height('100%')
    .backgroundColor('#EFEFEF')
    .padding(20)
  }

  build() {
    Column({ space: 8 }) {
      //标题
      Header({ title: '商品列表' })
        .margin({ bottom: 20 })

      List({ space: 8 }) {
        ForEach(
          this.items,
          (item: Item3, index) => {
            //商品列表Item
            ListItem() {
              this.itemCard(item)
            }
          })
      }
      .width('100%')
      .layoutWeight(1) //权重, 剩余高度（因为第一行Row没设置权重，默认权重为0，所以剩下高度都是list的）
    }
    .fillScreen()

  }

  //局部自定义构建函数，只能自己使用
  @Builder itemCard(item: Item3) {
    Row({ space: 10 }) {
      Image(item.image)
        .width(100)
        .objectFit(ImageFit.Cover)

      Column({ space: 4 }) {
        if (item.discount) {
          //有折扣
          Text(item.name).fontSize(18).fontWeight(FontWeight.Bold)
          Text('原价：¥' + item.price)
            .fontSize(14)
            .fontColor('#CCC')
            .decoration({ type: TextDecorationType.LineThrough })
          Text('折扣价：¥' + (item.price - item.discount)).priceText()
          Text('补贴：¥' + item.discount).priceText()
        } else {
          //没有折扣
          Text(item.name).fontSize(18).fontWeight(FontWeight.Bold)
          Text('¥' + item.price).priceText()
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
  }
}