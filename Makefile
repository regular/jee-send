# rfm12b-linux: linux kernel driver for the rfm12(b) RF module by HopeRF
# Copyright (C) 2013 Georg Kaindl
# 
# This file is part of rfm12b-linux.
# 
# rfm12b-linux is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
# 
# rfm12b-linux is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with rfm12b-linux.  If not, see <http://www.gnu.org/licenses/>.

INCLUDE = $(HOME)/dev/rfm12b-linux
SRC = common/common.c
OBJ = $(SRC:.c=.o)

SRC_PROG = rfm12b_jeenode.c
OBJ_PROG = $(SRC_PROG:.c=.o)

dir=@mkdir -p bin

rfm12b_jeenode: rfm12b_jeenode.o $(OBJ)
	$(dir)
	gcc $< $(OBJ) -o bin/$@      

.c.o:
	gcc -I $(INCLUDE) -c $< -o $@    

clean:
	rm -f $(OBJ) $(OBJ_PROG)
	rm -rf bin
