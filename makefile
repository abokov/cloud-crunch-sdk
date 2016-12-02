
# place for g++ generated binaries - object files, libs and executables
BIN_DIR = bin

#specify compiler name
CC = g++


PROJECT_DIR = $(shell pwd)
#compiler flags 
CFLAGS = -fpic -fexceptions -c $(INCLUDES) -o$@
INCLUDES = -I$(PROJECT_DIR)


# crunch api dir
CRUNCH_API_DIR=crunch-api
CRUNCH_API_OBJS=$(BIN_DIR)/crunch-api.o

# entry data dir
ENTRY_DATA_DIR=entry-data
ENTRY_DATA_OBJS = $(BIN_DIR)/entry-data.o

#-----------------------------------------------------------------------------------------------------
CLOUD_CRUNCH_SDK_EXECUTABLE = $(BIN_DIR)/cloud-crunch-sdk.bin
#--  CLOUD_CRUNCH_SDK_LIB = $(BIN_DIR)/cloud-crunch-sdk.lib

CLOUD_CRUNCH_OBJS_MAIN = $(BIN_DIR)/cloud-crunch-sdk.o $(CRUNCH_API_OBJS) $(ENTRY_DATA_OBJS)


#-----------------------------------------  target's part -------------------------------------------------

all: $(BIN_DIR) $(CLOUD_CRUNCH_SDK_EXECUTABLE)

#create bin dir if it not exists
$(BIN_DIR):
	mkdir -p $@
 
#common files

#crunch api dir
$(BIN_DIR)/crunch-api.o : $(CRUNCH_API_DIR)/crunch-api.cpp  $(CRUNCH_API_DIR)/crunch-api.h
	$(CC) $(CFLAGS) $(CRUNCH_API_DIR)/crunch-api.cpp

#entry data
$(BIN_DIR)/entry-data.o :	$(ENTRY_DATA_DIR)/entry-data.cpp	$(ENTRY_DATA_DIR)/entry-data.h
	$(CC) $(CFLAGS) $(ENTRY_DATA_DIR)/entry-data.cpp


#main binary
$(BIN_DIR)/cloud-crunch-sdk.o:
	$(CC) $(CFLAGS) cloud-crunch-sdk.cpp 


# ------------------------------------------------------------------------------------
# make executable
cmd_line:
$(CLOUD_CRUNCH_SDK_EXECUTABLE):    $(CLOUD_CRUNCH_OBJS_MAIN)
	$(CC) $(CLOUD_CRUNCH_OBJS_MAIN) -o $(CLOUD_CRUNCH_SDK_EXECUTABLE)


# clean them all - g++ objs and binaries, generated header and compiled java classes
clean:
	rm -f $(BIN_DIR)/*
	

#copy binaries from output dir onto their proprietary location	
copy:	

	

