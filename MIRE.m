%% perform mire algo with parameter sigma
function image = MIRE(img , sigma , w1 , h1) 
    c_sorted = column_sorting(img,w1,h1);
    v = target_histogram(c_sorted,w1,h1,sigma);
    N = round(4*sigma);
    % v=target histogram
    
    
    for column = N: w1-N-1
        img = specify_column(img,w1,h1,column,v(column-N+1,:));
    end
    
    image = img ;
    return
end
    