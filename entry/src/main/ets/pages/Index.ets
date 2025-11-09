// 定义图标数据类型
interface FunctionIcon {
  icon: ResourceStr; // 图标路径（本地资源或网络地址）
  title: string; // 功能标题
  }
@Entry
@Component
struct Index {

  private icons: FunctionIcon[] = [
    { icon: $r('app.media.xueshengdalibao'), title: '学生大礼包' },
    { icon: $r('app.media.wodekecheng'), title: '我的课程' },
    { icon: $r('app.media.shoujianxiang'), title: '收件箱' },
    { icon: $r('app.media.shenpizhushou'), title: '审批助手' },
    { icon: $r('app.media.yidongdaunkaoshiliebiao'),title: '移动端考试列表' },
    { icon: $r('app.media.yingyongzhongxin'), title: '应用中心' },
    { icon: $r('app.media.daiban'), title: '待办' },
  ];

  build() {
    Tabs({ barPosition: BarPosition.End }) {
      TabContent() {
        Column() {
          Flex({ justifyContent: FlexAlign.End }) {
            Row() {
              Text('首页')
                .fontSize(30)
                .fontWeight(FontWeight.Bold)
            }
            .margin({ right: 100 })

            Column() {
              Image($r('app.media.saoma'))
                .width(30)
                .height(30)

              Text('邀请码')
                .fontSize(10)
                .fontWeight(FontWeight.Medium)
            }
          }
          .width('90%')

          // 2. 搜索框
          Search({ placeholder: '搜索' })
            .width('90%')
            .height(40)
            .backgroundColor('#F5F5f9')
            .borderRadius(10)
            .margin({ top: 8, bottom: 8 });

          // 轮播图广告
          Column() {
            Image($r('app.media.xuexitongtubiao'))
              .width('90%')
              .height(140)
              .margin({ top: 10 })
              .borderRadius(10)
          }

          Grid() {
            ForEach(this.icons, (item: FunctionIcon) => {
              GridItem() {
                // 每个图标项：图标在上，标题在下（纵向排列）
                Column() {
                  Image(item.icon)
                    .width(40)
                    .height(40)
                    .margin({ bottom: 8 }) // 图标与标题间距

                  Text(item.title)
                    .fontSize(14)
                    .fontWeight(FontWeight.Medium)
                }
                .width('100%')
                .height(80) // 固定高度（图标40 + 标题 + 间距）
                .justifyContent(FlexAlign.Center) // 整体纵向居中
              }
            }, (item: FunctionIcon) => item.title) // 唯一键：确保渲染稳定性
          }
          .columnsTemplate('1fr 1fr 1fr 1fr') // 设置为4列，每列宽度为1fr（平分宽度）
          .width('100%') // 占满屏幕宽度
          .height(250) // 关键：限制 Grid 高度为 250px，避免撑满
          .padding({ left: 15, right: 15, top: 10 }) // 左右内边距，避免边缘图标贴边
        }
        .height('100%')
        .justifyContent(FlexAlign.Start)
      }
      .tabBar('首页')
      TabContent() {
        Text('推荐的内容').fontSize(30)
      }
      .tabBar('推荐')

      TabContent() {
        Text('发现的内容').fontSize(30)
      }
      .tabBar('发现')

      TabContent() {
        Text('我的内容').fontSize(30)
      }
      .tabBar("我的")
    }
      .width('100%')
      .height('100%')
    }
  }


