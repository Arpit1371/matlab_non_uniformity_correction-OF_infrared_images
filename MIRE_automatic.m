%%
function image  = MIRE_automatic(img , w1 , h1 , sigma_min , sigma_max , delta)
    Imtemp = zeros(h1*w1,1) ;
    
    %initializing_------
    sigma_best = sigma_min ;
    
    for i = 0 : (w1*h1 -1)
        Imtemp(i+1) = img(i+1);
    end
    
    if sigma_min == 0 
        TV_current =  TV_column_norm(Imtemp,w1,h1,4*sigma_max);
    
    
    else
        TV_current=TV_column_norm(MIRE(Imtemp,sigma_min,w1,h1),w1,h1,4*sigma_max);
    end
    

    
    TV_min = TV_current;
    sigma_current = sigma_min;
    
    %guessing_best_sigma^
    
    
    T=round(((sigma_max - sigma_min)/delta))+1;
    
    for i = 0:T-1 
        
        for j= 0: w1*h1-1
            Imtemp(j+1)  = img(j+1) ;
        end
        
        TV_current = TV_column_norm(MIRE(Imtemp,sigma_current,w1,h1),w1,h1,4*sigma_max);
        if (TV_current < TV_min)
        
            sigma_best = sigma_current;
            TV_min = TV_current;
        end
        sigma_current = sigma_current + delta;
        
    end
    
    clear Im_temp;
    
    image = img;
    
    %applying_MIRE_with_best_sigma
    if(sigma_best ~= 0)
        image = MIRE( img , sigma_best , w1, h1) ;
        
    
    end
    
    sigma = sigma_best;
    
    
    return;
    
    
    
    
end
    
    
    
        
    
    
    
    
    