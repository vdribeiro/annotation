function ret = draw_line(x0, y0, x1, y1, color, boundsArray)
%draw_line draws a line from p1 to p2
     
    dx = abs(x1-x0);
    dy = abs(y1-y0);
    
    if x0 < x1 
        sx = 1;
    else
        sx = -1;
    end
    
    if y0 < y1 
        sy = 1;
    else
        sy = -1;
    end 
        
    err = dx-dy;

    
    variable = true;
    counter = 0;
    
    while(variable)
        counter = counter + 1;
        if(x0 >= 0 && x0 < boundsArray(1) && y0 >= 0 && y0 < boundsArray(2))
            plot(x0,y0, 'Color', color);
        end
        
        if counter > 200000 || (x0 == x1 && y0 == y1) 
            variable = false;
        else         
            e2 = 2*err;
            if e2 > -dy 
                err = err - dy;
                x0 = x0 + sx;
            end

            if e2 <  dx 
                err = err + dx;
                y0 = y0 + sy;
            end
            
        end
    end
end

