Wasabi-Circos-Plot
==================

## 1. Prepare link.txt
~~~
cd minimap2
./minimap2.sh && ./make_link.sh
~~~

## 2. Prepare chr.txt and other datas
~~~
./prepare_LTR_percent.sh && ./prepare_Repeat_percent.sh && ./make_input.sh
~~~

## 3. Run circos
~~~
circos -conf main.conf
~~~
