import router from '@ohos.router'
import notification from '@ohos.notificationManager';
import image from '@ohos.multimedia.image';

@Entry
@Component
struct NotificationDemo {
  //发布普通文本类型通知，需要设置contentType类型为ContentType.NOTIFICATION_CONTENT_BASIC_TEXT。
  publishNotification() {
    let notificationRequest: notification.NotificationRequest = {
      //描述通知请求
      id: 1, //通知ID
      slotType: notification.SlotType.SERVICE_INFORMATION,

      content: {
        contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT, //普通文本类型通知
        normal: {
          title: "通知内容标题",
          text: "通知内容详情",
          additionalText: "通知附加内容", //通知附加内容，是对通知的内容补充
        }
      }

    }
    notification.publish(notificationRequest).then(() => {
      //发布通知
      console.log("publish success");
    }).catch((err) => {
      console.error(`publish failed,dcode:${err.code},message:${err.message}`)
    })
  }
  //发布图片类型通知，需要设置contentType类型为ContentType.NOTIFICATION_CONTENT_PICTURE
  async publishPictureNotification() {
    //将资源图片转化为PixelMap对象
    let resourceManager = getContext(this).resourceManager;
    let imageArray = await resourceManager.getMediaContent($r('app.media.bigPicture').id);
    let imageResource = image.createImageSource(imageArray.buffer);
    let pixelMap = await imageResource.createPixelMap();
    let notificationRequest: notification.NotificationRequest = {
      id: 1,
      content: {
        contentType: notification.ContentType.NOTIFICATION_CONTENT_PICTURE,
        picture: {
          title: "好物热销中",
          text: "展开查看详情", //通知内容
          expandedTitle: "今日热门推荐", //通知展开时的内容标题
          briefText: '这里一定有您喜欢的', //通知概要内容，是对通知内容的总结
          picture: pixelMap //通知的图片内容
        }
      }
    }
    notification.publish(notificationRequest).then(() => {
      //发布通知
      console.info('publish success');
    }).catch((err) => {
      console.error(`publish failed,dcode:${err.code},message:${err.message}`);
    })
  }

  build() {

    Column() {

      Button('发送普通文本通知', { type: ButtonType.Normal })
        .onClick(() => {
          this.publishNotification();
        })

      Button('发送大图通知')
        .onClick(() => {
          console.log("发送大图通知～～～～");
          this.publishPictureNotification();
        })
        .margin({ top: 10 })

      Button('返回', { type: ButtonType.Normal })
        .onClick(() => {
          router.back();
        })
        .margin({ top: 10 })

    }
    .width('100%')
    .height('100%')
    .margin({ top: 10 })
    .backgroundColor(Color.White)
    .justifyContent(FlexAlign.Center)

  }
}