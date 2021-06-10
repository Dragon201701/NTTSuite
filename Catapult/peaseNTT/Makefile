HLSDIR			= 	$(MGC_HOME)/shared/include
IDIR        	=  	-I include -I $(MGC_HOME)/shared/include
CCFLAGS 		=	-g -std=c++11
C_SRCS			=	$(wildcard src/*.cpp)
C_OBJS			=	$(C_SRCS:%.cpp=%.o)
OBJS			=	$(C_OBJS)
TARGET			=	ntt_tb.out
CC 				= 	$(MGC_HOME)/bin/g++

all:$(TARGET)

$(TARGET):$(OBJS)
	$(CC) -Wall -g -std=gnu++11 -o $@ $(OBJS) $(IDIR) 
clean:
	rm -f $(TARGET) $(OBJS)
