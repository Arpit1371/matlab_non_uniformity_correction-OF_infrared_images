function out = TV_column_norm( IMAGE,  w1,  h1, B)
    out = 0;
    for column = B : w1-B-1 
        for line = 0 : h1-1
            out = out + abs((IMAGE(line*w1+column+1+1))-IMAGE(line*w1+column +1));
        end
    end
    return
end