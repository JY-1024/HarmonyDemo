@Entry
@Component

//垂直滚动
struct Grid_1_View_Page {
  arr: string[] =[`1`,`2`,`3`,`4`,`5`,`6`,`7`,`8`,`9`,`10`,`11`,'12','13','14','15']

  build() {
    Column() {
      Grid(){
        ForEach(
          this.arr,
          (item,index)=>{
            GridItem(){
              Text(item)
                .fontSize(26)
                .fontColor(Color.White)
                .backgroundColor("#007DFF")
                .width('100%')
                .height('200')
                .textAlign(TextAlign.Center)
            }
          }
        )

      }
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .padding(10)
    }
    .width('100%')
    .height('100%')
  }
}