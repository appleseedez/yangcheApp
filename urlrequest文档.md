URL加载系统
主要使用场景: 使得你的应用可以创建资源请求.下载资源
资源请求在coca中是用`NSURLRequest` 对象来表示的.它封装了一个URL和一组协议相关的属性
同时还提供了设置连接超时的接口以及缓存策略的接口.
`NSMutableURLRequest`是`NSURLRequest`的子类.允许客户端程序修改一个已经实例化的请求.

>> 注意.当客户端程序通过`NSMutableURLReqest`的实例来建立起连接或者下载资源时, 是对请求进行了深拷贝. 针对该实例设置将会对于已经建立的连接或者开始的下载无效.

 coca中的@protocol 例如HTTP 必须在`NSURLRequest`和`NSMutableURLRequest`上创建Category来提供对于http协议规定的属性进行访问的方法.这些方法暴露在`NSURLProtocol`类中.
 
 从服务器返回的响应可以分成两部分: meta信息和URL资源数据. 其中meta信息封装在`NSURLResponse`类中.
 包含 MIME,content-length,编码方式(可以修改),以及URL地址.通过集成`NSURLResponse` 具体的@protocol可以存储对应协议规定的meta信息. 例如`NSHTTPResponse` 就包含headers和status code

>> 注意:NSURLResponse`仅存储response的meta数据. 而像`NSCachedURLResponse`的实例封装的是`NSURLResponse`,URL资源数据,以及应用提供的信息.


