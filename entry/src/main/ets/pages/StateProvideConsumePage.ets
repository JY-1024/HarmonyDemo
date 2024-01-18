
@Entry
@Component
struct StateProvideConsumePage {
  @State count:number=1
  build() {
    Stack(){
      Column() {
        Text(`${this.count}`)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)

        SecondBox({
          num:$count,     //注意：子组件使用@Link装饰器接收数据的话 父组件需要通过$进行传值
          color:Color.Red
        })
        SecondBox({
          num:$count,
          color:Color.Orange
        })

        SecondBox({
          num:$count,
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
struct SecondBox{
  private color:Color
  @Link num:number   //@Link num和count建立一个双向绑定的关系
  build(){
    Column(){
      ThirdBox({
        num:$num
      })
    }
    .width(120)
    .height(120)
    .backgroundColor(this.color)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .margin({
      top:10
    })
  }
}

@Component
struct ThirdBox{
  @Link num:number
  build(){
    Text(`${this.num}`)
      .fontSize(40)
      .fontWeight(FontWeight.Bold)
      .width(120)
      .height(120)
      .textAlign(TextAlign.Center)
      .onClick(()=>{
        console.log(`this.num=${this.num}`)
        this.num++
      })
  }
}