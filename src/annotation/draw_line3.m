function [ output_args ] = draw_line3( x0,y0,x1,y1,color,background)

    %y = mx + b
    m = y1 - y0 / x1 - x0;
    b = y0 - m * x0;
    

    %vertical line 
    if x0 == x1
        if y0 > y1
             
            for i = y1 : y0
                x = round( (i - b) / m ); 
                plot(x,i, 'Color', color);
            end
            
        else
            
            for i = y0 : y1
                x = round( (i - b) / m ); 
                plot(x,i, 'Color', color);
            end
            
        end
        
    %horizontal line
    elseif y0 == y1
        if x0 > x1
             
            for i = x1 : x0
                y = round( m * i + b); 
                plot(i,y, 'Color', color);
            end
            
        else
            
            for i = x0 : x1
                y = round( m * i + b);  
                plot(i,y, 'Color', color);
            end
            
        end
        
    %diagonal line
    else
        if x0 > x1

            for i = x1 : x0
                y = round( m * i + b); 
                plot(i,y, '--rs', 'Color', color);
            end

        else

            for i = x0 : x1
                y = round( m * i + b);  
                plot(i,y, '--rs','Color', color);
            end
            
        end
    end
    
        
    
    
end

