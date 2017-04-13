waittext
========
##### Display updating line of text or textual waitbar in Matlab Command Window.
###### Version 1.0, 4-13-16
##### Download Repository: [ZIP Archive](https://github.com/horchler/waittext/archive/master.zip)

--------

[```waittext```](https://github.com/horchler/waittext/blob/master/waittext.m) is a fast full-featured text-based alternative to Matlab's GUI-based [```waitbar```](http://www.mathworks.com/help/matlab/ref/waitbar.html). See included help and [demos](https://github.com/horchler/waittext/tree/master/demos) for usage.  

```waittext``` is typically used inside of a ```for``` loop that performs a lengthy computation. ```waittext``` updates the current line very quickly. If a ```for``` loop takes less than 10 ms (0.01 sec.) to execute, it is reccomended that a textual waitbar be used or that ```waittext``` not be called every iteration in order for the updating text values to be more easily readable.  
&nbsp;  

--------

Andrew D. Horchler, *horchler @ gmail . com*, [biorobots.case.edu](http://biorobots.case.edu/)  
Created: 6-8-12, Revision: 1.0, 4-13-16  

This version tested with Matlab 9.0.0.341360 (R2016a)  
Mac OS X 10.11.4 (Build: 15E65), Java 1.7.0_75-b13  
Compatibility maintained back through Matlab 7.4 (R2007a)  
&nbsp;  

--------

Copyright &copy; 2012&ndash;2017, Andrew D. Horchler  
All rights reserved.  

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 * Neither the name of Case Western Reserve University nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL ANDREW D. HORCHLER BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.