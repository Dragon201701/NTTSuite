CC=g++
NVCC=nvcc
CPP=$(wildcard src/*.cpp)
CU=$(wildcard src/*.cu)
OBJ=$(CPP:.cpp=.o)
DEPS=$(wildcard include/*.h)

all: ntt

ntt: $(CPP) $(CU) $(DEPS)
	$(NVCC) -o $@  $(CU) $(CPP) -Iinclude

#gpuCode.o: $(OBJ) ntt.o
#	#@echo $(OBJ)
#	#$(NVCC) -dlink -o $@ $^ -Iinclude
#
#%.o: %.cpp $(DEPS)
#	#$(NVCC) -c -o $@ $< -Iinclude
#
#ntt.o: $(CU) $(DEPS) 
#	#$(NVCC) -c -o $@ $< -Iinclude
#
clean:
	rm -rfv $(OBJ) ntt
