# HTTP 头部解释

### Accept
- 告诉WEB服务器自己接受什么介质类型，*/* 表示任何类型，type/* 表示该类型下的所有子类型，type/sub-type。
- `Accept:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8`

### Accept-Charset
##### 浏览器申明自己接收的字符集
- Accept-Encoding: 浏览器申明自己接收的编码方法，通常指定压缩方法，是否支持压缩，支持什么压缩方法 （gzip，deflate）
-      Accept-Encoding: gzip, deflate
- Accept-Language: 浏览器申明自己接收的语言语言跟字符集的区别：中文是语言，中文有多种字符集，比如big5，gb2312，gbk等等。
- `Accept-Language:zh-CN,zh;q=0.8`


### Accept-Ranges
- WEB服务器表明自己是否接受获取其某个实体的一部分（比如文件的一部分）的请求。bytes：表示接受，none：表示不接受。

### Age
- 当代理服务器用自己缓存的实体去响应请求时，用该头部表明该实体从产生到现在经过多长时间了。

### Authorization
- 当客户端接收到来自WEB服务器的 WWW-Authenticate 响应时，该头部来回应自己的身份验证信息给WEB服务器。

### Cache-Control
#### 请求
- no-cache：（不要缓存的实体，要求现在从WEB服务器去取）
- max-age：（只接受 Age 值小于 max-age 值，并且没有过期的对象）
- max-stale：（可以接受过去的对象，但是过期时间必须小于max-stale 值）
- min-fresh：（接受其新鲜生命期大于其当前 Age 跟 min-fresh 值之和的缓存对象）
- `Cache-Control:no-cache`


####　响应
- public(可以用 Cached 内容回应任何用户)
- private（只能用缓存内容回应先前请求该内容的那个用户）
- no-cache（可以缓存，但是只有在跟WEB服务器验证了其有效后，才能返回给客户端）
- max-age：（本响应包含的对象的过期时间）
- ALL: no-store（不允许缓存）
- `Cache-Control:private, max-age=10`

### Connection
#### 请求
- close（告诉WEB服务器或者代理服务器，在完成本次请求的响应后，断开连接，不要等待本次连接的后续请求了）。
- keepalive（告诉WEB服务器或者代理服务器，在完成本次请求的响应后，保持连接，等待本次连接的后续请求）。

#### 响应
- close（连接已经关闭）。
- keepalive（连接保持着，在等待本次连接的后续请求）。
- Keep-Alive：如果浏览器请求保持连接，则该头部表明希望 WEB 服务器保持连接多长时间（秒）。例如：Keep-Alive：300

### Content-XXXXX
- Content-Encoding:WEB服务器表明自己使用了什么压缩方法（gzip，deflate）压缩响应中的对象。
- `Content-Encoding：gzip`
- Content-Language：WEB 服务器告诉浏览器自己响应的对象的语言。
- Content-Length： WEB 服务器告诉浏览器自己响应的对象的长度。
- Content-Range： WEB 服务器表明该响应包含的部分对象为整个对象的哪个部分。
- Content-Type： WEB 服务器告诉浏览器自己响应的对象的类型。
- `text/html; charset=utf-8`

### ETag
- 就是一个对象（比如URL）的标志值，就一个对象而言，比如一个 html 文件，如果被修改了，其 Etag 也会别修改，所以，ETag 的作用跟 Last-Modified 的作用差不多，主要供 WEB 服务器判断一个对象是否改变了。比如前一次请求某个 html 文件时，获得了其 ETag，当这次又请求这个文件时，浏览器就会把先前获得的 ETag 值发送给 WEB 服务器，然后 WEB 服务器会把这个 ETag 跟该文件的当前 ETag 进行对比，然后就知道这个文件有没有改变了。
  
### Expired
- WEB服务器表明该实体将在什么时候过期，对于过期了的对象，只有在跟WEB服务器验证了其有效性后，才能用来响应客户请求。是 HTTP/1.0 的头部。
-  `Expires:Tue, 04 Jul 2017 02:14:32 GMT`

### Host
- 客户端指定自己想访问的WEB服务器的域名/IP 地址和端口号。

### If-Match
- 如果对象的 ETag 没有改变，其实也就意味著对象没有改变，才执行请求的动作。

### If-None-Match
- 如果对象的 ETag 改变了，其实也就意味著对象也改变了，才执行请求的动作。

### If-Modified-Since
- 如果请求的对象在该头部指定的时间之后修改了，才执行请求的动作（比如返回对象），否则返回代码304，告诉浏览器该对象没有修改。

### If-Unmodified-Since
- 如果请求的对象在该头部指定的时间之后没修改过，才执行请求的动作（比如返回对象）。

### If-Range
- 浏览器告诉 WEB 服务器，如果我请求的对象没有改变，就把我缺少的部分给我，如果对象改变了，就把整个对象给我。浏览器通过发送请求对象的ETag 或者自己所知道的最后修改时间给 WEB 服务器，让其判断对象是否改变了。总是跟 Range 头部一起使用。
    
### Last-Modified
- WEB 服务器认为对象的最后修改时间，比如文件的最后修改时间，动态页面的最后产生时间等等。
- `last-modified:Sun, 02 Jul 2017 14:28:13 GMT`

### Location
- WEB 服务器告诉浏览器，试图访问的对象已经被移到别的位置了，到该头部指定的位置去取。

### Pramga
- 主要使用 Pramga: no-cache，相当于 Cache-Control： no-cache。

### Proxy-Authenticate
- 代理服务器响应浏览器，要求其提供代理身份验证信息。

### Proxy-Authorization
- 浏览器响应代理服务器的身份验证请求，提供自己的身份信息。

### Range
- 浏览器（比如 Flashget 多线程下载时）告诉 WEB 服务器自己想取对象的哪部分。
- `Range: bytes=1173546-`

### Referer
- 浏览器向 WEB 服务器表明自己是从哪个网页/URL 获得/点击当前请求中的网址/URL。

###  Server
- WEB 服务器表明自己是什么软件及版本等信息。
- `server:Coding Pages`

### User-Agent
- 浏览器表明自己的身份（是哪种浏览器）。
- `user-agent:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36`

### Transfer-Encoding
- WEB 服务器表明自己对本响应消息体（不是消息体里面的对象）作了怎样的编码，比如是否分块（chunked）。
- `Transfer-Encoding: chunked`

### Vary
- WEB服务器用该头部的内容告诉 Cache 服务器，在什么条件下才能用本响应所返回的对象响应后续的请求。假如源WEB服务器在接到第一个请求消息时，其响应消息的头部为：Content-Encoding: gzip; Vary: Content-Encoding 那么 Cache 服务器会分析后续请求消息的头部，检查其 Accept-Encoding，是否跟先前响应的 Vary 头部值一致，即是否使用相同的内容编码方法，这样就可以防止 Cache 服务器用自己Cache 里面压缩后的实体响应给不具备解压能力的浏览器。
- `vary:Accept-Encoding`

# HTTP消息头部实例
```
Request URL:https://zhangrxiang.coding.me/
Request Method:GET
Status Code:200 
Remote Address:23.248.162.190:443
Referrer Policy:no-referrer-when-downgrade
Response Headers
access-control-allow-origin:*
cache-control:max-age=600
content-encoding:gzip
content-length:411
content-type:text/html; charset=utf-8
date:Tue, 04 Jul 2017 02:40:35 GMT
last-modified:Sun, 02 Jul 2017 14:28:13 GMT
server:Coding Pages
status:200
vary:Accept-Encoding
Request Headers
:authority:zhangrxiang.coding.me
:method:GET
:path:/
:scheme:https
accept:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8
accept-encoding:gzip, deflate, br
accept-language:zh-CN,zh;q=0.8
cache-control:no-cache
cookie:OUTFOX_SEARCH_USER_ID_NCOO=1456937014.0649762; ___rl__test__cookies=1498813451387
pragma:no-cache
upgrade-insecure-requests:1
user-agent:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36
```

# HTTP头部信息简单说明

#### 响应码由三位十进制数字组成，它们出现在由HTTP服务器发送的响应的第一行。
- 1xx：信息，请求收到，继续处理
- 2xx：成功，行为被成功地接受、理解和采纳
- 3xx：重定向，为了完成请求，必须进一步执行的动作
- 4xx：客户端错误，请求包含语法错误或者请求无法实现
- 5xx：服务器错误，服务器不能实现一种明显无效的请求
```ini
100 继续 
101 分组交换协 
200 OK 
201 被创建 
202 被采纳
203 非授权信息 
204 无内容 
205 重置内容 
206 部分内容
300 多选项 
301 永久地传送 
302 找到 
303 参见其他
304 未改动 
305 使用代理 
307 暂时重定向 
400 错误请求
401 未授权 
402 要求付费 
403 禁止 
404 未找到
405 不允许的方法 
406 不被采纳 
407 要求代理授权
408 请求超时
409 冲突 
410 过期的 
411 要求的长度 
412 前提不成立
413 请求实例太大 
414 请求URI太大 
415 不支持的媒体类型
416 无法满足的请求范围 
417 失败的预期 
500 内部服务器错误
501 未被使用 
502 网关错误 
503 不可用的服务 
504 网关超时
505 HTTP版本未被支持
```


## HTTP头标
####  头标由主键/值对组成。它们描述客户端或者服务器的属性、被传输的资源以及应该实现连接。
1. 通用头标：即可用于请求，也可用于响应，是作为一个整体而不是特定资源与事务相关联。
2. 请求头标：允许客户端传递关于自身的信息和希望的响应形式。
3. 响应头标：服务器和于传递自身信息的响应。
4. 实体头标：定义被传送资源的信息。即可用于请求，也可用于响应。

- 头标格式：<name>:<value><CRLF>
- Accept 定义客户端可以处理的媒体类型，按优先级排序；在一个以逗号为分隔的列表中，可以定义多种类型和使用通配符。例如：Accept: image/jpeg,image/png,*/*Accept-Charset 定义客户端可以处理的字符集，按优先级排序；在一个以逗号为分隔的列表中，可以定义多种类型和使用通配符。例如：Accept-Charset: iso-8859-1,*,utf-8
- Accept-Encoding 定义客户端可以理解的编码机制。例如：Accept-Encoding:gzip,compress
- Accept-Language 定义客户端乐于接受的自然语言列表。例如：Accept-Language: en,de
- Accept-Ranges 一个响应头标，它允许服务器指明：将在给定的偏移和长度处，为资源组成部分的接受请求。该头标的值被理解为请求范围的度量单位。例如Accept-Ranges: bytes或Accept-Ranges: none
- Age 允许服务器规定自服务器生成该响应以来所经过的时间长度，以秒为单位。该头标主要用于缓存响应。例如：Age: 30
- Allow 一个响应头标，它定义一个由位于请求URI中的资源所支持的HTTP方法列表。例如：Allow: GET,PUT
- AUTHORIZATION 一个响应头标，用于定义访问一种资源所必需的授权（域和被编码的用户ID与口令）。例如：Authorization: Basic YXV0aG9yOnBoaWw=
- Cache-Control 一个用于定义缓存指令的通用头标。例如：Cache-Control: max-age=30
- Connection 一个用于表明是否保存socket连接为开放的通用头标。例如：Connection: close或Connection: keep-alive
- Content-Base 一种定义基本URI的实体头标，为了在实体范围内解析相对URLs。如果没有定义Content-Base头标解析相对URLs，使用Content- Location URI（存在且绝对）或使用URI请求。例如：Content-Base: http://www.myweb.com
- Content-Encoding 一种介质类型修饰符，标明一个实体是如何编码的。例如：Content-Encoding:
- zipContent-Language 用于指定在输入流中数据的自然语言类型。例如：Content-Language: en
- Content-Location 指定包含于请求或响应中的资源定位（URI）。如果是一绝。对URL它也作为被解析实体的相对URL的出发点。例如：Content-Location: http://www.myweb.com/news
- Content-MD5 实体的一种MD5摘要，用作校验和。发送方和接受方都计算MD5摘要，接受方将其计算的值与此头标中传递的值进行比较。例如：Content-MD5: <base64 of 128 MD5 digest>
- Content-Range 随部分实体一同发送；标明被插入字节的低位与高位字节偏移，也标明此实体的总长度。例如：Content-Range: 1001-2000/5000
- Content-Type 标明发送或者接收的实体的MIME类型。例如：Content-Type: text/html
- Date 发送HTTP消息的日期。例如：Date: Mon,10PR 18:42:51 GMT
- ETag 一种实体头标，它向被发送的资源分派一个唯一的标识符。对于可以使用多种URL请求的资源，ETag可以用于确定实际被发送的资源是否为同一资源。例如：ETag: '208f-419e-30f8dc99'
- Expires 指定实体的有效期。例如：Expires: Mon,05 Dec 2008 12:00:00 GMT
- Form 一种请求头标，给定控制用户代理的人工用户的电子邮件地址。例如：From: webmaster@myweb.com
- Host 被请求资源的主机名。对于使用HTTP/1.1的请求而言，此域是强制性的。例如：Host: www.myweb.com
- If-Modified-Since 如果包含了GET请求，导致该请求条件性地依赖于资源上次修改日期。如果出现了此头标，并且自指定日期以来，此资源已被修改，应该反回一个304响应代码。例如：If-Modified-Since: Mon,10PR 18:42:51 GMT
- If-Match 如果包含于一个请求，指定一个或者多个实体标记。只发送其ETag与列表中标记区配的资源。例如：If-Match: '208f-419e-308dc99'
- If-None-Match 如果包含一个请求，指定一个或者多个实体标记。资源的ETag不与列表中的任何一个条件匹配，操作才执行。例如：If-None-Match: '208f-419e-308dc99'
- If-Range 指定资源的一个实体标记，客户端已经拥有此资源的一个拷贝。必须与Range头标一同使用。如果此实体自上次被客户端检索以来，还不曾修改过，那么服务器只发送指定的范围，否则它将发送整个资源。例如：Range: byte=0-499<CRLF>If-Range:'208f-419e-30f8dc99'
- If-Unmodified-Since 只有自指定的日期以来，被请求的实体还不曾被修改过，才会返回此实体。例如：If-Unmodified-Since:Mon,10PR 18:42:51 GMT
- Last-Modified 指定被请求资源上次被修改的日期和时间。例如：Last-Modified: Mon,10PR 18:42:51 GMT
- Location 对于一个已经移动的资源，用于重定向请求者至另一个位置。与状态编码302（暂时移动）或者301（永久性移动）配合使用。例如：Location: http://www2.myweb.com/index.jsp
- Max-Forwards 一个用于TRACE方法的请求头标，以指定代理或网关的最大数目，该请求通过网关才得以路由。在通过请求传递之前，代理或网关应该减少此数目。例如：Max-Forwards: 3
- Pragma 一个通用头标，它发送实现相关的信息。例如：Pragma: no-cache
- Proxy-Authenticate 类似于WWW-Authenticate，便是有意请求只来自请求链（代理）的下一个服务器的认证。例如：Proxy-Authenticate: Basic realm-admin
- Proxy-Proxy-Authorization 类似于授权，但并非有意传递任何比在即时服务器链中更进一步的内容。例如：Proxy-Proxy-Authorization: Basic YXV0aG9yOnBoaWw=
- Public 列表显示服务器所支持的方法集。例如：Public: OPTIONS,MGET,MHEAD,GET,HEAD
- Range 指定一种度量单位和一个部分被请求资源的偏移范围。例如：Range: bytes=206-5513
- Referer 一种请求头标域，标明产生请求的初始资源。对于HTML表单，它包含此表单的Web页面的地址。例如：Refener: http://www.myweb.com/news/search.html
- Retry-After 一种响应头标域，由服务器与状态编码503（无法提供服务）配合发送，以标明再次请求之前应该等待多长时间。此时间即可以是一种日期，也可以是一种秒单位。例如：Retry-After: 18
- Server 一种标明Web服务器软件及其版本号的头标。例如：Server: Apache/2.0.46(Win32)
- Transfer-Encoding 一种通用头标，标明对应被接受方反向的消息体实施变换的类型。例如：Transfer-Encoding: chunked
- Upgrade 允许服务器指定一种新的协议或者新的协议版本，与响应编码101（切换协议）配合使用。例如：Upgrade: HTTP/2.0
- User-Agent 定义用于产生请求的软件类型（典型的如Web浏览器）。例如：User-Agent: Mozilla/4.0(compatible; MSIE 5.5; Windows NT; DigExt)
- Vary 一个响应头标，用于表示使用服务器驱动的协商从可用的响应表示中选择响应实体。例如：Vary: *Via 一个包含所有中间主机和协议的通用头标，用于满足请求。例如：Via: 1.0 fred.com, 1.1 wilma.com
- Warning 用于提供关于响应状态补充信息的响应头标。例如：Warning: 99 www.myweb.com Piano needs tuning

[from](http://www.cnblogs.com/poissonnotes/p/4844014.html)