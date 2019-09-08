
![VultPlayground](/images/VultPlayground.png?raw=true "Vult Playground")


Start-point to write your own plugins using the Vult language

# How to use

Before starting, check the following resources.

- [Vult Tutorials](http://modlfo.github.io/vult/tutorials/)
- [VCV Rack Plugin Development Tutorial](https://vcvrack.com/manual/PluginDevelopmentTutorial.html)
- [Programming Modules for VCV Rack (videos)](https://www.youtube.com/watch?v=7Z7LHAnIIac&list=PLL6GflKb0MpHeYE3RhDJWlYJ9NGWVnbXF)
- [Modeling Basics (videos)](https://www.youtube.com/watch?v=xQYLBS9R_uA&list=PLL6GflKb0MpE9aI0Qruo7vqeDuErVChSx)

## Installing the Vult compiler

In order to modify the Vult code, you need to have the Vult compiler installed. You can download the binaries from the [releases page](https://github.com/modlfo/vult/releases) and place them in the project folder or add it to your path.

Alternatively, you can install the Vult compiler using `npm` but this version of the compiler is slower.

```
$ npm install vult -g
```

## Modifying the code

All the code is contained in the file `processor.vult`. This file contains the function `process` that receives four inputs and returns four outputs. Here are a few code examples:

Four Channels Mixer
```
fun process(in1:real, in2:real, in3:real, in4:real) {
   mem param1, param2, param3, param4;
   val out1, out2, out3, out4 = 0.0, 0.0, 0.0, 0.0;

   // all inputs mixed to out1
   out1 = in1 * param1 + param2 * in2 + param3 * in3 + param4 * in3;

   return out1, out2, out3, out4;
}
```

Simple VCA
```
fun process(in1:real, in2:real, in3:real, in4:real) {
   mem param1, param2, param3, param4;
   val out1, out2, out3, out4 = 0.0, 0.0, 0.0, 0.0;

   out1 = in1 * in2;

   return out1, out2, out3, out4;
}
```
