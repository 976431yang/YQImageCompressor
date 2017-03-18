# YQImageCompressor
[![Build Status](https://travis-ci.org/976431yang/YQImageCompressor.svg?branch=master)](https://travis-ci.org/976431yang/YQImageCompressor)
[![Pod Version](https://img.shields.io/badge/pod-1.0.0-blue.svg)](http://cocoadocs.org/docsets/YQImageCompressor/)
[![Pod Platform](https://img.shields.io/badge/platform-ios-lightgray.svg)](http://cocoadocs.org/docsets/YQImageCompressor/)

#### 微博：畸形滴小男孩

##### iOS端简易图片压缩工具
- 结合了`“只压不缩”`和`“只缩不压”`来做的`“压缩”`，在保证达到压缩目标的同时尽量保证图片质量
- 由于尽可能得想要压缩出来的图片质量尽可能地高，可能压缩子程序要走很多遍，来找到最合适的情况。所以压缩耗时可能较长。推荐使用后台压缩方法
- 根据不同的情况提供了两种压缩结果：1，压缩得到目标大小的NSData；2，压缩得到目标大小的UIImage
- **提示：**在iOS端使用NSData创建得到的UIImage大小会比原NSData要大，所以根据具体需要目标大小的Data还是目标大小的Image，可以选择不同的方法。



#### 2种使用方法：
-下载文件直接拖到工程中使用,然后：
```objective-c
#import "YQImageCompressTool.h"
```
-使用CocoaPods:
```
Podfile: pod 'YQImageCompressor'
```
```objective-c
#import "YQImageCompressTool.h"
```
-------------------

### 调用目录：

#### ------------后台压缩（异步进行，不会卡住前台进程）
###### 后台压缩得到 目标大小的 图片Data

```objective-c
//OldImage  原图
//ShowSize  将要显示的分辨率
//FileSize  文件大小限制
//DataBlock 压缩成功后返回的block (使用block的结果，记得按需获取主线程)
+(void)CompressToDataAtBackgroundWithImage:(UIImage *)OldImage
                                  ShowSize:(CGSize)ShowSize
                                  FileSize:(NSInteger)FileSize
                                     block:(DataBlock)DataBlock;
```
###### 后台压缩得到 目标大小的 UIImage

```objective-c
//OldImage 原图
//ShowSize 将要显示的分辨率
//FileSize 文件大小限制
//ImgBlock 压缩成功后返回的block (使用block的结果，记得按需获取主线程)
+(void)CompressToImageAtBackgroundWithImage:(UIImage *)OldImage
                                   ShowSize:(CGSize)ShowSize
                                   FileSize:(NSInteger)FileSize
                                      block:(ImgBlock)ImgBlock;
```
<br />

#### ------------前台压缩（可能比较慢，造成当前进程卡住）

###### 压缩得到 目标大小的 图片Data
```objective-c
//OldImage 原图
//ShowSize 将要显示的分辨率
//FileSize 文件大小限制
+(NSData *)CompressToDataWithImage:(UIImage *)OldImage
                          ShowSize:(CGSize)ShowSize
                          FileSize:(NSInteger)FileSize;
```
###### 压缩得到 目标大小的 UIImage
```objective-c
//OldImage 原图
//ShowSize 将要显示的分辨率
//FileSize 文件大小限制
+(UIImage *)CompressToImageWithImage:(UIImage *)OldImage
                            ShowSize:(CGSize)ShowSize
                            FileSize:(NSInteger)FileSize;
```
<br /> 
 
#### ------------细化调用方法
##### 只压不缩--按UIImage大小压缩，返回UIImage
- **优点**：不影响分辨率，不太影响清晰度
- **缺点**：存在最小限制，可能压不到目标大小

```objective-c
+ (UIImage *)OnlyCompressToImageWithImage:(UIImage *)OldImage
                                 FileSize:(NSInteger)FileSize;
```

##### 只压不缩--按NSData大小压缩，返回NSData
- **优点**：不影响分辨率，不太影响清晰度
- **缺点**：存在最小限制，可能压不到目标大小

```objective-c
+ (NSData *)OnlyCompressToDataWithImage:(UIImage *)OldImage
                               FileSize:(NSInteger)FileSize;
```

##### 只缩不压
- **优点**：可以大幅降低容量大小
- **缺点**：影响清晰度

```objective-c
//若Scale为YES，则原图会根据Size进行拉伸-会变形
	//若Scale为NO，则原图会根据Size进行填充-不会变形
+(UIImage *)ResizeImageWithImage:(UIImage *)OldImage
                         andSize:(CGSize)Size
                           Scale:(BOOL)Scale;
```
