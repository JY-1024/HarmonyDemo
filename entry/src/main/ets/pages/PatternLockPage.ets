import promptAction from '@ohos.promptAction'
@Entry
@Component
struct PatternLockPage {
  @State password:number[]=[]
  @State message: string = '请输入密码'
  patternLockController:PatternLockController=new PatternLockController()
  build() {
    Scroll(){
      Column() {
        Text(this.message)
          .fontSize(20)
          .textAlign(TextAlign.Center)
          .margin({top:10})

        PatternLock(this.patternLockController)
          .margin({top:10})
          .onPatternComplete((input)=>{
            if(input==null || input==undefined || input.length<5){
              promptAction.showToast({
                message:"密码长度不能小于5位",
                duration:2000,
                bottom:200
              })

            }else{
              //JSON.stringify 表示把json对象或者数组转换成字符串
              console.log(JSON.stringify(input))
            }
            this.patternLockController.reset()
          })

        Text("设置密码-需要输入两次")
          .fontSize(20)
          .textAlign(TextAlign.Center)
          .margin({top:10})

        PatternLock(this.patternLockController)
          .margin({top:10})
          .pathStrokeWidth(20)  //线的宽度
          .circleRadius(10)   //圆形直径
          .activeColor(Color.Gray) //颜色
          .selectedColor(Color.Red) //选中的颜色
          .pathColor(Color.Orange) //选中线的颜色
          .backgroundColor('#F5F5F5') //背景颜色

          .onPatternComplete((input)=>{
            if(input==null || input==undefined || input.length<5){
              promptAction.showToast({
                message:"密码长度不能小于5位",
                duration:2000,
              })
            }else{
              //第一次输入密码
              if(this.password.length==0){
                this.password=input
                promptAction.showToast({
                  message:"请再次输入密码",
                  duration:2000,
                })
              }else{  //第二次输入密码
                if(this.password.toString()==input.toString()){
                  promptAction.showToast({
                    message:"设置密码成功",
                    duration:2000,
                  })
                  this.password=[]
                }else{
                  this.password=[]
                  promptAction.showToast({
                    message:"两次密码不一致，重新输入",
                    duration:2000,
                  })
                }
              }
            }
            this.patternLockController.reset()
          })
      }
      .width('100%')
    }
  }
}