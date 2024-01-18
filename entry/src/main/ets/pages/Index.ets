// @ts-nocheck
import router from '@ohos.router';
import IndexFontSizePanel from '../views/IndexFontSizePanel';
import preferencesUtil from '../components/util/PreferencesUtil'

class RouterInfo {
  // 页面地址
  url: string
  // 页面标题
  title: string

  constructor(url: string, title: string) {
    this.url = url
    this.title = title
  }
}


@Entry
@Component
struct Index {
  @State title: string = '页面列表'
  @State showPanel: boolean = false
  @Provide fontSize: number = 16
  @State message: string = 'Hello World'
  @State count: number = 0
  private router: Array<RouterInfo> = [
  // new RouterInfo('pages/LayoutPage', '布局方式'),
    new RouterInfo('pages/Second', '路由传值'),
    new RouterInfo('pages/NotificationDemo', '几种通知'),
    // new RouterInfo('pages/ProductList', '产品列表-线性'),
    // new RouterInfo('pages/ProductList2', 'List使用'),
    new RouterInfo('pages/ProductList3', 'List-代码优化'),
    new RouterInfo('pages/StatePage', '状态管理-State'),
    new RouterInfo('pages/PropPage', '任务列表'),
    new RouterInfo('pages/PropPage2', '任务列表-多种状态管理'),
    new RouterInfo('pages/ImagePage', '图片展示'),
    new RouterInfo('pages/AnimationPage', '小鱼动画案例按钮版'),
    new RouterInfo('pages/AnimationPage2', '小鱼动画案例摇杆版'),
    new RouterInfo('pages/LifeCirclePage', '生命周期案例1'),
    new RouterInfo('pages/TestPage1', '生命周期案例2'),
    new RouterInfo('pages/DocumentListPage', 'UIAbility启动模式案例'),
    new RouterInfo('pages/ShopPage', '查询商铺案例'),
  ]
  tag: string = 'Index Page'

  async aboutToAppear() {
    console.log(this.tag, 'about to appear')
    //读取数据
    this.fontSize = preferencesUtil.getPreferenceValue('MyApplication','IndexFontSize',16)
  }

  onPageShow() {
    console.log(this.tag, 'on page show')
  }

  onBackPress() {
    console.log(this.tag, 'on back press')
  }

  onPageHide() {
    console.log(this.tag, 'on page hide')
  }

  aboutToDisappear() {
    console.log(this.tag, 'about to disappear')
  }

  build() {
    Row() {
      Column() {
        //标题
        this.Title()

        Text(this.message)
          // .lineHeight(90) //行高
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor('#36D')
          .onClick(() => {
            this.message = "Hello,ArkTS!"
          })
        Text($r('app.string.width_label'))
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        // TextInput({ placeholder: '请输入内容', text: 'itcast' })
        TextInput({ placeholder: '请输入内容' })
          .width('60%')
          .height(50)
          .backgroundColor('#FFF') //背景色
          .type(InputType.Password) //输入框类型
          .onChange((value) => {
            console.log(`输入的内容为:${value}`);
            //字符串转数字
            var num = parseInt(value);
            console.log(typeof num);
            //数字转字符串
            var str = num.toFixed(0); //0不要小数点
            var str2 = num.toString();
            console.log(typeof str);
            console.log(typeof str2);
          })
        Button(`点击了次${this.count}次`)
          .onClick(() => {
            this.count++;
          })
          .margin({ bottom: 10 })

        //自定义按钮
        Button() {
          Image($r('app.media.icon'))
            .width(20)
            .height(20)
            .margin(10)
        }

        Button(
          '跳转到第二个页面',
          // { type: ButtonType.Normal, stateEffect: true }
        )
          .margin({ top: 10 })
          .type(ButtonType.Normal)
          .stateEffect(true)
          .onClick(() => {
            console.info(`Succeeded in clicking the 'Next' button.`)
            // AlertDialog.show({
            //   title:"提示",
            //   message:"内容",
            //   cancel:(()=>{
            //
            //   })
            // })
            // 跳转到第二页
            router.pushUrl({ url: 'pages/Second', params: {
              src: "zhangsan"
            } }).then(() => {
              console.info('Succeeded in jumping to the second page.')
            }).catch((err) => {
              console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
            })
          })


        Button('跳转通知页面', { type: ButtonType.Normal })
          .onClick(() => {
            router.pushUrl({
              url: "pages/NotificationDemo"
            });
          })
          .margin({ top: 10 })
          .backgroundColor(Color.Blue)

        List({ space: 10 }) {
          ForEach(
            this.router,
            (item: RouterInfo, index: number) => {
              ListItem() {
                this.RouterItem(item, index + 1)
              }
            }
          )
        }
        .width('100%')
        .layoutWeight(1)
        .alignListItem(ListItemAlign.Center)
        .margin({ top: 10, bottom: 40 })

        //修改面板
        if (this.showPanel) {
          IndexFontSizePanel()
            .transition({
              translate: { y: 100 }
            })
        }

      }
      .width('100%')
      .backgroundColor(Color.White)
    }
    .height('100%')
    .backgroundColor(Color.White)

  }

  @Builder Title() {
    Row() {
      Text(this.title)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .height(80)
      Image($r('app.media.ic_public_settings'))
        .width(30)
        .onClick(() => {
          animateTo({ duration: 500, curve: Curve.EaseOut }, () => this.showPanel = !this.showPanel)
        })
    }
    .justifyContent(FlexAlign.SpaceAround)
    .width('100%')
  }

  @Builder RouterItem(r: RouterInfo, i: number) {
    Row() {
      Text(i + '.')
        .fontSize(this.fontSize)
        .fontColor(Color.White)
      Blank()
      Text(r.title)
        .fontSize(this.fontSize)
        .fontColor(Color.White)
    }
    .width('98%')
    .padding(12)
    .backgroundColor('#38f')
    .borderRadius(20)
    .onClick(() => {
      //router 跳转
      router.pushUrl(
        {
          url: r.url,
          params: {
            id: i,
            title: r.title
          }
        },
        router.RouterMode.Single,
        err => {
          if (err) {
            console.log(`路由失败：errCode:${err.code} errMsg:${err.message} `)
          }
        }
      )
    })
  }
}

