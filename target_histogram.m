%%Compute the midway Gaussian averaged histogram. Gaussian weighted,
%/// troncated with radius equal to 4 sigma:
%/// only the columns in the interval ["column"-4sigma, "column"+4sigma] are
%/// taken into account.

%///Step1 : extract columns columns in the interval ["column"-4sigma,
%///  "column"+4sigma]
%///  Step2 : Sort all vectors obtained from step1 separately
%///  Step3 : for all lines and all column of step2 compute the midway gaussian
%///  averaged ie :

function out =  target_histogram(V_HISTOS, w1,  h1,  sigma)
    %step1&2
    N=round(4*sigma);
    final = zeros( w1 - 2*N ,h1);
    
    
    
    for CENTER = N : w1-N-1 
        v = zeros(h1,1) ;
        for vline = 0:h1-1 
            temp = 0;
            for vcolumn =  CENTER-N : CENTER+N
                
                
                temp =  temp + gaussian((CENTER - vcolumn),sigma) *(V_HISTOS(vcolumn+1 , vline+1));
            end
            final(CENTER-N+1,vline+1)  = temp ;
        end
        
    end
     
    out = final;
    return 
end

    
    
    