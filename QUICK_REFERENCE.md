# 内购更新快速参考

## 关键变更

### 产品ID（13个）
```
aibanid_1  → 10金币  ¥5
aibanid_2  → 20金币  ¥8
aibanid_3  → 30金币  ¥15
aibanid_4  → 50金币  ¥28
aibanid_5  → 80金币  ¥38
aibanid_6  → 100金币 ¥48
aibanid_7  → 150金币 ¥68
aibanid_8  → 200金币 ¥88
aibanid_9  → 250金币 ¥128
aibanid_10 → 300金币 ¥148
aibanid_11 → 350金币 ¥168
aibanid_12 → 400金币 ¥188
aibanid_13 → 500金币 ¥198
```

### 初始余额
```dart
99 金币 (原来是 5000)
```

### 入口位置
```
设置 → 金币充值 → 金币商城
```

### UI特点
- 列表布局（非网格）
- 渐变色卡片
- 类别图标
- 简洁"购买"按钮
- 价格在卡片内

### 文件修改
1. `lib/aibanIAP/LinstBundle.dart` - 产品定义
2. `lib/aibanIAP/LinstStoreView.dart` - UI重构
3. `lib/aibanIAP/LinstWalletService.dart` - 初始余额
4. `lib/screens/settings_screen.dart` - 入口添加
5. `pubspec.yaml` - 依赖添加

## 下一步

1. ✅ 代码已更新完成
2. ⏳ 在Apple后台配置13个产品ID
3. ⏳ 创建沙盒测试账号
4. ⏳ 在真机上测试购买流程
5. ⏳ 验证所有套餐可正常购买
6. ⏳ 提交审核

## 注意事项

- ⚠️ 不验证产品ID（确保Apple后台已配置）
- ⚠️ 保持原有iOS内购流程
- ⚠️ 无模拟充值功能
- ⚠️ 使用真实Apple IAP
