import AppBar from '../widget/AppBar'

// @Entry
@Component
export default struct CatePage {
  build() {
    Column() {
      AppBar({title:'分类'})
      Tabs(){
        TabContent(){
          Text("热门").fontSize(23)
        }.tabBar("热门")
        TabContent(){
          Text("关注").fontSize(23)
        }.tabBar("关注")
        TabContent(){
          Text("视频").fontSize(23)
        }.tabBar("视频")
        TabContent(){
          Text("游戏").fontSize(23)
        }.tabBar("游戏")
        TabContent(){
          Text("科技").fontSize(23)
        }.tabBar("科技")
        TabContent(){
          Text("体育").fontSize(23)
        }.tabBar("体育")
        TabContent(){
          Text("娱乐").fontSize(23)
        }.tabBar("娱乐")
        TabContent(){
          Text("人文").fontSize(23)
        }.tabBar("人文")
        TabContent(){
          Text("艺术").fontSize(23)
        }.tabBar("艺术")
      }
      .barMode(BarMode.Scrollable)
    }
    .width('100%')
    .height('100%')
  }
}