# 使用说明
ffmpeg android平台编译脚本及库文件。集成了用于处理MP3的Lame，处理aac的fdk-aac，x264及openssl。

## 环境及准备：
+ 优先使用Linux系统。windows下安装msys2，在编译X264时共享库生成不成功。
+ 下载NDK及各库源码。
+ 将源码放到对应的目录中。或者自行修改脚本，使源码路径正确。
+ 修改config.sh中的ANDROID_NDK_ROOT为正确的NDK目录。
+ 如果想编译其他API版本，修改AOSP_API。

## 编译：
 ### 注意，单独编译各库时，要先编译lame,openssl,x264,fdk-acc，最后再编译FFmpeg，因为FFmpeg要链接其他的库。

 - ### 单独编译每个库
  
   - #### 单独编译为对应平台的库：
     示例：
     切换终端至脚本目录，执行：lame.sh arm64-v8a。将编译armc64-v8a平台的lame。可编译的平台有：armeabi-v7a、arm64-v8a、x86、x86_64，可选其一进行编译。其他库同理。
   - #### 一次性编译所有平台的库：
     执行lame_all.sh可编译所有平台的lame。其他库同理。
 - ### 一次性编译所有平台所有的库
   直接执行 all.sh，不需管编译顺序。
   
 ## 输出位置：
   编译后会生成一个libs目录，编译后的库都输出到其中。
   

