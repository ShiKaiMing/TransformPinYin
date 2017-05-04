# TransformPinYin
使用CFStringTransform汉字转拼音

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
