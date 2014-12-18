```
$ ruby aspector.rb
2014-12-18 16:21:58 +0000 | Aspector | INFO  | LoggingAspect | define-advice | advice 1: AROUND [/.*/] DO stuff in block WITH OPTIONS {:except=>[:class], :method_arg=>true}
2014-12-18 16:21:58 +0000 | Aspector | INFO  | LoggingAspect | apply | A | {}
>>> 70263463524840 A.test
test
>>> 70263463524340 A.test
test
>>> 70263463523720 A.test
test

```
Can't get to object id via proxy - bwah!
