import AppBar from "../pages/widget/AppBar"
@Entry
@Component
struct SwiperPage {
  @State message: string = 'Hello World'
  private swiperController: SwiperController = new SwiperController();
  build() {
    Column() {
      AppBar({title:"Swiper演示"})

      Swiper(){
        Text("0")
          .width('100%')
          .height('100%')
          .backgroundColor(Color.Gray)
          .textAlign(TextAlign.Center)
          .fontSize(60)
          .fontColor(Color.White)

        Text("1")
          .width('100%')
          .height('100%')
          .backgroundColor(Color.Green)
          .textAlign(TextAlign.Center)
          .fontSize(60)
          .fontColor(Color.White)

        Text("2")
          .width('100%')
          .height('100%')
          .backgroundColor(Color.Pink)
          .textAlign(TextAlign.Center)
          .fontSize(60)
          .fontColor(Color.White)
      }
      .height(100)
      .width("100%")
      .autoPlay(true)  //自动轮播
      .loop(true)     //循环轮播
      .duration(100)  //轮播图滑动的时间
      .interval(2000) //轮播图间隔时间
      .indicatorStyle({  //轮播图导航点样式
        size: 30,  //大小
        selectedColor:Color.Red, //选中的颜色
        color: Color.White  //没有选中的颜色
      })


      Swiper(this.swiperController){
        Text("0")
          .width('100%')
          .height('100%')
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center)
          .fontSize(60)
          .fontColor(Color.White)

        Text("1")
          .width('100%')
          .height('100%')
          .backgroundColor(Color.Green)
          .textAlign(TextAlign.Center)
          .fontSize(60)
          .fontColor(Color.White)

        Text("2")
          .width('100%')
          .height('100%')
          .backgroundColor(Color.Pink)
          .textAlign(TextAlign.Center)
          .fontSize(60)
          .fontColor(Color.White)
      }
      .height(120)
      .width("100%")
      .autoPlay(true)  //自动轮播
      .loop(true)     //循环轮播
      .duration(100)  //轮播图滑动的时间
      .interval(2000) //轮播图间隔时间
      .indicatorStyle({  //轮播图导航点样式
        size: 30,  //大小
        selectedColor:Color.Red, //选中的颜色
        color: Color.White  //没有选中的颜色
      }).margin({
        top:20
      })

      Row({ space: 12 }) {
        Button('showNext')
          .onClick(() => {
            this.swiperController.showNext()
          })
        Button('showPrevious')
          .onClick(() => {
            this.swiperController.showPrevious()
          })
      }.margin(5)

      Swiper(this.swiperController){
        Image("https://jdmall.itying.com/public/upload/UObZahqPYzFvx_C9CQjU8KiX.png")
          .width("100%")
          .objectFit(ImageFit.Fill)

        Image("https://jdmall.itying.com/public/upload/f3OtH11ZaPX5AA4Ov95Q7DEM.png")
          .width("100%")
          .objectFit(ImageFit.Fill)
        Image("https://jdmall.itying.com/public/upload/s5ujmYBQVRcLuvBHvWFMJHzS.jpg")
          .width("100%")
          .objectFit(ImageFit.Fill)
      }
      .height(180)
      .width("100%")
      .autoPlay(true)  //自动轮播
      .loop(true)     //循环轮播
      .margin({top:20})
      .interval(2000) //轮播图间隔时间
      .indicatorStyle({  //轮播图导航点样式
        size: 30,  //大小
        selectedColor:Color.Red, //选中的颜色
        color: Color.White  //没有选中的颜色
      })

    }
    .width('100%')
    .height('100%')


  }
}