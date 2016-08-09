#YQImageCompressor
###微博：畸形滴小男孩

iOS端简易图片压缩工具

####使用方法：直接拖到工程中使用
-------------------

####------------前台压缩（可能比较慢，造成当前进程卡住）

######压缩得到 目标大小的 图片Data
```objective-c
//OldImage 原图
	//ShowSize 将要显示的分辨率
	//FileSize 文件大小限制
	+(NSData *)CompressToDataWithImage:(UIImage *)OldImage
                          ShowSize:(CGSize)ShowSize
                          FileSize:(NSInteger)FileSize;
```
######压缩得到 目标大小的 UIImage
```objective-c
//OldImage 原图
	//ShowSize 将要显示的分辨率
	//FileSize 文件大小限制
	+(UIImage *)CompressToImageWithImage:(UIImage *)OldImage
                            ShowSize:(CGSize)ShowSize
                            FileSize:(NSInteger)FileSize;
```
<br /> 
####------------后台压缩（异步进行，不会卡住前台进程）
######后台压缩得到 目标大小的 图片Data

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
######后台压缩得到 目标大小的 UIImage

```objective-c
//OldImage 原图
	//ShowSize 将要显示的分辨率
	//FileSize 文件大小限制
	//ImgBlock 压缩成功后返回的block
	+(void)CompressToImageAtBackgroundWithImage:(UIImage *)OldImage
                                        ShowSize:(CGSize)ShowSize
                                        FileSize:(NSInteger)FileSize
                                           block:(ImgBlock)ImgBlock;
```
<br /> 
###------------细化调用方法
#####只压不缩--按UIImage大小压缩，返回UIImage
- **优点**：不影响分辨率，不太影响清晰度
- **缺点**：存在最小限制，可能压不到目标大小
```objective-c
+ (UIImage *)OnlyCompressToImageWithImage:(UIImage *)OldImage
                                 FileSize:(NSInteger)FileSize;
```

#####只压不缩--按NSData大小压缩，返回NSData
- **优点**：不影响分辨率，不太影响清晰度
- **缺点**：存在最小限制，可能压不到目标大小
```objective-c
+ (NSData *)OnlyCompressToDataWithImage:(UIImage *)OldImage
                               FileSize:(NSInteger)FileSize;
```

#####只缩不压
- **优点**：可以大幅降低容量大小
- **缺点**：影响清晰度

```objective-c
//若Scale为YES，则原图会根据Size进行拉伸-会变形
	//若Scale为NO，则原图会根据Size进行填充-不会变形
+(UIImage *)ResizeImageWithImage:(UIImage *)OldImage
                         andSize:(CGSize)Size
                           Scale:(BOOL)Scale;
```
