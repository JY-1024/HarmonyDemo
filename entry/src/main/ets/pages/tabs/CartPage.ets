import AppBar from '../widget/AppBar'
// @Entry
@Component
export default struct CartPage {
  build() {
    Column() {
      AppBar({title:'购物车'})
      Text("CartPage").fontSize(30)

      Button(){
        Text(`PersistenStorage设置数据`).fontSize(18).fontColor(Color.White)
      }.width('90%')
      .height(40)
      .onClick(()=>{
        PersistentStorage.PersistProp('count',1)
      }).margin({
        top:20
      })


    }
    .width('100%')
    .height('100%')
  }
}