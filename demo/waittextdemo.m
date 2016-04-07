function waittextdemo
%WAITTEXTDEMO  Demo of WAITTEXT usage and functionality.
%   WAITTEXTDEMO runs a series of simple demonstrations that illustrate the
%   usage and functionality of the WAITTEXT function. An approximate
%   representaion of the repeated call to WAITTEXT is displayed avove the
%   output of each case.
%
%   See also WAITTEXT.

%   Andrew D. Horchler, adh9 @ case . edu, Created 6-14-12
%   Revision: 1.0, 6-14-12

% Inspired by:
% blogs.mathworks.com/loren/2007/08/01/monitoring-progress-of-a-calculation/#7


fprintf(1,'\n');

disp('waittext(x)')
waittext(0,'init');
for i = 0:101
    waittext(i);
    pause(0.02)
end
fprintf(1,'\n');

disp('waittext(x,''iteration'')')
waittext(0,'init');
for i = 0:101
    waittext(i,'iteration');
    pause(0.02)
end
fprintf(1,'\n');

disp('waittext(x,''percent'')')
waittext(0,'init');
for i = 0:100
    waittext(i,'percent');
    pause(0.02)
end
fprintf(1,'\n');

disp('waittext(x,''fraction'')')
waittext(0,'init');
for i = 0:101
    waittext(i/101,'fraction');
    pause(0.02)
end
fprintf(1,'\n');

disp('waittext(x,''countdown'')')
waittext(0,'init');
for i = 101:-1:0
    waittext(i,'countdown');
    pause(0.02)
end
fprintf(1,'\n');

disp('waittext(x,''waitbar'')')
waittext(0,'init')
for i = 0:101
    waittext(i/101,'waitbar')
    pause(0.02)
end
fprintf(1,'\n');

disp('waittext(x,''waitbar'',''>'')')
waittext(0,'init')
for i = 0:101
    waittext(i/101,'waitbar','>')
    pause(0.02)
end
fprintf(1,'\n');

disp('waittext(x,''waitbar'',25)')
waittext(0,'init')
for i = 0:101
    waittext(i/101,'waitbar',25)
    pause(0.02)
end
fprintf(1,'\n');

disp('waittext(x,''waitbar'',struct(''indicator'',''='',''length'',30,''prefix'',''Progress: ''))')
opts = struct('indicator','=','length',30,'prefix','Progress: ');
waittext(0,'init')
for i = 0:101
    waittext(i/101,'waitbar',opts)
    pause(0.02)
end
fprintf(1,'\n');

disp('waittext(x,''waitbar'',struct(''suffix'',['' '' int2str(100*(1-x)) ''% remaining...'']))')
waittext(0,'init')
for i = 0:101
    opts = struct('suffix',[' ' int2str(ceil(100-i*100/101)) '% remaining...']);
    waittext(i/101,'waitbar',opts)
    pause(0.02)
end
fprintf(1,'\n');

disp('waittext(msg)')
waittext(0,'init');
A = ver;
for i = 1:length(A)
    waittext(['Toolbox name: ' A(i).Name]);
    pause(0.1)
end
fprintf(1,'\n');

% From: http://stackoverflow.com/questions/2685435/cooler-ascii-spinners
disp('waittext(msg)')
waittext(0,'init');
sp = ' ';
x = 0;
for i = 0:200
    if mod(floor(i/25),2)
        x = x-1;
        waittext(['Console Fish! ' sp(ones(1,x)) '<''((<']);
    else
        x = x+1;
        waittext(['Console Fish! ' sp(ones(1,x)) '>))''>']);
    end
    pause(0.05)
end