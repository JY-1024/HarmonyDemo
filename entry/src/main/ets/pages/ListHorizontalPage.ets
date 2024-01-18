interface PListInterface {
  id: string
  title: string
  price: number
  s_pic: string
}

@Entry
@Component
struct ListHorizontalPage {
  @State pList:PListInterface[]=[
    {
      "id": "6333cc2d9e8e3a0f80512495",
      "title": "Redmi K50 至尊版",
      "price": 2666,
      "s_pic": "https://xiaomi.itying.com/public/upload/iFrB4izNiGzov22F2aJXX0ta.png_200x200.png"
    },
    {
      "id": "6333ca7f9e8e3a0f80512494",
      "title": "小米平板5",
      "price": 1799,
      "s_pic": "https://xiaomi.itying.com/public/upload/YsOLLNPEQ-HeqwWPRz45jg7g.png_200x200.png"
    },
    {
      "id": "6333c7728eaaef0948db7c98",
      "title": "Redmi Note 11T Pro系列",
      "price": 1999,
      "s_pic": "https://xiaomi.itying.com/public/upload/2CVF_KN8pPiaIVSnWW6FmHkT.png_200x200.png"
    },
    {
      "id": "5a080c4aad8b300e28e2fed2",
      "title": "小米 红米 4A 全网通 移动联通电信4G手机 ",
      "price": 678,
      "s_pic": "https://xiaomi.itying.com/public/upload/4uN_xCK69oV4vMMJREI_2-HN.jpg_200x200.jpg"
    },
    {
      "id": "5a080c2ead8b300e28e2fed1",
      "title": "Redmi Note 11 5G  64GB 酒红色 ",
      "price": 1456,
      "s_pic": "https://xiaomi.itying.com/public/upload/E8jnbcercoZGdllR3r9QN5aD.jpg_200x200.jpg"
    },
    {
      "id": "5a080c12ad8b300e28e2fed0",
      "title": "小米 A57 3GB+32GB内存版 ",
      "price": 2311,
      "s_pic": "https://xiaomi.itying.com/public/upload/U98CzUIZjb_lMDwCx_Ue_OqO.jpg_200x200.jpg"
    },
    {
      "id": "5a080babad8b300e28e2fecd",
      "title": "小米 红米Note4X 全网通版 3GB+32GB ",
      "price": 990,
      "s_pic": "https://xiaomi.itying.com/public/upload/Z5MuMJH7T3n0BgzE0Ic64jni.jpg_200x200.jpg"
    }
  ]

  build() {
    Column() {
      List() {
        ForEach(
          this.pList,
          (item:PListInterface,index)=>{
            ListItem() {
              Column(){
                Image(`${item.s_pic}`)
                  .width(80)
                  .height(80)
                  .borderRadius(10)
                Text(`¥${item.price.toString()}`)
                  .fontSize(16)
                  .fontColor(Color.Red)
                  .textAlign(TextAlign.Center)
                  .width('100%')
                  .margin({top:6})
              }
            }
            .width(100)
            .height(100)
          },
          (item:PListInterface)=>{
            return item.id
          }
        )

      }
      .listDirection(Axis.Horizontal)
      .height(130)
      .padding(10)
      Text('111')
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Start)
  }
}