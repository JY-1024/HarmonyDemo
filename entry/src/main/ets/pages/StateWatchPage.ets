
@Entry
@Component
struct StateWatchPage {
  @State @Watch("change") count:number=1
  @State @Watch("change") pow:number=2
  @State res:number=1
  change(){
    this.res=Math.pow(this.count,this.pow)
  }
  build() {
    Column() {
      Row(){
        Text('基数：' )
          .fontSize(20)
        TextInput({
          text:this.count.toString()
        })
          .type(InputType.Number)
          .layoutWeight(1)
          .height(40)
          .borderRadius(10)
          .onChange((value)=>{
            if(value==null || value==undefined || value==""){
              this.count=0
            }else{
              this.count=parseInt(value)
            }
          })
      }.margin({
        bottom:20
      })

      Row(){
        Text('次幂：')
          .fontSize(20)
        TextInput({
          text:this.pow.toString()
        }).type(InputType.Number)
          .layoutWeight(1)
          .height(40)
          .borderRadius(10)
          .onChange((value)=>{
            if(value==null || value==undefined || value==""){
              this.pow=0
            }else{
              this.pow=parseInt(value)
            }
          })
      }.margin({
        bottom:20
      })

      Row(){
        Text("结果：" + this.res)
          .fontSize(30)
      }
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}