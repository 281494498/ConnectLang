# ConnectLang
module connect DSL

our grammar would be 

```
block1 = Constant()
block2 = Constant()
block3 = Adder()
block1.output -> block3.input1
block2.output -> block3.input2
```
