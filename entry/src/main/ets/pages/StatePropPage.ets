
@Entry
@Component
struct StatePropPage {
  @State count:number=1
  build() {
    Stack(){
      Column() {
        Text(`${this.count}`)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)

        Container({
          num:this.count,
          color:Color.Red
        })
        Container({
          num:this.count,
          color:Color.Orange
        })

        Container({
          num:this.count,
          color:Color.Pink
        })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      Button({type:ButtonType.Circle}){
        Text("+").fontSize(40).fontColor(Color.White)
      }.width(60)
      .height(60)
      .position({
        x:"80%",
        y:"90%"
      })
      .onClick(()=>{
        this.count++
      })
    }
  }
}

@Component
struct Container{
  private color:Color
  @Prop num:number   //@Prop num和count建立一个单向绑定的关系
  build(){
    Column(){
      Text(`${this.num}`)
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
    }
    .width(120)
    .height(120)
    .backgroundColor(this.color)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .margin({
      top:10
    })
    .onClick(()=>{
      this.num++
    })
  }
}