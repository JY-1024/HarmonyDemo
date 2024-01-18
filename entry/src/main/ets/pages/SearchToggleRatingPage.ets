@Entry
@Component
struct SearchToggleRatingPage {
  @State message: string = 'Hello World'
  searchController:SearchController=new SearchController()
  build() {
    Column() {
      Search({
        value:"女装",
        placeholder:"请输入搜索内容",
        controller:this.searchController
      })
        .width("90%")
        .height(50)
        .placeholderColor(Color.Gray)
        .placeholderFont({size:20,weight:400})
        .backgroundColor("#eee")
        .onChange((value)=>{
          console.log(value)
        })

      Button(){
        Text("设置光标").fontColor(Color.White)
      }.onClick((event: ClickEvent) => {
        this.searchController.caretPosition(1)
      }).width("80%").height(40)

      Toggle({
        type:ToggleType.Switch,
        isOn:false
      }).size({
        width:100,
        height:100
      })
        .selectedColor(Color.Orange)
        .onChange((value)=>{
          console.log(value.toString())
        })

      // indicator设置评分组件作为指示器使用，不可改变评分
      Rating({ rating: 2, indicator: false })
        .stars(6)
        .stepSize(0.5)
        .margin({ top: 24 })
        .onChange((value: number) => {
          console.log(value.toString())
        })
    }
    .width('100%')
    .height('100%')
  }
}