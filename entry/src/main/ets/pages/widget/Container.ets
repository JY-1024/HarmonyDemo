@Component
export struct Container{
  w:number|string=80
  h:number|string=80
  text:number|string=1
  color:Color|string|number=Color.Red
  build(){
    Row(){
      Text(`${this.text}`).fontSize(32).fontColor(Color.White)
    }.width(this.w)
    .height(this.h)
    .backgroundColor(this.color)
    .justifyContent(FlexAlign.Center)
    .margin({right:10,bottom:10})
  }
}