# AS3Logger

初期化
```
Logger.initialize(Logger.LEVEL_ALL);
```
初期化がないとログが出ないです


```
Logger.trace();
Logger.debug();
Logger.info();
Logger.warning();
Logger.error();
Logger.fatal();
```

initialize 時に出力するレベルと出力先を設定します。

レベル : デフォルトは何も出力しない

レベルは下記のように必要な物だけ選択することも出来ます。
```
Logger.initialize(Logger.LEVEL_TRACE | Logger.LEVEL_INFO | Logger.LEVEL_FATAL);
```

下記のようにも設定できます。（Error 以外を出力）
```
Logger.initialize(parseInt("101111", 2));
```

## はき出せるログのタイプ

初期化の時に Logger を渡すことで trace 以外にもログをはき出すことができます。
Logger を渡さない場合には TraceLogger になります。

```
Logger.initialize(Logger.LEVEL_ALL, new <ILogger>[new TraceLogger(), new ConsoleLogger()]);
```

* trace
* [SOS Max](http://www.sos.powerflasher.com/developer-tools/sosmax/home/)
* Console.log
