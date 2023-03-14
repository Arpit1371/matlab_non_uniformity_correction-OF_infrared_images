function out = histo_column(IMAGE, w1, h1,column)
    v = zeros(1,h1);
    
    for line = 0:h1-1 
        v(line+1) = IMAGE(line*w1+column +1) ;
    end
    
    sort(v);
    
    out = v;
    return;
end
