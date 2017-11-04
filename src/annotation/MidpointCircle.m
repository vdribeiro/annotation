function [points] = MidpointCircle( radius, xc, yc, color, draw)

    xc = int16(xc);
    yc = int16(yc);

    x = int16(0);
    y = int16(radius);
    d = int16(1 - radius);

    if draw
        plot(xc,yc+y,'LineWidth',1, 'Color', color);
        plot(xc, yc-y,'LineWidth',1, 'Color', color);
        plot(xc+y, yc,'LineWidth',1, 'Color', color);
        plot(xc-y, yc,'LineWidth',1, 'Color', color);
    else
        points = [xc yc+y; xc yc-y; xc+y yc; xc-y yc];
    end
    
    while ( x < y - 1 )
        x = x + 1;
        if ( d < 0 ) 
            d = d + x + x + 1;
        else 
            y = y - 1;
            a = x - y + 1;
            d = d + a + a;
        end

        
        if draw
            plot(x+xc,  y+yc,'LineWidth',1, 'Color', color);
            plot(y+xc,  x+yc,'LineWidth',1, 'Color', color);
            plot(y+xc, -x+yc,'LineWidth',1, 'Color', color);
            plot(x+xc, -y+yc,'LineWidth',1, 'Color', color);
            plot(-x+xc, -y+yc,'LineWidth',1, 'Color', color);
            plot(-y+xc, -x+yc,'LineWidth',1, 'Color', color);
            plot(-y+xc,  x+yc,'LineWidth',1, 'Color', color);
            plot(-x+xc,  y+yc,'LineWidth',1, 'Color', color);
        else
            points = [points; x+xc y+yc];
            points = [points; y+xc x+yc];
            points = [points; y+xc -x+yc];
            points = [points; x+xc -y+yc];
            points = [points; -x+xc -y+yc];
            points = [points; -y+xc -x+yc];
            points = [points; -y+xc x+yc];
            points = [points; -x+xc y+yc];
            
        end
    end
end
