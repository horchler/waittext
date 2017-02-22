function waittext_test(benchmark)
%WAITTEXT_TEST  Suite of unit tests and benchmarks for WAITTEXT. 
%   WAITTEXT_TEST is used for development of the WAITTEXT function and runs a
%   series of unit tests to confirm proper operation.
%
%   WAITTEXT_TEST(BENCHMARK) when BENCHMARK is true runs a series of benchmarks
%   that compare usage of WAITTEXT to a FOR loop with no printing and the
%   WAITBAR function.
%
%   See also WAITTEXT, WAITBAR.

%   Andrew D. Horchler, horchler @ gmail . com, Created 6-8-12
%   Revision: 1.0, 6-14-12

% Inspired by:
% blogs.mathworks.com/loren/2007/08/01/monitoring-progress-of-a-calculation/#7


isBenchmark = false;
if nargin > 0
    if ~islogical(benchmark)
        error('waittext:waittext_test:NonLogicalBenchmark',...
              'Input must be a logical value (true or false).');
    end
    isBenchmark = benchmark;
end

test = 0;
if isBenchmark
    n = 100;
    
    % Zero pause for tight loop
    p = 0;
    
        test = test+1;
    disp(['Benchmark ' int2str(test) ...
        ': tight loop, FOR loop with no printing.'])
    for i = 0:n
        pause(p)
    end
    tic
    for i = 0:n
        pause(p)
    end
    toc
    fprintf(1,'\n');
    
    test = test+1;
    disp(['Benchmark ' int2str(test) ': tight loop, waittext(x,''fraction'')'])
    waittext(0,'init')
    for i = 0:n
        pause(p)
        waittext(i/n,'fraction')
    end
    waittext(0,'clear')
    tic
    waittext(0,'init')
    for i = 0:n
        pause(p)
        waittext(i/n,'fraction')
    end
    waittext(0,'clear')
    toc
    fprintf(1,'\n');
    
    test = test+1;
    disp(['Benchmark ' int2str(test) ': tight loop, waittext(x,''waitbar'')'])
    waittext(0,'init')
    for i = 0:n
        pause(p)
        waittext(i/n,'waitbar')
    end
    waittext(0,'clear')
    tic
    waittext(0,'init')
    for i = 0:n
        pause(p)
        waittext(i/n,'waitbar')
    end
    waittext(0,'clear')
    toc
    fprintf(1,'\n');
    
    test = test+1;
    disp(['Benchmark ' int2str(test) ': tight loop, waitbar(x)'])
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
    
    % Change to slower loop
    p = 0.05;
    
    test = test+1;
    disp(['Benchmark ' int2str(test) ': FOR loop with no printing.'])
    for i = 0:n
        pause(p)
    end
    tic
    for i = 0:n
        pause(p)
    end
    toc
    fprintf(1,'\n');
    
    test = test+1;
    disp(['Benchmark ' int2str(test) ': waittext(x,''fraction'')'])
    waittext(0,'init')
    for i = 0:n
        pause(p)
        waittext(i/n,'fraction')
    end
    waittext(0,'clear')
    tic
    waittext(0,'init')
    for i = 0:n
        pause(p)
        waittext(i/n,'fraction')
    end
    waittext(0,'clear')
    toc
    fprintf(1,'\n');
    
    test = test+1;
    disp(['Benchmark ' int2str(test) ': waittext(x,''waitbar'')'])
    waittext(0,'init')
    for i = 0:n
        pause(p)
        waittext(i/n,'waitbar')
    end
    waittext(0,'clear')
    tic
    waittext(0,'init')
    for i = 0:n
        pause(p)
        waittext(i/n,'waitbar')
    end
    waittext(0,'clear')
    toc
    fprintf(1,'\n');
    
    test = test+1;
    disp(['Benchmark ' int2str(test) ': waitbar(x)'])
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
    
    disp(['WAITTEXT_TEST: ' int2str(test) ...
        ' benchmarks successfully completed.'])
else
    % Test default
    waittext(0,'init');
    for i = 0:101
        waittext(i);
        pause(0.02)
    end
    test = test+1;
    waittext(['Test ' int2str(test) '... Done.']);

    % Test message by passing escape characters
    waittext(0,'init')
    for i = 0:100
        waittext(['Message #' int2str(i) '% ''\'])
        pause(0.02)
    end
    test = test+1;
    waittext(['Test ' int2str(test) '... Done.']);

    % Test iteration
    waittext(0,'init');
    for i = 0:101
        waittext(i,'iteration');
        pause(0.02)
    end
    test = test+1;
    waittext(['Test ' int2str(test) '... Done.']);

    % Test percent
    waittext(0,'init');
    for i = 0:100
        waittext(i,'percent');
        pause(0.02)
    end
    test = test+1;
    waittext(['Test ' int2str(test) '... Done.']);

    % Test fraction
    waittext(0,'init');
    for i = 0:101
        waittext(i/101,'fraction');
        pause(0.02)
    end
    test = test+1;
    waittext(['Test ' int2str(test) '... Done.']);

    % Test countdown
    waittext(0,'init');
    for i = 101:-1:0
        waittext(i,'countdown');
        pause(0.02)
    end
    test = test+1;
    waittext(['Test ' int2str(test) '... Done.']);

    % Test default waitbar
    waittext(0,'init')
    for i = 0:101
        waittext(i/101,'waitbar')
        pause(0.02)
    end
    test = test+1;
    waittext(['Test ' int2str(test) '... Done.']);

    % Test waitbar with escape character as indicator
    waittext(0,'init')
    for i = 0:101
        waittext(i/101,'waitbar','%')
        pause(0.02)
    end
    test = test+1;
    waittext(['Test ' int2str(test) '... Done.']);

    % Test waitbar with escape character as indicator
    waittext(0,'init')
    for i = 0:101
        waittext(i/101,'waitbar','\')
        pause(0.02)
    end
    test = test+1;
    waittext(['Test ' int2str(test) '... Done.']);

    % Test waitbar with escape character as indicator
    waittext(0,'init')
    for i = 0:101
        waittext(i/101,'waitbar','''')
        pause(0.02)
    end
    test = test+1;
    waittext(['Test ' int2str(test) '... Done.']);

    % Test waitbar with maximum custom length
    waittext(0,'init')
    for i = 0:101
        waittext(i/101,'waitbar',78)
        pause(0.02)
    end
    test = test+1;
    waittext(['Test ' int2str(test) '... Done.']);

    % Test waitbar with prefix and suffix using escape characters
    opts = struct('prefix','Waiting: \''%','suffix',' \''% ');
    waittext(0,'init')
    for i = 0:101
        waittext(i/101,'waitbar',opts)
        pause(0.02)
    end
    test = test+1;
    waittext(['Test ' int2str(test) '... Done.']);

    % Test waitbar with custom indicator, length, and prefix
    opts = struct('indicator','>','length',25,'prefix','Waiting: ');
    waittext(0,'init')
    for i = 0:101
        waittext(i/101,'waitbar',opts)
        pause(0.02)
    end
    test = test+1;
    waittext(['Test ' int2str(test) '... Done.']);

    % Test waitbar with custom indicator, length, prefix, and suffix
    opts = struct('indicator','=','length',30,'prefix','Waiting: ',...
        'suffix',' !!');
    waittext(0,'init')
    for i = 0:101
        waittext(i/101,'waitbar',opts)
        pause(0.02)
    end
    test = test+1;
    waittext(['Test ' int2str(test) '... Done.']);

    % Test catching of warnings
    waittext(0,'init');
    for i = 0:101
        waittext(i);
        if i == 50
            warning('waittext:waittext_test:WarningCatchTest',...
                    'Testing Warning Catch')
        end
        pause(0.02)
    end
    test = test+1;
    waittext(['Test ' int2str(test) '... Done.']);

    % Test line break on errors
    waittext(0,'init');
    for i = 0:101
        waittext(i);
        if i == 50
            try
                error('waittext:waittext_test:ErrorTest',...
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
    waittext(['Test ' int2str(test) '... Done.']);

    % Test clear
    waittext(0,'init');
    waittext('Test clear.');
    waittext(0,'clear')

    waittext(0,'init');
    test = test+1;
    waittext(['Test ' int2str(test) ' ... Done.']);

    disp(['WAITTEXT_TEST: ' int2str(test) ' tests successfully completed.'])
end