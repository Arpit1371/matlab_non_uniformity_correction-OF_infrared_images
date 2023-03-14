function out = column_sorting(IMAGE,  w1,  h1)
    V_HISTOS = [];
    
    for i= 0:w1-1
        arr = histo_column(IMAGE, w1, h1,  i) ;
        V_HISTOS = [V_HISTOS ; arr];
    end
    out = V_HISTOS ;
    
    return ;
end

        
        