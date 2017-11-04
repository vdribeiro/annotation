function ret = aux_circle( cx, cy, x, y, color)
%aux_circle

    if (x == 0)
        plot(cx, cy + y, 'Color', color);
        plot(cx, cy - y, 'Color', color);
        plot(cx + y, cy, 'Color', color);
        plot(cx - y, cy, 'Color', color);
    elseif (x == y)
        plot(cx + x, cy + y, 'Color', color);
        plot(cx - x, cy + y, 'Color', color);
        plot(cx + x, cy - y, 'Color', color);
        plot(cx - x, cy - y, 'Color', color);
    elseif (x < y)
        plot(cx + x, cy + y, 'Color', color);
        plot(cx - x, cy + y, 'Color', color);
        plot(cx + x, cy - y, 'Color', color);
        plot(cx - x, cy - y, 'Color', color);
        plot(cx + y, cy + x, 'Color', color);
        plot(cx - y, cy + x, 'Color', color);
        plot(cx + y, cy - x, 'Color', color);
        plot(cx - y, cy - x, 'Color', color);
    end
end

