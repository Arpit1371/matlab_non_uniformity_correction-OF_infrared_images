%%Step1: sort v_column put it in column_sorted
%Step2: for each entry v_column(i) find indice j of column_sorted such that
function out =  specify_column( img , w1, h1, column_current , target_values)
    column_sorted = [];
    for i = 0:h1-1
        
        column_sorted(end+1) = img(i*w1+column_current +1);
        
    end
    
    sort(column_sorted) ;
    
    
    
    
    %%step2
    
    for i =0: h1-1
        temp = img(i*w1+column_current+1) ;
        for j = 0:h1-1
            if(temp == column_sorted(1,j+1) )
                img(i*w1+column_current +1)=target_values(j+1) ;
            end
        end
    end
    out = img;
    return;
end

                
    
    
    
    
    
