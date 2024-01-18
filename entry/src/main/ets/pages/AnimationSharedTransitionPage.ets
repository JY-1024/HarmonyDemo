import router from '@ohos.router'
/**
 * 在不同页面间，有使用相同的元素（例如同一幅图）的场景，可以使用共享元素转场动画衔接。为了突出不同页面间相同元素的关联性，可为它们添加共享元素转场动画。如果相同元素在不同页面间的大小有明显差异，即可达到放大缩小视图的效果。

 共享元素转场的接口为：

 sharedTransition(id: string, options?: sharedTransitionOptions)
 其中根据sharedTransitionOptions中的type参数，共享元素转场分为Exchange类型的共享元素转场和Static类型的共享元素转场。

 Exchange类型的共享元素转场
 交换型的共享元素转场，需要两个页面中，存在通过sharedTransition函数配置为相同id的组件，它们称为共享元素。这种类型的共享元素转场适用于两个页面间相同元素的衔接，会从起始页共享元素的位置、大小过渡到目标页的共享元素的位置、大小。如果不指定type，默认为Exchange类型的共享元素转场，这也是最常见的共享元素转场的方式。使用Exchange类型的共享元素转场时，共享元素转场的动画参数由目标页options中的动画参数决定。

 Static类型的共享元素转场
 静态型的共享元素转场通常用于页面跳转时，标题逐渐出现或隐藏的场景，只需要在一个页面中有Static的共享元素，不能在两个页面中出现相同id的Static类型的共享元素。在跳转到该页面（即目标页）时，配置Static类型sharedTransition的组件做透明度从0到该组件设定的透明度的动画，位置保持不变。在该页面（即起始页）消失时，做透明度逐渐变为0的动画，位置保持不变。

 共享元素转场的动画参数由该组件sharedTransition属性中的动画参数决定。

 */
@Entry
@Component
struct AnimationSharedTransitionPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Text("SharedTransition dest page")
        .fontSize(26)
        .margin({
          top: 20
        }).sharedTransition("text", {
        duration: 300,
        curve: Curve.Linear,
        type: SharedTransitionEffectType.Static
      })

      Image("https://www.itying.com/images/flutter/4.png")
        .width(300)
        .height(300)
        .margin({ top: 100 })
        .sharedTransition("image1", {
          duration: 1000,
          type: SharedTransitionEffectType.Exchange  //默认
        })
    }
    .width('100%')
    .height('100%')
    .onClick(() => {
      router.back()
    })
  }
}