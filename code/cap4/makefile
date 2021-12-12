esbn1: esbn1.o
	g++ esbn1.o -o esbn1

esbn1.o: esbn1.s
	as -g -o esbn1.o esbn1.s

esbn2: esbn2.o
	g++ esbn2.o -o esbn2

esbn2.o: esbn2.s
	as -g -o esbn2.o esbn2.s
	
esbn3: esbn3.o
	g++ esbn3.o -o esbn3

esbn3.o: esbn3.s
	as -g -o esbn3.o esbn3.s

esbn2: esbn5.o
	g++ esbn5.o -o esbn5

esbn5.o: esbn5.s
	as -g -o esbn5.o esbn5.s
	
clean:
	rm esbn1.o esbn1 esbn2.o esbn2 esbn3.o esbn3 esbn5.o esbn5
