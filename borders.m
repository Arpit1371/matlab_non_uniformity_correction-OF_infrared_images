function ans = borders(img , mod, w1 , h1 , B )

    %copying_in_middle
    for c= 0: w1 -1
        for l = 0:h1-1
            mod(l*(w1+2*B)+B+c +1 ) = img(l*w1+c+1 ) ;
            
        end
    end
    
    
    %copying_in_left
    for c= -B : -1
        for l = 0: h1-1
            mod(l*(w1+2*B)+B+c +1 ) = img((l*w1)-c+1);
        end
    end
    
    %copying_in_right
    for c= w1 :  w1 +B -1
        for l = 0:h1-1
            mod(l*(w1+(2*B))+B+c +1 ) = img(l*w1 + (2*w1-c-1) +1) ;
        end
    end
    ans = mod;
    
    return;
    
end
        

