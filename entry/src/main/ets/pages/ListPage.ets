@Entry
@Component
struct ListPage {
  @State list: number[] = [1,23,4,5,6,7,8,9,12]

  build() {
    Column() {
      List({space:10,initialIndex:0}){
        ForEach(
          this.list,
          (item,index)=>{
            ListItem(){
              Text('1').textAlign(TextAlign.Center)
                .width('100%')
                .height(100)
                .fontSize(30)
            }
            .backgroundColor(0xffffff)
          },
          item=>item
        )

      }
      .padding(10)
      .divider({
        color:Color.Red,
        strokeWidth:5,
        startMargin:20,
        endMargin:0
      })
      .listDirection(Axis.Vertical) //配置list显示方向
      .scrollBar(BarState.On) //滚动条
      .edgeEffect(EdgeEffect.Spring)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xeeeeee)
  }
}