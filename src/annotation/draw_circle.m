function ret = draw_circle( x0, y0, radius, color)
%draw_circle plots a circle

    r2 = radius * radius;
    
    plot(x0, y0 + radius, 'Color', color);
    plot(x0, y0 - radius, 'Color', color);
    
    for x = 1:radius
        y = sqrt(r2 - x*x) + 0.5;
        plot( x0 + x, y0 + y, 'Color', color);
        plot( x0 + x, y0 - y, 'Color', color);
        plot( x0 - x, y0 + y, 'Color', color);
        plot( x0 - x, y0 - y, 'Color', color);
    end
end

