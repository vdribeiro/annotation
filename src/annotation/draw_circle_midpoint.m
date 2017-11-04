function ret = draw_circle_midpoint( x0, y0, radius, color)
%draw_circle_midpoint draws a circle with midpoint algorithm

    x = 0;
    y = radius;
    p = (5 - radius*4)/4;

    aux_circle(x0, y0, x, y, color);
    while (x < y)
        x = x + 1;
        if (p < 0)
            p = p + 2 * x + 1;
        else
            y = y -1;
            p = p + 2 * (x - y) + 1;
        end
        aux_circle(x0, y0, x, y, color);
    end
end

