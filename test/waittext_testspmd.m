function waittext_testspmd(benchmark)
%WAITTEXT_TESTSPMD  Suite of unit tests and benchmarks for WAITTEXT spmd mode. 
%   WAITTEXT_TESTSPMD is used for development of the WAITTEXT function and runs
%   a series of unit tests to confirm proper operation of the spmd mode.
%
%   WAITTEXT_TESTSPMD(BENCHMARK) when BENCHMARK is true runs a series of
%   benchmarks that compare usage of WAITTEXT to a FOR loop with no printing and
%   the WAITBAR function.
%
%   See also WAITTEXT, WAITBAR, SPMD.

%   Andrew D. Horchler, adh9 @ case . edu, Created 6-22-12
%   Revision: 1.0, 6-23-12

% Inspired by:
% blogs.mathworks.com/loren/2007/08/01/monitoring-progress-of-a-calculation/#7


isBenchmark = false;
if nargin > 0
    if ~islogical(benchmark)
        error('waittext:waittext_testspmd:NonLogicalBenchmark',...
              'Input must be a logical value (true or false).');
    end
    isBenchmark = benchmark;
end

clc;
test = 0;
if isBenchmark
    n = 100;
    
	% Zero pause for tight loop
	p = 0;
    spmd
        test = test+1;
        waittext(0,'init','spmd',1)
        waittext(['Benchmark ' int2str(test) ...
            ': tight loop, FOR loop with no printing.'],'spmd',1)
        for i = 0:n
            pause(p)
        end
        tic
        for i = 0:n
            pause(p)
        end
        waittext(0,'init')
        waittext(['Elapsed time is ' num2str(gop(@max,toc,1)) ' seconds.'],...
            'spmd',1)
        
        test = test+1;
        waittext(0,'init')
        waittext(0,'init')
        waittext(['Benchmark ' int2str(test) ...
            ': tight loop, waittext(x,''fraction'')'],'spmd',1)
        waittext(0,'init')
        for i = 0:n
            pause(p)
            waittext(i/n,'fraction','spmd','all')
        end
        waittext(0,'clear','spmd',1)
        tic
        waittext(0,'init')
        for i = 0:n
            pause(p)
            waittext(i/n,'fraction','spmd','all')
        end
        waittext(0,'clear','spmd',1)
        waittext(0,'init')
        waittext(['Elapsed time is ' num2str(gop(@max,toc,1)) ' seconds.'],...
            'spmd',1)
        
        test = test+1;
        waittext(0,'init')
        waittext(0,'init')
        waittext(['Benchmark ' int2str(test) ...
            ': tight loop, waittext(x,''waitbar'')'],'spmd',1)
        waittext(0,'init')
        for i = 0:n
            pause(p)
            waittext(i/n,'waitbar','spmd','all')
        end
        waittext(0,'clear','spmd',1)
        tic
        waittext(0,'init')
        for i = 0:n
            pause(p)
            waittext(i/n,'waitbar','spmd','all')
        end
        waittext(0,'clear','spmd',1)
        waittext(0,'init')
        waittext(['Elapsed time is ' num2str(gop(@max,toc,1)) ' seconds.'],...
            'spmd',1)
    end
    
    test = test{1}+1;
    fprintf(1,'\n');
    disp(['Benchmark ' int2str(test) ': tight loop, waitbar(x), not in spmd'])
    h = waitbar(0);
    for i = 0:n
        pause(p)
        waitbar(i/n)
    end
    close(h);
    tic
    h = waitbar(0);
    for i = 0:n
        pause(p)
        waitbar(i/n)
    end
    close(h);
    toc
    fprintf(1,'\n');
    
    % Make sure waitbar is closed before spmd
    drawnow
    
    % Change to slower loop
    p = 0.05;
    spmd
        test = test+1;
        waittext(0,'init','spmd',1)
        waittext(['Benchmark ' int2str(test) ': FOR loop with no printing.'],...
            'spmd',1)
        for i = 0:n
            pause(p)
        end
        tic
        for i = 0:n
            pause(p)
        end
        waittext(0,'init')
        waittext(['Elapsed time is ' num2str(gop(@max,toc,1)) ' seconds.'],...
            'spmd',1)
        
        test = test+1;
        waittext(0,'init')
        waittext(0,'init')
        waittext(['Benchmark ' int2str(test) ': waittext(x,''fraction'')'],...
            'spmd',1)
        waittext(0,'init')
        for i = 0:n
            pause(p)
            waittext(i/n,'fraction','spmd','all')
        end
        waittext(0,'clear','spmd',1)
        tic
        waittext(0,'init')
        for i = 0:n
            pause(p)
            waittext(i/n,'fraction','spmd','all')
        end
        waittext(0,'clear','spmd',1)
        waittext(0,'init')
        waittext(['Elapsed time is ' num2str(gop(@max,toc,1)) ' seconds.'],...
            'spmd',1)
        
        test = test+1;
        waittext(0,'init')
        waittext(0,'init')
        waittext(['Benchmark ' int2str(test) ': waittext(x,''waitbar'')'],...
            'spmd',1)
        waittext(0,'init')
        for i = 0:n
            pause(p)
            waittext(i/n,'waitbar','spmd','all')
        end
        waittext(0,'clear','spmd',1)
        tic
        waittext(0,'init')
        for i = 0:n
            pause(p)
            waittext(i/n,'waitbar','spmd','all')
        end
        waittext(0,'clear','spmd',1)
        waittext(0,'init')
        waittext(['Elapsed time is ' num2str(gop(@max,toc,1)) ' seconds.'],...
            'spmd',1)
    end
    
    test = test{1}+1;
    fprintf(1,'\n');
    disp(['Benchmark ' int2str(test) ': tight loop, waitbar(x), not in spmd'])
    h = waitbar(0);
    for i = 0:n
        pause(p)
        waitbar(i/n)
    end
    close(h);
    tic
    h = waitbar(0);
    for i = 0:n
        pause(p)
        waitbar(i/n)
    end
    close(h);
  	toc
    fprintf(1,'\n');
    
    disp(['WAITTEXT_TESTSPMD: ' int2str(test) ' benchmarks successfully '...
      'completed.']);
else
    spmd
        % Test default
        waittext(0,'init','spmd',1);
        for i = 0:101
            waittext(i,'spmd','all');
            pause(0.02)
        end
        test = test+1;
        waittext(['Test ' int2str(test) '... Done.'],'spmd',1);
        
        % Test message by passing escape characters
        waittext(0,'init')
        for i = 0:100
            waittext(['Message #' int2str(i) '% ''\'],'spmd','all')
            pause(0.02)
        end
        test = test+1;
        waittext(['Test ' int2str(test) '... Done.'],'spmd',1);
        
        % Test iteration
        waittext(0,'init');
        for i = 0:101
            waittext(i,'iteration','spmd','all');
            pause(0.02)
        end
        test = test+1;
        waittext(['Test ' int2str(test) '... Done.'],'spmd',1);
        
        % Test percent
        waittext(0,'init');
        for i = 0:100
            waittext(i,'percent','spmd','all');
            pause(0.02)
        end
        test = test+1;
        waittext(['Test ' int2str(test) '... Done.'],'spmd',1);
        
        % Test fraction
        waittext(0,'init');
        for i = 0:101
            waittext(i/101,'fraction','spmd','all');
            pause(0.02)
        end
        test = test+1;
        waittext(['Test ' int2str(test) '... Done.'],'spmd',1);
        
        % Test countdown
        waittext(0,'init');
        for i = 101:-1:0
            waittext(i,'countdown','spmd','all');
            pause(0.02)
        end
        test = test+1;
        waittext(['Test ' int2str(test) '... Done.'],'spmd',1);
        
        % Test default waitbar
        waittext(0,'init')
        for i = 0:101
            waittext(i/101,'waitbar','spmd','all')
            pause(0.02)
        end
        test = test+1;
        waittext(['Test ' int2str(test) '... Done.'],'spmd',1);
        
        % Test waitbar with escape character as indicator
        waittext(0,'init')
        for i = 0:101
            waittext(i/101,'waitbar','%','spmd','all')
            pause(0.02)
        end
        test = test+1;
        waittext(['Test ' int2str(test) '... Done.'],'spmd',1);
        
        % Test waitbar with escape character as indicator
        waittext(0,'init')
        for i = 0:101
            waittext(i/101,'waitbar','\','spmd','all')
            pause(0.02)
        end
        test = test+1;
        waittext(['Test ' int2str(test) '... Done.'],'spmd',1);
        
        % Test waitbar with escape character as indicator
        waittext(0,'init')
        for i = 0:101
            waittext(i/101,'waitbar','''','spmd','all')
            pause(0.02)
        end
        test = test+1;
        waittext(['Test ' int2str(test) '... Done.'],'spmd',1);
        
        % Test waitbar with maximum custom length
        waittext(0,'init')
        for i = 0:101
            waittext(i/101,'waitbar',78,'spmd','all')
            pause(0.02)
        end
        test = test+1;
        waittext(['Test ' int2str(test) '... Done.'],'spmd',1);
        
        % Test waitbar with prefix and suffix using escape characters
        opts = struct('prefix','Waiting: \''%','suffix',' \''% ');
        waittext(0,'init')
        for i = 0:101
            waittext(i/101,'waitbar',opts,'spmd','all')
            pause(0.02)
        end
        test = test+1;
        waittext(['Test ' int2str(test) '... Done.'],'spmd',1);
        
        % Test waitbar with custom indicator, length, and prefix
        opts = struct('indicator','>','length',25,'prefix','Waiting: ');
        waittext(0,'init')
        for i = 0:101
            waittext(i/101,'waitbar',opts,'spmd','all')
            pause(0.02)
        end
        test = test+1;
        waittext(['Test ' int2str(test) '... Done.'],'spmd',1);
        
        % Test waitbar with custom indicator, length, prefix, and suffix
        opts = struct('indicator','=','length',30,'prefix','Waiting: ',...
            'suffix',' !!');
        waittext(0,'init')
        for i = 0:101
            waittext(i/101,'waitbar',opts,'spmd','all')
            pause(0.02)
        end
        test = test+1;
        waittext(['Test ' int2str(test) '... Done.'],'spmd',1);
        
        % Test catching of warnings
        waittext(0,'init');
        for i = 0:101
            waittext(i,'spmd','all');
            if i == 50
                warning('waittext:waittext_testspmd:WarningCatchTest',...
                        'Testing Warning Catch')
            end
            pause(0.02)
        end
        test = test+1;
        waittext(['Test ' int2str(test) '... Done.'],'spmd',1);
        
        % Test line break on errors
        waittext(0,'init');
        for i = 0:101
            waittext(i,'spmd','all');
            if i == 50
                try
                    error('waittext:waittext_testspmd:ErrorTest',...
                          'Testing Error Behavior')
                catch ME
                    disp(getReport(ME))
                    break
                end
            end
            pause(0.02)
        end
        waittext(0,'init');
        test = test+1;
        waittext(['Test ' int2str(test) '... Done.'],'spmd',1);
        
        % Test clear
        waittext(0,'init');
        waittext('Test clear.','spmd','all');
        waittext(0,'clear')

        waittext(0,'init');
        test = test+1;
        waittext(['Test ' int2str(test) ' ... Done.'],'spmd',1);
    end
    
    disp(['WAITTEXT_TESTSPMD: ' int2str(test{1}) ' tests successfully '...
          'completed.']);
end