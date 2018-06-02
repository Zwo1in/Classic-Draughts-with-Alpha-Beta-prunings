CX1FLAGS= -lsfml-graphics -lsfml-window -lsfml-system --std=c++14
CX2FLAGS= --std=c++14
 
__start__: ./draughts clean
	./draughts
 
./draughts: main.o draughts.o ai.o board.o
	g++ -o ./draughts main.o draughts.o ai.o board.o ${CX1FLAGS}

main.o: main.cpp draughts.hpp ai.hpp board.hpp
	g++ -c -o main.o main.cpp ${CX1FLAGS}

draughts.o: draughts.cpp draughts.hpp ai.hpp board.hpp
	g++ -c -o draughts.o draughts.cpp ${CX1FLAGS}

ai.o: ai.cpp ai.hpp board.hpp
	g++ -c -o ai.o ai.cpp ${CX2FLAGS}

board.o: board.cpp board.hpp
	g++ -c -o board.o board.cpp ${CX2FLAGS}
 
clean: 
	rm -f *.o
