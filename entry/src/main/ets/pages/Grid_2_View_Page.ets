@Entry
@Component
//水平网格滚动
struct Grid_2_View_Page {
  services:Array<string> =
    ['直播', '进口','分类','充值','领券','抽奖','会员','抽奖','积分','更多'];
  colors:Array<Color> =[
    Color.Brown,
    Color.Red,
    Color.Orange,
    Color.Blue,
    Color.Grey,
    Color.Pink,
    Color.Red,
    Color.Brown,
    Color.Orange,
    Color.Orange
  ]

  build() {
    Column() {
      Grid(){
        ForEach(this.services,(item,key)=>{
          GridItem(){
            Text(item)
              .fontSize(16)
              .fontColor(Color.White)
              .backgroundColor(this.colors[key])
              .width(60)
              .height(60)
              .textAlign(TextAlign.Center)
              .borderRadius(60)
          }.width('25%')
        })
      }.height(160)
      .rowsTemplate('1fr 1fr')
      .rowsGap(10)
      .padding(10)
      .backgroundColor("#eee")
    }
    .width('100%')
    .height('100%')
  }
}