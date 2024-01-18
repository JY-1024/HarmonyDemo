/**
 * 1、线性布局 Row/Column
 * 2、相对布局 RelativeContainer为采用相对布局的容器，支持容器内部的子元素设置相对位置关系。
 *           子元素支持指定兄弟元素作为锚点，也支持指定父容器作为锚点，基于锚点做相对位置布局。锚点设置必须有id
 * 3、层叠布局 StackLayout用于在屏幕上预留一块区域来显示组件中的元素，提供元素可以重叠布局。
 *           层叠布局通过Stack容器组件实现位置的固定定位与层叠，容器中的子元素（子组件）依次入栈，后一个子元素覆盖前一个子元素，
 *           子元素可以叠加，也可以设置位置。默认情况下，容器中的子组件根据自己的大小默认进行居中堆叠。
 *
 * 4、弹性布局
 */
@Entry
@Component
struct LayoutPage {
  @State message: string = "Hello,World"

  build() {



  }

  //1、线性布局
  lineLayout() {
    //1、线性布局
    // Column({space:12}){
    //   Text('item1').fontSize(14).backgroundColor(Color.Red).padding(20)
    //   Text('item2').fontSize(14).backgroundColor(Color.Green).padding(20)
    //   Text('item3').fontSize(14).backgroundColor(Color.White).padding(20)
    //   Text('item4').fontSize(14).backgroundColor(Color.Gray).padding(20)
    // }
    // .width('100%')
    // .height('100%')
    // .justifyContent(FlexAlign.Start)
    // .alignItems(VerticalAlign.Top)


    // Row(){
    //   Text('item1').fontSize(14).backgroundColor(Color.Red).padding(20)
    //   Text('item2').fontSize(14).backgroundColor(Color.Green).padding(20)
    //   Text('item3').fontSize(14).backgroundColor(Color.White).padding(20)
    //   Text('item4').fontSize(14).backgroundColor(Color.Gray).padding(20)
    // }
    // .width('100%')
    // .height('100%')
    // .justifyContent(FlexAlign.Center)
    // .alignItems(VerticalAlign.Top)

    //空白填充，不使用 .justifyContent(FlexAlign.SpaceBetween)
    // Row(){
    //   Text('item1').fontSize(14).backgroundColor(Color.Red).padding(20)
    //   Blank() //Blank要起作用，row 一定要设置宽度，Column 一定要设置高度
    //   Text('item2').fontSize(14).backgroundColor(Color.Green).padding(20)
    // }
    // .alignItems(VerticalAlign.Center)
    // .backgroundColor(Color.Gray)
    // .borderRadius(15)
    // .padding({left:12})
    // .width('100%')
    // .height('20%')


    /**
     * 自适应缩放
     * 1、使用百分比。例如：.width('100%') .height('20%')
     * 2、使用权重layoutWeight。
     */
    //1、使用百分比
    // Column(){
    //   Column().backgroundColor(Color.Red).width('100%').height('20%');
    //   Column().backgroundColor(Color.Green).width('100%').height('50%');
    //   Column().backgroundColor(Color.Yellow).width('100%').height('30%');
    // }

    //2、使用权重layoutWeight
    // Column() {
    //   Column().backgroundColor(Color.Red).width('100%').layoutWeight(2)
    //   Column().backgroundColor(Color.Green).width('100%').layoutWeight(5)
    //   Column().backgroundColor(Color.Yellow).width('100%').layoutWeight(3)
    // }
  }

  //二、RelativeContainer 相对布局
  RelativeContainerLayout(){
    // RelativeContainer() {
      //2.1 RelativeContainer父组件作为锚点
      // Row()
      //   .backgroundColor(Color.Red)
      //   .width(100)
      //   .height(100)
      //     //添加其它属性
      //   .alignRules({
      //     top: { anchor: '__container__', align: VerticalAlign.Top },
      //     left: { anchor: '__container__', align: HorizontalAlign.Start }
      //   })
      //   .id("row1")
      // Row()
      //   .backgroundColor(Color.Green)
      //   .width(100)
      //   .height(100)
      //     //添加其它属性
      //   .alignRules({
      //     right: { anchor: '__container__', align: HorizontalAlign.End },
      //     center: { anchor: '__container__', align: VerticalAlign.Center }
      //   })
      //   .id("row2")
      // Row()
      //   .backgroundColor(Color.Yellow)
      //   .width(100)
      //   .height(100)
      //     //添加其它属性
      //   .alignRules({
      //     bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
      //     middle: { anchor: '__container__', align: HorizontalAlign.Center }
      //   })
      //   .id("row3")

      //相对于子元素作为锚点
  //     Row().backgroundColor(Color.Red).width(100).height(100)
  //         //添加其它属性
  //       .alignRules({
  //         center: { anchor: '__container__', align: VerticalAlign.Top },
  //         middle: { anchor: '__container__', align: HorizontalAlign.Start }
  //       })
  //       .id("row1")
  //     Row().backgroundColor(Color.Green).width(100).height(100)
  //         //添加其它属性
  //       .alignRules({
  //         left: { anchor: 'row1', align: HorizontalAlign.End },
  //         top: { anchor: 'row1', align: VerticalAlign.Top }
  //       })
  //       .id("row2")
  //     Row().backgroundColor(Color.Yellow).width(100).height(100)
  //         //添加其它属性
  //       .alignRules({
  //         top: { anchor: 'row2', align: VerticalAlign.Bottom },
  //         left: { anchor: 'row2', align: HorizontalAlign.Start }
  //       })
  //       .id("row3")
  //   }
  //   .width('100%')
  //   .height('100%')
  }

}