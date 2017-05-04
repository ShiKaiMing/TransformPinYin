# TransformPinYin
使用CFStringTransform汉字转拼音

##示范代码：
```
+ (NSString *)transformPinYinWithString:(NSString *)chinese
{
     NSString  * pinYinStr = [NSString string];
    if (chinese.length){
        NSMutableString * pinYin = [[NSMutableString alloc]initWithString:chinese];
        //1.先转换为带声调的拼音
        if(CFStringTransform((__bridge CFMutableStringRef)pinYin, NULL, kCFStringTransformMandarinLatin, NO)) {
            NSLog(@"带声调的pinyin: %@", pinYin);
        }
        //2.再转换为不带声调的拼音
        if (CFStringTransform((__bridge CFMutableStringRef)pinYin, NULL, kCFStringTransformStripDiacritics, NO)) {
            NSLog(@"不带声调的pinyin: %@", pinYin);
        }
        //3.去除掉首尾的空白字符和换行字符
        pinYinStr = [pinYin stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        //4.去除掉其它位置的空白字符和换行字符
        pinYinStr = [pinYinStr stringByReplacingOccurrencesOfString:@"\r" withString:@""];
        pinYinStr = [pinYinStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        pinYinStr = [pinYinStr stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSLog(@"去掉空白字符和换行字符的pinyin: %@", pinYinStr);
        [pinYinStr capitalizedString];

    }
    return pinYinStr;
}
```

字符串大小写转换，首字母大写(NSString.h)
```
@property (readonly, copy) NSString *uppercaseString;//大写
@property (readonly, copy) NSString *lowercaseString;//小写
@property (readonly, copy) NSString *capitalizedString;//首字母大写
```
 如果是要自己实现的话，需要考虑一下ASCII码，大小写之间的差值是32，A是65，a是97，代码如下：
 ```
 -(NSString *)toLower:(NSString *)str{
    for (NSInteger i=0; i<str.length; i++) {
        if ([str characterAtIndex:i]>='A'&[str characterAtIndex:i]<='Z') {
            //A  65  a  97
            char  temp=[str characterAtIndex:i]+32;
            NSRange range=NSMakeRange(i, 1);
            str=[str stringByReplacingCharactersInRange:range withString:[NSString stringWithFormat:@"%c",temp]];
        }
    }
    return str;
}
-(NSString *)toUpper:(NSString *)str{
    for (NSInteger i=0; i<str.length; i++) {
        if ([str characterAtIndex:i]>='a'&[str characterAtIndex:i]<='z') {
            //A  65  a  97
            char  temp=[str characterAtIndex:i]-32;
            NSRange range=NSMakeRange(i, 1);
            str=[str stringByReplacingCharactersInRange:range withString:[NSString stringWithFormat:@"%c",temp]];
        }
    }
    return str;
}
 ```

 字符串与数组相互转换
```
    NSArray *arrays = @[@"1,2,3,4,5,6"];
    NSString *string = [arrays componentsJoinedByString:@","];//数组转换成字符串,根据@","
    NSArray *array = [string componentsSeparatedByString:@","];//字符串转换成数组，根据@","
    NSLog(@"转换成的string：--- %@",string);
    NSLog(@"转换成的array：--- %@",array);
```
